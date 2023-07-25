FROM openjdk:8-jdk-alpine
WORKDIR /tmp

## 方案1：使用官方打包文件
## wget https://github.com/netease-im/camellia/releases/download/1.2.5/camellia-redis-proxy-1.2.5.tar.gz
# COPY camellia-redis-proxy-1.2.5.tar.gz ./
# RUN tar zxvf camellia-redis-proxy-1.2.5.tar.gz \
# && mkdir -p /apps/camellia-redis-proxy \
# && cp -a camellia-redis-proxy-1.2.5/. /apps/camellia-redis-proxy \
# && rm -rf /tmp
# WORKDIR /apps/camellia-redis-proxy
# RUN chmod +x /apps/camellia-redis-proxy

## 方案2：二次开发的SpringBootJar
##  https://github.com/Fanc1yJ/camellia.git
WORKDIR /apps
COPY camellia-redis-proxy-bootstrap-1.2.11.jar  ./camellia-redis-proxy.jar
RUN chmod +x camellia-redis-proxy.jar

EXPOSE 6380
EXPOSE 16379