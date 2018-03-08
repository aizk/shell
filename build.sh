#!/bin/bash

set -e

i=0
# 版本号 0.6.1 以点切分
for v in $(< version xargs -d '.'); do 
	VERSION_ARR[${i}]=${v}
	let i+=1
done

let i-=1
#　版本号加一
let VERSION_ARR[i]+=1

VERSION=${VERSION_ARR[0]}
for ((i=1; i<${#VERSION_ARR[*]}; i++)) {
	VERSION=${VERSION}.${VERSION_ARR[${i}]}
}
# 写入　version 文件
echo "$VERSION" > version

# 开始执行
echo build "$VERSION" ...

# 时间
BUILD_TIME=$(date)

# 删除之前的结果
rm -rf index.sh
echo '''
if [[ -n "$F_TEMP" ]]; then
	rm $F_TEMP -rf
fi


export F_TEMP=$(mktemp -d "/tmp/f.tmp.XXXXX")
trap "rm $F_TEMP -rf" EXIT

f() {

ARGS1=$1

if [[ -z "$ARGS1" ]]; then
	ARGS1="help"
fi

case $ARGS1 in

version)
echo 'f version $VERSION, build time $BUILD_TIME'
;;

help)
echo -e "
''' >> index.sh

# 写入某个临时文件
HELP_TMP=$(mktemp)
echo -e "\tversion\tshow f version" >> "$HELP_TMP"
echo -e "\thelp\tshow help infomations" >> "$HELP_TMP"

# 放入目录栈
pushd func
for v in *; do
	if [[ $v = "dev.sh" ]]; then
		continue
	fi
	echo -e "\t${v%.*}\t""$(head -n 2 "$v" | tail -n 1 | sed "s/#//")" >> "$HELP_TMP"
done

# 弹出，返回之前的目录
popd

# -t 创建一个表 -s 指定分隔符
# sort 排序后存入指定文件
column -t -s $'\t' "$HELP_TMP" | sort -o "$HELP_TMP"
INTERNAL_FUNC="(show|version|help|clean)"
# {
#     # 查找临时文件中包含这些单词的行
# 	egrep "^  $INTERNAL_FUNC" "$HELP_TMP"
#     # 写入
# 	echo "" >> index.sh
# 	# -v 取反 不包含的(从 func 下找到的)
#     egrep "^  $INTERNAL_FUNC" -v "$HELP_TMP"
# } >> index.sh
echo "$(egrep "^$INTERNAL_FUNC" "$HELP_TMP")" >> index.sh
echo "" >> index.sh
echo "$(egrep "^$INTERNAL_FUNC" -v "$HELP_TMP")" >> index.sh


rm -f "$HELP_TMP"

echo -e '''
"
;;

*)
AIM=$F_TEMP/$1.sh
if [ ! -f $AIM ]; then
	printf "loading $1 ... "
	if [[ `curl -s -o $AIM -w "%{http_code}" st.wolfogre.com/func/$1.sh` != "200" ]]; then
        	rm -rf $AIM
		echo "cant not find $1 to run"
        	return
	fi
	echo "loaded"
fi
bash $AIM `echo $* | cut -s -d " " -f1 --complement`
;;
esac
}
''' >> index.sh

. index.sh

cp -f README.origin.md README.md

# {
# 	echo "\`\`\`"
# 	f help
# 	echo "\`\`\`"
# } >> README.md


echo "\`\`\`" >> README.md
echo $(f help) >> README.md
echo "\`\`\`" >> README.md