#!/bin/bash
source "/vagrant/scripts/common.sh"

repoUpdate () {
	echo "Install base ubuntu packages"
	apt-get update -y -q
}

installVBGuest () {
	echo "Install virtualbox guest additions"
	apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}


setupXfce4 () {
	echo "Install XFCE4"
	apt-get install -y -q xfce4 xdm xfce4-terminal 
	echo "Remove xterm"
	apt-get remove -y -q xterm
	dpkg-reconfigure xdm
	cat ${XFCE4_PROFILE} >> /home/ubuntu/.bashrc
}

installOthers () {
	echo "Install firefox"
	apt-get -y -q install firefox
	echo "Install vim-gtk"
	apt-get -y -q install vim-gtk
	echo "expect"
	apt-get -y -q install expect
}

setupVIM () {
	echo "setup VIM GTK"
	apt-get -y remove vim.tiny
	apt-get install -y vim-gtk
	tar xf $VIM_RES_DIR/vim.tar.gz -C $VIM_RES_DIR/vimdir
	cp -R $VIM_RES_DIR/vimdir /home/ubuntu/.vim
	cp $VIM_RES_DIR/vimrc /home/ubuntu/.vimrc
	chown -R ubuntu:ubuntu .vim .vimrc
	# Set bash vim mode
	echo "set -o vi" >> /home/ubuntu/.bashrc
	echo "export TERM=xterm-256color" >> /home/ubuntu/.bashrc
}

funcs=(repoUpdate installVBGuest setupXfce4 installOthers setupVIM)

for func in "${funcs[@]}"
do
	$func || fail $func
done
