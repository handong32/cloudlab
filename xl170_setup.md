apt-get update

apt-get install cpufrequtils msr-tools netperf

# disable HT
echo off | sudo tee /sys/devices/system/cpu/smt/control

# enable MSR
modprobe msr

# disable TurboBoost
echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo
