#!/bin/bash

set -x

currdate=`date +%m_%d_%Y_%H_%M_%S`

export ITER=${ITER:="0"}
export BEGIN_ITER=${BEGIN_ITER:="0"}
export MQPS=${MQPS:="100000"}
export NITERS=${NITERS:="3"}
export AGENTS=${AGENTS:-"192.168.1.2,192.168.1.3,192.168.1.4,192.168.1.5"}
export TBENCH_SERVER=${TBENCH_SERVER:-"192.168.1.12"}

function overhead
{
    echo ${TBENCH_SERVER} ${ITER} ${MQPS} ${AGENTS}
    name="linux_silo_iter${ITER}"
    
    ssh $TBENCH_SERVER LD_LIBRARY_PATH=/users/hand32/zygos-benchmark/silo/third-party/lz4/ perf stat -a -e power/energy-pkg/ -x, -o PerfStat.Joules.Overhead.$name /users/hand32/zygos-benchmark/servers/silotpcc-linux &
    sleep 50
    ssh $TBENCH_SERVER pkill silotpcc-linux
    
    sleep 5

    ssh $TBENCH_SERVER LD_LIBRARY_PATH=/users/hand32/zygos-benchmark/silo/third-party/lz4/ perf stat -C 0-62 -e instructions,cycles,ref-cycles,cpu-clock -x, -o PerfStat.Ins.Overhead.$name /users/hand32/zygos-benchmark/servers/silotpcc-linux &
    sleep 50
    ssh $TBENCH_SERVER pkill silotpcc-linux
    sleep 5
    
    scp -r $TBENCH_SERVER:~/PerfStat.Joules.Overhead.$name .
    scp -r $TBENCH_SERVER:~/PerfStat.Ins.Overhead.$name .    
}

function run
{
    echo ${TBENCH_SERVER} ${ITER} ${MQPS} ${AGENTS}
    name="linux_silo_mqps${MQPS}_iter${ITER}"
    
    ssh $TBENCH_SERVER "ulimit -n 8192 && LD_LIBRARY_PATH=/users/hand32/zygos-benchmark/silo/third-party/lz4/ perf stat -a -e power/energy-pkg/ -x, -o PerfStat.Joules.$name /users/hand32/zygos-benchmark/servers/silotpcc-linux" &
    sleep 50
    taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=19 --valuesize=2 --update=0.002 --depth=4 --measure_depth=1 --connections=10 --measure_connections=32 --measure_qps=2000 --qps=${MQPS} --time=30 > $name.out
    ssh $TBENCH_SERVER pkill silotpcc-linux

    sleep 10

    ssh $TBENCH_SERVER "ulimit -n 8192 && LD_LIBRARY_PATH=/users/hand32/zygos-benchmark/silo/third-party/lz4/ perf stat -C 0-62 -e instructions,cycles,ref-cycles,cpu-clock -x, -o PerfStat.Ins.$name /users/hand32/zygos-benchmark/servers/silotpcc-linux" &
    sleep 50
    taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=19 --valuesize=2 --update=0.002 --depth=4 --measure_depth=1 --connections=10 --measure_connections=32 --measure_qps=2000 --qps=${MQPS} --time=30 > $name.out
    ssh $TBENCH_SERVER pkill silotpcc-linux

    sleep 10
    
    scp -r $TBENCH_SERVER:~/PerfStat.Joules.$name .
    scp -r $TBENCH_SERVER:~/PerfStat.Ins.$name .
}

$@
