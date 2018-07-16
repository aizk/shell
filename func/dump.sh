#!/bin/bash

# 数据来源
src_user="root" # 用户名
src_password="root" # 密码
src_host="192.168.118.174" # Host
src_port="3306" # 端口
src_database="sq_kaoyaya" # 数据库名
# src_table="xueyoo_record xueyoo_record_01 xueyoo_record_02 xueyoo_record_03 xueyoo_record_04 xueyoo_record_05 xueyoo_record_06 xueyoo_record_07 xueyoo_record_08 xueyoo_record_09 xueyoo_record_10 xueyoo_record_11 xueyoo_record_12 xueyoo_record_13 xueyoo_record_14 xueyoo_record_15 xueyoo_record_16 xueyoo_record_17 xueyoo_record_18 xueyoo_record_19 xueyoo_record_20 xueyoo_record_21 xueyoo_record_22 xueyoo_record_23 xueyoo_record_24 xueyoo_record_25 xueyoo_record_26 xueyoo_record_27 xueyoo_record_28 xueyoo_record_29 xueyoo_record_30 xueyoo_record_31 xueyoo_record_32 xueyoo_record_33 xueyoo_record_34 xueyoo_record_35 xueyoo_record_36 xueyoo_record_37 xueyoo_record_38 xueyoo_record_39 xueyoo_record_40 xueyoo_record_41 xueyoo_record_42 xueyoo_record_43 xueyoo_record_44 xueyoo_record_45 xueyoo_record_46 xueyoo_record_47 xueyoo_record_48 xueyoo_record_49 xueyoo_record_50" # 表名
src_table="xueyoo_record xueyoo_record_01"

# 数据导入的数据库配置
dst_user="root" # 用户名
dst_password="root" # 密码
dst_host="127.0.0.1" # Host
dst_port="3306" # 端口
dst_database="sq_kaoyaya" # 数据库名

mysqldump --host=$src_host --port=$src_port -u$src_user -p$src_password --databases $src_database --tables $src_table | mysql --host=$dst_host --port=$dst_port -u$dst_user -p$dst_password $dst_database