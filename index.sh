
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
echo f version 0.0.21, build time 2018年 05月 08日 星期二 17:47:51 CST
;;

help)
echo -e "

clean                  clean local functions cache
help                   show help infomations
show                   show function detail
version                show f version

bee-gorm                生成数据表对应的结构
centos-install-docker  install docker-ce and set mirror acceleration address
filedown                从服务器下载文件
fileup                  上传文件到服务器
git-dic-pull            拉取当前文件夹下的所有仓库
install-go             install various version of golang
migration               创建 migration 文件
mysql-dump             dump mysql
proxy                   proxy
ssh                    ssh to servers d is deve t is tenct
ubuntu-install-docker  ubuntu install docker

"
;;

*)
# AIM=$F_TEMP/$1.sh
AIM=~/shell/func/$1.sh
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


source ~/shell/alias.sh

