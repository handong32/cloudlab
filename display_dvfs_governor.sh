echo "current DVFS governor:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

echo "available DVFS governors:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
