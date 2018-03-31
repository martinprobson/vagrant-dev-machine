#!/bin/bash
source "/vagrant/scripts/common.sh"

function installRemoteJava {
	echo "install open jdk"
	apt-get install -y openjdk-8-jdk-headless
}

function setupEnvVars {
	echo "creating java environment variables"
     	echo "Setting JAVA_HOME"
	JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
	ln -s ${JAVA_HOME} /usr/local/java
	cp $JAVA_RES_SH /etc/profile.d/java.sh
	source /etc/profile.d/java.sh
	echo 'source /etc/profile.d/java.sh' >> /home/${USER}/.bashrc_local
}

function setupMysqlConnector {
	echo "Mysql java connector setup"
	curl -sS -o ${JAVA_HOME}/lib/ext/${JAVA_MYSQL_CONNECTOR_JAR} -O -L ${JAVA_MYSQL_CONNECTOR_DOWNLOAD}
}

function installJava {
	installRemoteJava
}


funcs=(installJava setupEnvVars setupMysqlConnector)

echo "setup java"
for func in "${funcs[@]}"
do
	$func || fail $func
done

