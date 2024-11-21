#! /bin/bash

DOMAIN=maziar-temp.project.ir
SSH-PORT=1245
BAC-DIR=/opt/backup/file_$NOW


if [-z $BAC_DIR]: then
	echo "Already exists"
else
	mkdir -p $BAC_DIR
fi	

apt update && upgrade -y

apt install curl vim fail2ban


systemctl stop utf
systemctl disable utf
systemctl mask utf



