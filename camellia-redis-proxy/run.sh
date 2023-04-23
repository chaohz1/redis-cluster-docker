container_name=camellia-redis-proxy
docker stop ${container_name}
docker rm ${container_name}
docker run -it -d -p 6379:6380 -p 16379:16379 --net redis-net -v ${PWD}/application.yml:/apps/camellia-redis-proxy/BOOT-INF/classes/application.yml --name ${container_name} camellia-redis-proxy:1.2.5 java -XX:+UseG1GC -Xms1024m -Xmx2048m -XX:+UseContainerSupport -server org.springframework.boot.loader.JarLauncher
