#!/bin/bash

function clean
{
    cat /proc/intlog_stats/core/*
}

function print
{
    MAX_CPU=$((`nproc` - 1))
    for i in $(seq 0 $MAX_CPU); do
	cat /proc/intlog_stats/core/$i > ~/linux.intlog.$i
    done
}

"$@"
