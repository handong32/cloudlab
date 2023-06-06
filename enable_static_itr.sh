#!/bin/bash

set -x

sudo ethtool -c ens1f1np1

# disable dynamic ITR
sudo ethtool -C ens1f1np1 adaptive-rx off adaptive-tx off
sudo ethtool -C ens1f1np1 rx-usecs 2 tx-usecs 2

echo ""
sudo ethtool -c ens1f1np1
