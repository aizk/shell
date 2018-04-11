#!/bin/bash
# 上传文件到服务器

set -e

read -p "文件在本地的路径:" s
read -p "上传到服务器的路经与文件名:" d

scp $s deployer@114.215.43.120:$d