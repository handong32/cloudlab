echo "set to $1:"
echo "$1" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
