docker stop redis-predixy
docker rm redis-predixy
docker run -it -d -p 6379:7617 --net redis-net --name redis-predixy redis-predixy -v $(pwd)/conf:/conf predixy conf/predixy.conf
