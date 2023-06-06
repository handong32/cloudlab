#!/bin/bash

set -x

sudo ./cpufreq-set-all -g userspace

sudo cpufreq-info
