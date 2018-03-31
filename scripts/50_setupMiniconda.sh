#!/bin/bash

source "/vagrant/scripts/common.sh"

getMinicondaInstaller () {
	echo "Getting remote copy of miniconda"
	wget --quiet ${MINICONDA_DOWNLOAD_URL}/${MINICONDA_ARCHIVE} -O ${MINICONDA_INSTALLER}
}

setupEnv () {
	echo "setup miniconda environment "
	sudo cp $MINICONDA_PROFILE /etc/profile.d/.
	echo 'source /etc/profile.d/miniconda-profile.sh' >> /home/${USER}/.bashrc_local
}

installMiniconda() {
	if ! fileExists $MINICONDA_INSTALLER; then
		getMinicondaInstaller
	fi
	echo "Installing miniconda"
	bash $MINICONDA_INSTALLER -b -p ${MINICONDA_INSTALL_LOCATION}
	sudo chown -R ${USER}:${USER} ${MINICONDA_INSTALL_LOCATION}
}


echo "setup minconda"

funcs=(installMiniconda setupEnv)

for func in "${funcs[@]}"
do
	$func || fail $func
done

echo "miniconda setup complete"
