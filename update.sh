#!/bin/bash
# 之前被Windows编辑符号^M搞死！！！
# wget -qO- https://git.io/VPS.sh | bash
#⭐️#
echo "----------------------------------------------------------------------"
echo "请更新系统密码"
sleep 2
passwd
echo "----------------------------------------------------------------------"
echo "更新软件包列表 升级已安装的软件包"
sleep 2
sed -i 's/v3.15/v3.19/g' /etc/apk/repositories
apk update && apk upgrade
echo "----------------------------------------------------------------------"
sleep 2
echo "安装常用工具"
apk add  curl wget unzip htop screen ffmpeg net-tools iputils-ping vim neovim nano
#⭐️#apt install curl wget unzip htop screen ffmpeg net-tools iputils-ping vim neovim nano
#apt install curl wget unzip htop screen ffmpeg net-tools iputils-ping vim neovim nano -qq
echo "----------------------------------------------------------------------"
#⭐️#
echo "安装命令工具"
curl https://croc.889.pp.ua | bash
echo "----------------------------------------------------------------------"
#⭐️#
echo "设置时区为亚洲/上海"
#timedatectl set-timezone Asia/Shanghai
apk add tzdata
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#⭐️# 显示系统当前查看时间和时区
#显示当前时间：
date
#显示当前时区：
echo $TZ
#⭐️#
echo "----------------------------------------------------------------------"
echo "一键设置Linux终端支持中文显示"
sleep 2
#wget -N --no-check-certificate https://raw.githubusercontent.com/wrtpi/zh_CN/master/zh_CN.sh && bash zh_CN.sh
#安装中文字体包：
apk add ttf-dejavu
#设置locale为中文：
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8
#设置终端字符集：
echo "export CHARSET=UTF-8" >> /etc/profile
source /etc/profile
#⭐️#
echo "----------------------------------------------------------------------"
echo "显示系统当前使用的IP和地区"
#⭐️# 显示系统当前使用的IP和地区
curl cip.cc
echo "----------------------------------------------------------------------"
sleep 2
#⭐️#
echo "安装开源的Docker容器化相关组件"
echo "----------------------------------------------------------------------"
sleep 2
#curl -fsSL https://get.docker.com -o get-docker.sh  && sh get-docker.sh
apk add docker
addgroup username docker
rc-update add docker default
service docker start
#rc-update add cgroups
apk add docker-cli-compose
#
echo "----------------------------------------------------------------------"
echo "系统初始化设置命令执行完毕！"
echo "----------------------------------------------------------------------"
#⭐️#
echo "给系统增加SWAP虚拟分区文件，文件大小可以自己输入，默认可以是1024MB！"
sleep 2
echo -e "1\n1024" | bash <(curl -s -L https://raw.githubusercontent.com/wrtpi/addswap/main/addswap.sh)
#⭐️#
echo "----------------------------------------------------------------------"
echo "下面开始 测试系统性能和测试网速！"
echo "----------------------------------------------------------------------"
#⭐️#
sleep 6
wget -qO- bench.sh | bash
#
#wget -qO- https://git.io/VPS.sh | bash
echo "----------------------------------------------------------------------"
echo "系统初始化设置命令执行完毕！"
##########################################################
#⭐️#
##########################################################
echo "----------------------------------------------------------------------"
echo "系统初始化设置命令执行完毕！"
echo "----------------------------------------------------------------------"
#⭐️#!/bin/sh
##wget https://git.io/Update -O Update.sh && sh Update.sh
##wget https://git.io/Update -O Update.sh && bash Update.sh
##
##LEDE、OpenWrt编译命令如下:
##首先装好 Ubuntu 64bit，推荐 Ubuntu 20.04 LTS x64
#⭐️
##命令行输入 sudo apt-get update ，然后输入 sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
##########################################################
#⭐️sudo apt-get update
#⭐️sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
#⭐️
##########################################################
##使用 git clone https://github.com/coolsnowwolf/lede 命令下载好源代码，然后 cd lede 进入目录
#⭐️
##./scripts/feeds update -a
##./scripts/feeds install -a
##make menuconfig
##make -j8 download V=s 下载dl库（国内请尽量全局科学上网）
#⭐️
##输入 make -j1 V=s （-j1 后面是线程数。第一次编译推荐用单线程）即可开始编译你要的固件了。
#⭐️
##本套代码保证肯定可以编译成功。里面包括了 R21 所有源代码，包括 IPK 的。
#⭐️
##
##二次编译：
##
#⭐️ cd lede
##git pull
##./scripts/feeds update -a && ./scripts/feeds install -a
##make defconfig
##make -j8 download
##make -j$(($(nproc) + 1)) V=s
##如果需要重新配置：
#⭐️
##rm -rf ./tmp && rm -rf .config
##make menuconfig
##make -j$(($(nproc) + 1)) V=s
##编译完成后输出路径：bin/targets
#⭐️
