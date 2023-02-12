#!/bin/bash

mysqld --daemonize

rm -rf /etc/mysql/my.cnf.fallback
rm -rf /etc/mysql/mysql.cnf
rm -rf /etc/mysql/my.cnf
rm -rf /etc/mysql/conf.d
rm -rf /etc/mysql/mysql.conf.d
CONF_FILE=/etc/mysql/my.cnf
echo "[mysqld]" >$CONF_FILE
echo "bind-address = 0.0.0.0" >>$CONF_FILE
echo "mysqlx-bind-address = 0.0.0.0" >>$CONF_FILE
echo "ssl = 0" >>$CONF_FILE
echo "log_error = $MYSQL_HOME/logs/mysql_error.log" >>$CONF_FILE
echo "[mysqldump]" >>$CONF_FILE
echo "quick" >> $CONF_FILE

mysql -u root < $MYSQL_HOME/mate/sql/init.sql
