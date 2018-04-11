#!/bin/bash
# 从服务器下载文件

set -e

read -p "文件在服务器的路径:" s

read -p "下载到本地的路经与文件名:" d

scp deployer@114.215.43.120:$s $d