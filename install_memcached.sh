#!/bin/bash

cd ~ && git clone https://github.com/memcached/memcached.git && cd ~/memcached && ./autogen.sh && ./configure && make -j
