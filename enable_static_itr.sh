#!/bin/bash

set -x

sudo setcap cap_net_admin+ep /usr/sbin/ethtool

ethtool -c ens1f1np1

# disable dynamic ITR
ethtool -C ens1f1np1 adaptive-rx off adaptive-tx off
ethtool -C ens1f1np1 rx-usecs 2 tx-usecs 2

echo ""
ethtool -c ens1f1np1
