FROM mysql:5.7.39
LABEL Project="Imran vProfile Project"
LABEL Author="hammer182"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
