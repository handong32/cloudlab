#!/bin/bash

currdate=`date +%m_%d_%Y_%H_%M_%S`

export BEGIN_ITER=${BEGIN_ITER:="0"}
export MQPS=${MQPS:="100000 200000 300000 400000 500000 600000"}
export NITERS=${NITERS:="3"}
export AGENTS=${AGENTS:-"192.168.1.2,192.168.1.3,192.168.1.4,192.168.1.5"}
export TBENCH_SERVER=${TBENCH_SERVER:-"192.168.1.9"}
export TCP_SERVER=${TCP_SERVER:-"$TBENCH_SERVER:5002"}

function run
{
    echo ${TBENCH_SERVER} ${NITERS} ${MQPS} ${AGENTS} ${TCP_SERVER}

    echo "🟢🟢 Update Reta for Silo 🟢🟢"
    echo "reta,32" | socat - TCP4:$TCP_SERVER

    echo "🟢🟢 Warmup run 🟢🟢"
    echo "start,0" | socat - TCP4:$TCP_SERVER
    taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=19 --valuesize=2 --update=0.002 --depth=4 --measure_depth=1 --connections=10 --measure_connections=32 --measure_qps=2000 --qps=10000 --time=10
    echo "stop,0" | socat - TCP4:$TCP_SERVER
    echo "getcounters,0" | socat - TCP4:$TCP_SERVER

    echo "🟢🟢 Run 🟢🟢"
    for ((i=$BEGIN_ITER;i<$NITERS;i++)); do
	name="ebbrtbm_silo_qps${MQPS}_iter${i}"
	
	echo "start,0" | socat - TCP4:$TCP_SERVER
	echo "taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=19 --valuesize=2 --update=0.002 --depth=4 --measure_depth=1 --connections=8 --measure_connections=32 --measure_qps=2000 --qps=${MQPS} --time=30 > $name.out"
        taskset -c 15 ~/mutilate/mutilate --binary -s $TBENCH_SERVER --noload --agent=$AGENTS --threads=1 --keysize=19 --valuesize=2 --update=0.002 --depth=4 --measure_depth=1 --connections=10 --measure_connections=32 --measure_qps=2000 --qps=${MQPS} --time=30 > $name.out
	echo "stop,0" | socat - TCP4:$TCP_SERVER
	echo "getcounters,0" | socat - TCP4:$TCP_SERVER
	cat $name.out
	sleep 1
    done
}

$@
