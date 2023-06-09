#!/bin/bash

set -x

sudo apt-get update
sudo apt-get install -y cpufrequtils msr-tools netperf openjdk-8-jdk-headless libopencv-dev python3-opencv python3-pip uuid-dev

# update opencv symlink
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/opencv4.pc /usr/lib/x86_64-linux-gnu/pkgconfig/opencv.pc

#install scipy
pip install scipy

# disable HT
echo off | sudo tee /sys/devices/system/cpu/smt/control

# disable TurboBoost
echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo

# enable MSR
sudo modprobe msr

# dump cpu freq
sudo rdmsr -a 0x199

# open port
sudo ufw allow 8080

# set irq affinity
sudo ./set_irq_affinity.sh ens1f1np1
