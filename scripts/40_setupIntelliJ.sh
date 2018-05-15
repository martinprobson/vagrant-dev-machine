#!/bin/bash

source "/vagrant/scripts/common.sh"


installSnap () {
	echo "install snapd"
	apt-get install -y -q snapd
}

installIntelliJ () {
	echo "install IntelliJ snap"
	snap install intellij-idea-community --classic
}


echo "setup IntelliJ"

funcs=(installSnap installIntelliJ)

for func in "${funcs[@]}"
do
	$func || fail $func
done

echo "IntelliJ setup complete"
