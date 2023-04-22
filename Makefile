usage:
	@echo "============================================================================="
	@echo "usage:          显示本菜单"
	@echo "login:          登录到DockerHub"
	@echo "build-mysql:    构建MySQL相关镜像"
	@echo "build-nacos:    构建Nacos相关镜像"
	@echo "build-sentinel: 构建Sentinel相关镜像"
	@echo "build-seata:    构建Seata相关镜像"
	@echo "============================================================================="

login:
	@docker login

build-mysql:
	@docker buildx create --use
	@docker buildx build --push --platform linux/amd64,linux/arm64 -t yingzhuo/mysql-nss:8.0.33 $(CURDIR)/dockercontext-mysql/

build-nacos:
	@docker buildx create --use
	@docker buildx build --push --platform linux/amd64,linux/arm64 -t yingzhuo/nacos:v2.2.1 $(CURDIR)/dockercontext-nacos/

build-sentinel:
	@docker buildx create --use
	@docker buildx build --push --platform linux/amd64,linux/arm64 -t yingzhuo/sentinel:v1.8.6 $(CURDIR)/dockercontext-sentinel/

build-seata:
	@docker buildx create --use
	@docker buildx build --push --platform linux/amd64,linux/arm64 -t yingzhuo/seata:v1.6.1 $(CURDIR)/dockercontext-seata/

build-all: build-mysql build-nacos build-sentinel build-seata

github:
	@git add .
	@git commit -m "$(shell /bin/date "+%F %T")"
	@git push

.PHONY: login build-mysql build-nacos build-sentinel build-seata build-all github
