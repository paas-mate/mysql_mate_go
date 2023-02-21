-- root
UPDATE mysql.user SET host='%',plugin='caching_sha2_password' WHERE USER = 'root';
-- exporter
CREATE USER 'exporter'@'%' IDENTIFIED BY 'export_pwd';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';
-- nopwd
CREATE DATABASE IF NOT EXISTS nopwd_db DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER IF NOT EXISTS nopwd;
GRANT ALL ON nopwd_db.* to nopwd@'%';
-- normal
CREATE DATABASE IF NOT EXISTS normal_db DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER IF NOT EXISTS normal identified by 'Mysql@123';
GRANT ALL ON normal_db.* to normal@'%';
-- apollo
CREATE DATABASE IF NOT EXISTS ApolloConfigDB DEFAULT CHARACTER SET = utf8mb4;
CREATE DATABASE IF NOT EXISTS ApolloPortalDB DEFAULT CHARACTER SET = utf8mb4;
CREATE USER IF NOT EXISTS apollo;
GRANT ALL ON ApolloConfigDB.* to apollo@'%';
GRANT ALL ON ApolloPortalDB.* to apollo@'%';
-- FLUSH
FLUSH PRIVILEGES;
