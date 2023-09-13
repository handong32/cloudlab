#!/bin/bash

set -x

function static
{
    sudo ~/cloudlab/cpufreq-set-all -g userspace

    sudo cpufreq-info

    sudo setcap cap_sys_rawio=ep /usr/sbin/rdmsr 
    sudo setcap cap_sys_rawio=ep /usr/sbin/wrmsr 
}

# conservative, ondemand, userspace, powersave, performance, schedutil 
function ondemand
{
    sudo ~/cloudlab/cpufreq-set-all -g ondemand
    sudo cpufreq-info
}

function conservative
{
    sudo ~/cloudlab/cpufreq-set-all -g conservative
    sudo cpufreq-info
}

function powersave
{
    sudo ~/cloudlab/cpufreq-set-all -g powersave
    sudo cpufreq-info
}

function performance
{
    sudo ~/cloudlab/cpufreq-set-all -g performance
    sudo cpufreq-info
}

function schedutil
{
    sudo ~/cloudlab/cpufreq-set-all -g schedutil
    sudo cpufreq-info
}

"$@"
