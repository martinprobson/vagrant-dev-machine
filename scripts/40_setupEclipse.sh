#!/bin/bash

source "/vagrant/scripts/common.sh"

installEclipse () {
	echo "install eclipse IDE and plugins"
	${ECLIPSE_RES_DIR}/install-eclipse -f -c ${ECLIPSE_RES_DIR}/install-eclipse.cfg ${ECLIPSE_TARGET}
}

changeOwner () {
	echo "Changing owner of eclipse directories"
	chown -R -L ubuntu:ubuntu ${ECLIPSE_TARGET}
	chown -R  ubuntu:ubuntu ${ECLIPSE_TARGET}
}

setupPath () {
	echo "setup eclipse path"
	cp ${ECLIPSE_RES_DIR}/eclipse.sh /etc/profile.d/.
	source /etc/profile.d/eclipse.sh
	echo "export PATH=\$PATH:${ECLIPSE_TARGET}" >> /home/ubuntu/.bashrc
}

addMenuItem () {
	mkdir -p /user/ubuntu/.local/share/applications
	chown -R ubuntu:ubuntu /user/ubuntu/.local/share
	cp ${ECLIPSE_DESKTOP_ENTRY} /user/ubuntu/.local/share/applications/.
}


echo "setup Eclipse"

funcs=(installEclipse changeOwner setupPath addMenuItem)

for func in "${funcs[@]}"
do
	$func || fail $func
done

echo "eclipse setup complete"
