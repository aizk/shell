#!/bin/bash
#ssh to servers d is deve t is tenct

set -e

read -p "Connect to the services name [d] is develop [t] is tenct:" s

if [ $s == "d" ]; then
    ssh deployer@kyytest
fi

if [ $s == "t" ]; then
    ssh deployer@kyytest
fi