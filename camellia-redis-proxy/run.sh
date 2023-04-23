container_name=camellia-redis-proxy
docker stop ${container_name}
docker rm ${container_name}
docker run -it -d -p 6379:6380 -p 16379:16379 -v ${PWD}/application.yml:/apps/camellia-redis-proxy/BOOT-INF/classes/application.yml --name ${container_name} camellia-redis-proxy:1.2.5 /bin/bash start_in_docker.sh

echo "========= start logs ${container_name} ========="
docker logs ${container_name}
echo "========= end logs ${container_name} ========="
