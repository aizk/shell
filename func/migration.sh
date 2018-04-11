#!/bin/bash
# 创建 migration 文件

set -e

read -p "输入创建文件名:" tablename

migrate create -ext sql -dir migrations $tablename