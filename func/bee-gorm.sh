#!/bin/bash
# 生成数据表对应的结构

set -e

read -p "输入表名:" tablename


bee-gorm generate appcode -tables="$tablename" -driver="mysql" --conn="root:root@tcp(192.168.118.174:3306)/sq_kaoyaya" -level=1