#!/bin/bash

POLL=0
C1=0
C1E=0
C3=0
C6=0
RXP=0
RXB=0
TXP=0
TXB=0

for (( c=0; c<$(nproc); c++ ))
do    
    POLL=$((POLL + $(cat /sys/devices/system/cpu/cpu${c}/cpuidle/state0/usage)))
    C1=$((POLL + $(cat /sys/devices/system/cpu/cpu${c}/cpuidle/state1/usage)))
    C1E=$((POLL + $(cat /sys/devices/system/cpu/cpu${c}/cpuidle/state2/usage)))
    C3=$((POLL + $(cat /sys/devices/system/cpu/cpu${c}/cpuidle/state3/usage)))
    C6=$((POLL + $(cat /sys/devices/system/cpu/cpu${c}/cpuidle/state4/usage)))
done

tmp=$(ifconfig | grep -A5 10.10.1 | grep 'RX packets' | grep '\w*')
RXP=$(echo $tmp | cut -f3 -d' ')
RXB=$(echo $tmp | cut -f5 -d' ')

tmp=$(ifconfig | grep -A5 10.10.1 | grep 'TX packets' | grep '\w*')
TXP=$(echo $tmp | cut -f3 -d' ')
TXB=$(echo $tmp | cut -f5 -d' ')

echo $POLL, $C1, $C1E, $C3, $C6, $RXP, $RXB, $TXP, $TXB
