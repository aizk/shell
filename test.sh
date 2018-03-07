# 别名 alias
alias dc='docker-compose'

# 变量
## 设置变量
value=gg
## 执行命令赋值变量
version=$(uname -r)
echo $version
## 执行命令赋值变量
version_a=`uname -r`
echo $version_a

# 输出
echo $value
echo ${value}
## 单引号 $ 无用
echo 'gg $value'
## 双引号 $ 可用
echo "gg $value"
## 输出命令执行结果
echo $(uname -r)

# 删除变量
#unset value

# 追加结果
value=${value}:12345
echo $value

# 导出变量
export value


# 日期

read -p "value" value

echo $value

# 判断空字符串
value=${value:-"value"}

echo $value