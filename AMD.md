AMD EPYC 7543

modprobe amd_energy

##disable HT
echo off | sudo tee /sys/devices/system/cpu/smt/control

