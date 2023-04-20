FROM mysql:8.0.32

LABEL maintainer="应卓 yingzhor@gmail.com"

ENV MYSQL_ROOT_PASSWORD=root

COPY ./01-init-nacos.sql /docker-entrypoint-initdb.d/01-init-nacos.sql
COPY ./02-init-seata.sql /docker-entrypoint-initdb.d/02-init-seata.sql

RUN chmod +x /docker-entrypoint-initdb.d/*.sql
