#!/bin/bash
# 启动目录下的 go 应用

set -e

if [ ! -f ".env" ]; then
    echo "no .env"
    exit
fi

for line in $(cat .env)
do
    export ${line}
done

go run *.go