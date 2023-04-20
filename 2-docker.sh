for port in $(seq 6379 6384); \
do \
   docker container stop redis-${port};
   docker container rm redis-${port};
done
docker network rm redis-net

docker network create redis-net
for port in $(seq 6379 6384); \
do \
   docker run -it -u 0 -d -p ${port}:${port} -p 1${port}:1${port} \
  --privileged=true \
  -v /home/redis/node-${port}/conf/redis.conf:/usr/local/etc/redis/redis.conf \
  -v /home/redis/node-${port}/data:/data \
  --restart always --name redis-${port} --net redis-net \
  --sysctl net.core.somaxconn=1024 redis:5.0 redis-server /usr/local/etc/redis/redis.conf
done
# 检查配置映射
echo "检查配置映射 >>"
for i in {79..84}; do docker exec -i redis-63${i} cat /usr/local/etc/redis/redis.conf; echo "---"; done ;
echo "检查配置映射 <<"
