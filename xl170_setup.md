apt-get update

apt-get install cpufrequtils msr-tools netperf

# disable HT
echo off | sudo tee /sys/devices/system/cpu/smt/control

# enable MSR
modprobe msr

# disable TurboBoost
echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo

# disable dynamic ITR
ethtool -C ens1f1np1 adaptive-rx off adaptive-tx off
ethtool -C ens1f1np1 rx-usecs 2 tx-usecs 2
