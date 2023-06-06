#!/bin/bash

set -x

sudo ./cpufreq-set-all -g userspace

sudo cpufreq-info

sudo setcap cap_sys_rawio=ep /usr/sbin/rdmsr 
sudo setcap cap_sys_rawio=ep /usr/sbin/wrmsr 
