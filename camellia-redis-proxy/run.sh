container_name=camellia-redis-proxy
workdir=$(cd $(dirname $0); pwd)
docker stop ${container_name}
docker rm ${container_name}

## 方案1
# docker run -it -d -p 6379:6380 -p 16379:16379 --net redis-net -v ${workdir}/application.yml:/apps/camellia-redis-proxy/BOOT-INF/classes/application.yml --name ${container_name} camellia-redis-proxy java -XX:+UseG1GC -Xms1024m -Xmx2048m -XX:+UseContainerSupport -server org.springframework.boot.loader.JarLauncher

## 方案2
docker run -it -d -p 6379:6380 -p 16379:16379 --net redis-net -v ${workdir}/application.yml:/apps/application.yml --name ${container_name} camellia-redis-proxy java -XX:+UseG1GC -Xms1024m -Xmx2048m -XX:+UseContainerSupport -Dspring.config.location=/apps/application.yml -jar camellia-redis-proxy.jar