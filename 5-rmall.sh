docker ps -a -q | xargs docker stop
docker ps -a -q | xargs docker rm
rm -rf /home/redis
