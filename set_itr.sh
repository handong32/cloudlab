#!/bin/bash

set -x

function static_r320
{
    sudo setcap cap_net_admin+ep /usr/sbin/ethtool

    ieth=$(ifconfig | grep -B1 192.168.1 | grep -o "^\w*")
    ethtool -c ${ieth}
    
    # disable dynamic ITR
    ethtool -C ${ieth} adaptive-rx off
    ethtool -C ${ieth} rx-usecs 2
    
    echo ""
    ethtool -c ${ieth}
    
}

function static_mlnx
{
    sudo setcap cap_net_admin+ep /usr/sbin/ethtool

    ieth=$(ifconfig | grep -B1 192.168.1 | grep -o "^\w*")
    ethtool -c ${ieth}
    
    # disable dynamic ITR
    ethtool -C ${ieth} adaptive-rx off adaptive-tx off
    ethtool -C ${ieth} rx-usecs 2 tx-usecs 2
    
    echo ""
    ethtool -c ${ieth}
}

function dynamic
{
    sudo setcap cap_net_admin+ep /usr/sbin/ethtool
    
    ieth=$(ifconfig | grep -B1 192.168.1 | grep -o "^\w*")
    ethtool -c ${ieth}
    
    # disable dynamic ITR
    ethtool -C ${ieth} adaptive-rx on adaptive-tx on
    #ethtool -C ens1f1np1 rx-usecs 2 tx-usecs 2
    
    echo ""
    ethtool -c ${ieth}
}

"$@"
