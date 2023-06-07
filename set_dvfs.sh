#!/bin/bash

set -x

function static
{
    sudo ./cpufreq-set-all -g userspace

    sudo cpufreq-info

    sudo setcap cap_sys_rawio=ep /usr/sbin/rdmsr 
    sudo setcap cap_sys_rawio=ep /usr/sbin/wrmsr 
}

function dynamic
{
    sudo ./cpufreq-set-all -g ondemand
    sudo cpufreq-info
}

"$@"
