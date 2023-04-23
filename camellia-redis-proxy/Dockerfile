FROM openjdk:8-jdk-alpine
WORKDIR /tmp
# wget https://github.com/netease-im/camellia/releases/download/1.2.5/camellia-redis-proxy-1.2.5.tar.gz
COPY camellia-redis-proxy-1.2.5.tar.gz ./
RUN tar zxvf camellia-redis-proxy-1.2.5.tar.gz \
&& mkdir -p /apps/camellia-redis-proxy \
&& cp -a camellia-redis-proxy-1.2.5/. /apps/camellia-redis-proxy \
&& rm -rf /tmp
WORKDIR /apps/camellia-redis-proxy
RUN chmod +x /apps/camellia-redis-proxy
EXPOSE 6380
EXPOSE 16379