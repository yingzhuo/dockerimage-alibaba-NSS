FROM yingzhuo/openjdk:17-alpine AS builder

WORKDIR /tmp

ADD https://github.com/alibaba/Sentinel/releases/download/1.8.6/sentinel-dashboard-1.8.6.jar ./app.jar

RUN java -Djarmode=layertools -jar /tmp/app.jar extract && \
    rm -rf /tmp/dependencies/BOOT-INF/lib/java-boot-jarmode-layertools-*.jar && \
    rm -rf /tmp/application/BOOT-INF/*.idx && \
    rm -rf /tmp/application/META-INF/maven

COPY ./application.properties /tmp/application/BOOT-INF/classes/application.properties
COPY ./logback-spring.xml /tmp/application/BOOT-INF/classes/logback-spring.xml
COPY ./banner.txt /tmp/application/BOOT-INF/classes/banner.txt

FROM yingzhuo/openjdk:17-alpine

LABEL maintainer="应卓 yingzhor@gmail.com"

USER root:root

WORKDIR /opt

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN chmod +x /bin/docker-entrypoint.sh

COPY --from=builder /tmp/dependencies/ ./
COPY --from=builder /tmp/spring-boot-loader/ ./
COPY --from=builder /tmp/snapshot-dependencies/ ./
COPY --from=builder /tmp/application/ ./

ENV SPRING_PID_FILE=/opt/data/pid

STOPSIGNAL 15

VOLUME /opt

ENTRYPOINT ["docker-entrypoint.sh"]