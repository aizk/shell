#!/bin/sh
#install various version of golang

set -e

curl -s https://raw.githubusercontent.com/golang/go/master/doc/devel/release.html | grep -o "go[0-9.]* (released [0-9]*/[0-9]*/[0-9]*)" | tr ")" " " | awk '{ print $1,$3 }' | sort -k 2 | awk '{ print NR,$1,$2,"\t" }' | column -t

read -p "Please input version(like'1.8.3'):" VERSION

if [ -d /usr/local/go${VERSION} ]; then
	echo "go $VERSION has been installed already"
	echo "current version is"`go version | cut -d ' ' -f3`
	read -p "reinstall go${VERSION}?" YN
	YN=`echo $YN | tr '[A-Z]' '[a-z]'`
	if [[ $YN != yes && $YN != y ]]; then
		if [[ `go version | cut -d ' ' -f3` = go${VERSION} ]]; then
			exit 0
		fi
		sed -i '/GOROOT/d' ~/.bashrc
		sed -i '/GOPATH/d' ~/.bashrc
		echo "export GOROOT=/usr/local/go${VERSION}" >> ~/.bashrc
		echo 'export GOPATH=$HOME/go' >> ~/.bashrc
		echo 'export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.bashrc
		echo "switched to $go${VERSION} now"
		echo "please run '. ~/.bashrc' manually"
		exit 0
	fi
fi
cd `mktemp -d`

wget http://golang.download.wolfogre.com/go${VERSION}.linux-amd64.tar.gz

tar zxf go${VERSION}.linux-amd64.tar.gz

mv go go${VERSION}

rm -rf /usr/local/go${VERSION}
mv go${VERSION} /usr/local/

rm * -rf

sed -i '/GOROOT/d' ~/.bashrc
sed -i '/GOPATH/d' ~/.bashrc

echo -e "
export GOROOT=/usr/local/go${VERSION}" >> ~/.bashrc
echo -e 'export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.bashrc

echo -e "installed successfully, to uninstall, please run
  sed -i '/GOROOT/d' ~/.bashrc
  sed -i '/GOPATH/d' ~/.bashrc
  rm -rf /usr/local/go${VERSION}
  . ~/.bashrc
"

echo "please run '. ~/.bashrc' manually now"
