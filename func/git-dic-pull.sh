#!/bin/bash
# 拉取当前文件夹下的所有仓库

pull(){
    cd $1
    git pull origin master
    cd ..
}

for file in ./*
do
    if test -d ${file}
    then
      pull ${file}
    fi
done
exit 0