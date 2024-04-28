#!/bin/bash

#!/bin/bash

currdate=`date +%m_%d_%Y_%H_%M_%S`

export ITER=${ITER:="0"}
export BEGIN_ITER=${BEGIN_ITER:="0"}
export MQPS=${MQPS:="100000 200000 300000 400000 500000 600000"}
export NITERS=${NITERS:="3"}
export AGENTS=${AGENTS:-"192.168.1.2,192.168.1.3,192.168.1.4,192.168.1.5"}
export TBENCH_SERVER=${TBENCH_SERVER:-"192.168.1.20"}

function warmup
{
    echo "🟢🟢 Preload memcached server with data 🟢🟢"
    for ((i=0;i<16;i++)); do
	~/mutilate/mutilate --binary -s $TBENCH_SERVER --loadonly -K fb_key -V fb_value
    done
    echo "🟢🟢 Warmup START 🟢🟢"
    taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=fb_key --valuesize=fb_value --iadist=fb_ia --update=0.25 --depth=4 --measure_depth=1 --connections=8 --measure_connections=32 --measure_qps=2000 --qps=10000 --time=10
    echo "🟢🟢 Warmup END 🟢🟢"
}

function run
{
    echo ${TBENCH_SERVER} ${ITER} ${MQPS} ${AGENTS}
    name="linux_qps${MQPS}_iter${ITER}"
    ssh $TBENCH_SERVER perf stat -a -e instructions,cycles,ref-cycles,power/energy-pkg/,cpu-clock -x, -o PerfStat.$name ~/memcached/memcached -u nobody -t 32 -m 82G -c 8192 -o hashpower=20 -b 8192 -l 192.168.1.20 -B binary -L &
    sleep 1
    
    warmup
    
    echo "🟢🟢 START 🟢🟢"
    
	
    echo "taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=fb_key --valuesize=fb_value --iadist=fb_ia --update=0.25 --depth=4 --measure_depth=1 --connections=8 --measure_connections=32 --measure_qps=2000 --qps=${MQPS} --time=30 > $name.out"
    taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=fb_key --valuesize=fb_value --iadist=fb_ia --update=0.25 --depth=4 --measure_depth=1 --connections=8 --measure_connections=32 --measure_qps=2000 --qps=${MQPS} --time=30 > $name.out
    ssh $TBENCH_SERVER pkill memcached
    scp -r $TBENCH_SERVER:~/PerfStat.$name .
    echo "🟢🟢 END 🟢🟢"
}

$@
