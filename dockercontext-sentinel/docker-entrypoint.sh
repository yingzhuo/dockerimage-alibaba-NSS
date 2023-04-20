#!/bin/sh -e

cd /opt

exec java \
  -Djava.security.egd=file:/dev/./urandom \
  -Duser.timezone="Asia/Shanghai" \
  -Duser.language="zh" \
  -Duser.country="CN" \
  -Dloader.path=/opt/lib/ \
  org.springframework.boot.loader.PropertiesLauncher \
  "$@"
