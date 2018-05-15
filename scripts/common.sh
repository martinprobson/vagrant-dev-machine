#!/bin/bash
FAIL_RC=2
SUCC_RC=0

# common functions
fail () {
	echo "$1 - failed!" 1>&2
	exit $FAIL_RC
}

resourceExists () {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

fileExists () {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

# User
USER=vagrant

# xfce4
XFCE4_PROFILE=/vagrant/resources/xfce4/xfce4.sh

# vim
VIM_RES_DIR=/vagrant/resources/vim

# java
JAVA_MYSQL_CONNECTOR_VERSION=5.1.40
JAVA_MYSQL_CONNECTOR_JAR=mysql-connector-java-${JAVA_MYSQL_CONNECTOR_VERSION}.jar
JAVA_MYSQL_CONNECTOR_DOWNLOAD=http://central.maven.org/maven2/mysql/mysql-connector-java/${JAVA_MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${JAVA_MYSQL_CONNECTOR_VERSION}.jar
JAVA_RES_SH=/vagrant/resources/java/java.sh

# miniconda 
MINICONDA_MAJOR_VERSION=Miniconda3
MINICONDA_VERSION=latest
MINICONDA_ARCH=Linux-x86_64
MINICONDA_DOWNLOAD_URL=https://repo.continuum.io/miniconda
MINICONDA_ARCHIVE=${MINICONDA_MAJOR_VERSION}-${MINICONDA_VERSION}-${MINICONDA_ARCH}.sh
MINICONDA_INSTALL_LOCATION=/home/${USER}/miniconda
MINICONDA_INSTALLER=/vagrant/resources/miniconda/miniconda.sh
MINICONDA_PROFILE=/vagrant/resources/miniconda/miniconda-profile.sh

# spark
SPARK_VERSION=spark-2.3.0
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.tgz
SPARK_MIRROR_DOWNLOAD=http://archive.apache.org/dist/spark/$SPARK_VERSION/$SPARK_VERSION-bin-hadoop2.7.tgz
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

