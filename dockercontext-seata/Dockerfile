FROM seataio/seata-server:1.6.1

LABEL maintainer="应卓 yingzhor@gmail.com"

# 拷贝预先准备好的配置文件
COPY ./application.yml /seata-server/resources/application.yml
COPY ./logback-simple.xml /seata-server/resources/logback-simple.xml

# 添加MySQL8的JDBC驱动
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar /seata-server/libs/mysql-connector-j.jar

# 安装curl
RUN apt-get update && apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
