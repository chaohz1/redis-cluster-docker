FROM gcc:9
WORKDIR /apps/redis-cluster-proxy
#先GIT克隆好
COPY redis-cluster-proxy /apps/redis-cluster-proxy
RUN chmod +x /apps/redis-cluster-proxy
RUN [ "make", "install" ]
EXPOSE 7777
