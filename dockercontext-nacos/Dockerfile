FROM nacos/nacos-server:v2.2.1-slim

LABEL maintainer="应卓 yingzhor@gmail.com"

# 安装curl
RUN apt-get update && apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
