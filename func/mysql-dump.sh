#!/bin/bash
#dump mysql

# read -p "选择数据导入导出方向:" s

# 数据来源
src_user="root" # 用户名
src_password="root" # 密码
src_host="localhost" # Host
src_port="3306" # 端口
src_database="sq_kaoyaya" # 数据库名
src_table="edu" # 表名

# 数据导入的数据库配置
dst_user="root" # 用户名
dst_password="root" # 密码
dst_host="192.168.113.174" # Host
dst_port="3306" # 端口
dst_database="sq_kaoyaya" # 数据库名


# if [ $s == "1" ]; then
#     ssh deployer@114.215.43.120
# fi

# if [ $s == "t" ]; then
#     ssh ubuntu@119.29.175.173
# fi

# 导入数据和结构
mysqldump --host=$src_host --port=$src_port --user=$src_user -p$src_password $src_database --tables $src_table | mysql --host=$dst_host --port=$dst_port -u$dst_user -p$dst_password $dst_database
