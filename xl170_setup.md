apt-get update

apt-get install cpufrequtils msr-tools netperf

# disable HT
echo off | sudo tee /sys/devices/system/cpu/smt/control

# enable MSR
modprobe msr
