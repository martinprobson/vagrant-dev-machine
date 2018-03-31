#!/bin/bash

source "/vagrant/scripts/common.sh"

installEclipse () {
	echo "install eclipse IDE and plugins"
	${ECLIPSE_RES_DIR}/install-eclipse -f -c ${ECLIPSE_RES_DIR}/install-eclipse.cfg ${ECLIPSE_TARGET}
}

changeOwner () {
	echo "Changing owner of eclipse directories"
	chown -R -L ${USER}:${USER} ${ECLIPSE_TARGET}
	chown -R  ${USER}:${USER} ${ECLIPSE_TARGET}
}

setupPath () {
	echo "setup eclipse path"
	cp ${ECLIPSE_RES_DIR}/eclipse.sh /etc/profile.d/.
	echo 'source /etc/profile.d/eclipse.sh' >> /home/${USER}/.bashrc_local
}


echo "setup Eclipse"

funcs=(installEclipse changeOwner setupPath )

for func in "${funcs[@]}"
do
	$func || fail $func
done

echo "eclipse setup complete"
