docker ps -a | grep redis | awk '{print $1}' | xargs docker stop
docker ps -a | grep redis | awk '{print $1}' | xargs docker rm
docker network rm redis-net
rm -rf /home/redis
