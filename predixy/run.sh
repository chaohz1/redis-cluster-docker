container_name="redis-predixy"
docker stop ${container_name}
docker rm ${container_name}
docker run -it -d -p 6379:7617 --net redis-net --name ${container_name} -v ${PWD}/conf:/apps/predixy/conf redis-predixy:0421 predixy conf/predixy.conf
