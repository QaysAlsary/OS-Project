#! /bin/bash
apt update
apt -y install vsftpd
cp /etc/vsftpd.conf ./vsftpd.conf.backup
cp ./vsftpd.conf /etc/vsftpd.conf
chown root:root vsftpd.conf
sudo service vsftpd restart
