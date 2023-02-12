#!/bin/bash

mysqld --daemonize

rm -rf /etc/mysql/my.cnf.fallback
rm -rf /etc/mysql/mysql.cnf
rm -rf /etc/mysql/my.cnf
rm -rf /etc/mysql/conf.d
rm -rf /etc/mysql/mysql.conf.d
CONF_FILE=/etc/mysql/my.cnf
echo "[mysqld]" >/etc/mysql.conf
echo "bind-address = 0.0.0.0" >>/etc/mysql.conf
echo "mysqlx-bind-address = 0.0.0.0" >>/etc/mysql.conf
echo "ssl = 0" >>/etc/mysql.conf

mysql -u root < $MYSQL_HOME/mate/sql/init.sql
