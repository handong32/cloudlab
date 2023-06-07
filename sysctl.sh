#!/bin/bash

#set -x
#https://enterprise-support.nvidia.com/s/article/linux-sysctl-tuning

function list
{
    #net.ipv4.tcp_timestamps = 1
    #net.ipv4.tcp_sack = 1
    #net.core.netdev_max_backlog = 1000
    #net.core.rmem_max = 212992
    #net.core.wmem_max = 212992
    #net.core.rmem_default = 212992
    #net.core.wmem_default = 212992
    #net.core.optmem_max = 20480
    ##net.ipv4.tcp_rmem = 4096        131072  6291456
    #net.ipv4.tcp_wmem = 4096        16384   4194304
    #net.ipv4.tcp_low_latency = 0
    #net.ipv4.tcp_adv_win_scale = 1

    #Disable the TCP timestamps option for better CPU utilization
    sysctl net.ipv4.tcp_timestamps
    #sysctl -w net.ipv4.tcp_timestamps=0

    #Enable the TCP selective acks option for better throughput:
    # Unless there is high latency or high packet loss, it is most likely better to keep SACK turned off over a high performance network.
    sysctl net.ipv4.tcp_sack
    #sysctl -w net.ipv4.tcp_sack=1

    #Increase the maximum length of processor input queues
    sysctl net.core.netdev_max_backlog
    #sysctl -w net.core.netdev_max_backlog=250000

    #Increase the TCP maximum and default buffer sizes using setsockopt():
    sysctl net.core.rmem_max
    sysctl net.core.wmem_max
    sysctl net.core.rmem_default
    sysctl net.core.wmem_default
    sysctl net.core.optmem_max

    #sysctl -w net.core.rmem_max=4194304
    #sysctl -w net.core.wmem_max=4194304
    #sysctl -w net.core.rmem_default=4194304
    #sysctl -w net.core.wmem_default=4194304
    #sysctl -w net.core.optmem_max=4194304

    # Increase memory thresholds to prevent packet dropping:
    sysctl net.ipv4.tcp_rmem
    sysctl net.ipv4.tcp_wmem

    #sysctl -w net.ipv4.tcp_rmem="8192 262144 536870912"
    #sysctl -w net.ipv4.tcp_wmem="4096 16384 536870912"

    # Enable low latency mode for TCP:
    sysctl net.ipv4.tcp_low_latency
    # sysctl -w net.ipv4.tcp_low_latency=1

    #The following variable is used to tell the kernel how much of the socket buffer space should be used for TCP window size, and how much to save for an application buffer. A value of 1 means the socket buffer will be divided evenly between TCP windows size and application.
    sysctl net.ipv4.tcp_adv_win_scale
    #sysctl -w net.ipv4.tcp_adv_win_scale=1 

    ## https://access.redhat.com/sites/default/files/attachments/20150325_network_performance_tuning.pdf
    #ethtool -G ens1f1np1 rx 8192 tx 8192
    #sudo ip link set dev ens1f1np1 txqueuelen 2000

}

function set
{
    #Disable the TCP timestamps option for better CPU utilization
    sysctl -w net.ipv4.tcp_timestamps=0

    #Enable the TCP selective acks option for better throughput:
    # Unless there is high latency or high packet loss, it is most likely better to keep SACK turned off over a high performance network.
    sysctl -w net.ipv4.tcp_sack=1

    #Increase the maximum length of processor input queues
    sysctl -w net.core.netdev_max_backlog=250000

    #Increase the TCP maximum and default buffer sizes using setsockopt():
    sysctl -w net.core.rmem_max=4194304
    sysctl -w net.core.wmem_max=4194304
    sysctl -w net.core.rmem_default=4194304
    sysctl -w net.core.wmem_default=4194304
    sysctl -w net.core.optmem_max=4194304

    # Increase memory thresholds to prevent packet dropping:
    sysctl -w net.ipv4.tcp_rmem="8192 262144 536870912"
    sysctl -w net.ipv4.tcp_wmem="4096 16384 536870912"

    # Enable low latency mode for TCP:
    #sysctl net.ipv4.tcp_low_latency
    # sysctl -w net.ipv4.tcp_low_latency=1

    #The following variable is used to tell the kernel how much of the socket buffer space should be used for TCP window size, and how much to save for an application buffer. A value of 1 means the socket buffer will be divided evenly between TCP windows size and application.
    sysctl -w net.ipv4.tcp_adv_win_scale=1 

    ## https://access.redhat.com/sites/default/files/attachments/20150325_network_performance_tuning.pdf
    #ethtool -G ens1f1np1 rx 8192 tx 8192
    #sudo ip link set dev ens1f1np1 txqueuelen 2000

}

"$@"
