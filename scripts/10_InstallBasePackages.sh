#!/bin/bash
source "/vagrant/scripts/common.sh"

upgradeBase () {
	echo "Update base system"
	apt-get -y -q update
	apt-get -y -q upgrade
	echo "Update base system - Done!"
}

installVBGuest () {
	echo "Install Build tools"
	apt-get install -y -q linux-headers-$(uname -r) build-essential dkms
	echo "Install virtualbox guest additions"
	apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}


setupXfce4 () {
	echo "Install XFCE4"
	apt-get install -y -q xfce4 terminator
	cat ${XFCE4_PROFILE} >> /home/${USER}/.bashrc_local
}

installOthers () {
	echo "Install firefox"
	apt-get -y -q install firefox
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

setupIcons () {
	echo "Install Icons"
	apt-get -y -q update
	apt-get -y -q install papirus-icon-theme fonts-liberation
}

funcs=(upgradeBase installVBGuest setupXfce4 installOthers setupDefaults setupIcons)

for func in "${funcs[@]}"
do
	$func || fail $func
done

