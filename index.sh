
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
echo f version 0.0.20, build time 2018年 03月 19日 星期一 15:16:08 CST
;;

help)
echo -e "

clean                  clean local functions cache
help                   show help infomations
show                   show function detail
version                show f version

centos-install-docker  install docker-ce and set mirror acceleration address
git-dic-pull            拉取当前文件夹下的仓库
install-go             install various version of golang
mysql-dump             dump mysql
proxy                   proxy
ssh                    ssh to servers d is deve t is tenct
ubuntu-install-docker  ubuntu install docker

"
;;

*)
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


alias dc="docker-compose"
alias dcup="docker-compose up -d"
alias dk="docker"