# ROOT CA
openssl genrsa -out root-ca.key 2048
openssl req -x509 -new -extensions v3_ca -key root-ca.key -days 3650 -out root-ca.pem \
-subj '/C=AA/ST=AA/L=AA/O=AA Ltd/OU=AA/CN=*.ca.com/emailAddress=ca@gmail.com'

# MYSQL cert
openssl genrsa -out mysql.key 2048
openssl req -new -key mysql.key -out mysql.csr \
-subj '/C=CC/ST=CC/L=CC/O=CC Ltd/OU=CC/CN=*.mysql.com/emailAddress=*.mysql.com'
openssl x509 -req -extensions usr_cert -days 365 -CA root-ca.pem -CAkey root-ca.key \
-CAcreateserial -in mysql.csr -out mysql.pem
