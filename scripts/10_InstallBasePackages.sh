#!/bin/bash
source "/vagrant/scripts/common.sh"

installVBGuest () {
	echo "Add contrib repo"
	echo "deb http://ftp.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list
	echo "Update"
	apt-get update -y -q
	echo "Install virtualbox guest additions"
	apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}


setupXfce4 () {
	echo "Install XFCE4"
	apt-get install -y -q xfce4 terminator
	cat ${XFCE4_PROFILE} >> /home/${USER}/.bashrc_local
}

installOthers () {
	echo "Install iceweasel"
	apt-get -y -q install iceweasel 
	echo "Install vim-gtk"
	apt-get -y remove vim.tiny
	apt-get install -y vim-gtk
	echo "expect"
	apt-get -y -q install expect
	echo "git stow curl"
	apt-get -y -q install git stow curl
}

setupDefaults () {
	cd /home/${USER}
	git clone https://github.com/martinprobson/dotfiles.git
	sudo chown -R ${USER}:${USER} /home/${USER}/dotfiles
	rm -f /home/${USER}/.bashrc
	cd /home/${USER}/dotfiles
	stow vim
	stow bash
	stow terminator
	stow fonts
}

funcs=(installVBGuest setupXfce4 installOthers setupDefaults)

for func in "${funcs[@]}"
do
	$func || fail $func
done

