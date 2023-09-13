#!/bin/bash

set -x

function static
{
    sudo ./cpufreq-set-all -g userspace

    sudo cpufreq-info

    sudo setcap cap_sys_rawio=ep /usr/sbin/rdmsr 
    sudo setcap cap_sys_rawio=ep /usr/sbin/wrmsr 
}

# conservative, ondemand, userspace, powersave, performance, schedutil 
function ondemand
{
    sudo ./cpufreq-set-all -g ondemand
    sudo cpufreq-info
}

function conservative
{
    sudo ./cpufreq-set-all -g conservative
    sudo cpufreq-info
}

function powersave
{
    sudo ./cpufreq-set-all -g powersave
    sudo cpufreq-info
}

function performance
{
    sudo ./cpufreq-set-all -g performance
    sudo cpufreq-info
}

function schedutil
{
    sudo ./cpufreq-set-all -g schedutil
    sudo cpufreq-info
}

"$@"
