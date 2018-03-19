#!/bin/bash
#ssh to servers d is deve t is tenct

set -e

read -p "Connect to the services name [d] is develop [t] is tenct:" s

if [ $s == "d" ]; then
    ssh deployer@114.215.43.120
fi

if [ $s == "t" ]; then
    ssh ubuntu@119.29.175.173
fi