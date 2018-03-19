#!/bin/bash
#install docker-ce and set mirror acceleration address

set -e

curl http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -o  /etc/yum.repos.d/docker-ce.repo

yum -y install docker-ce

curl -sSL http://oyh1cogl9.bkt.clouddn.com/setmirror.sh | bash -s https://reg-mirror.qiniu.com