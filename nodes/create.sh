### 配置文件 ####

# 使用本机网卡IP
ip=$(ifconfig -a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | tr -d "addr:" | grep 192 | head -n 1)
# Docker网桥IP
#ip=$(ifconfig -a | grep docker -A 2 | grep inet | grep -v inet6 | awk '{print $2}')
echo "===== IP ${ip} ====="

for port in {6401..6406}; do
	mkdir -p /home/redis/node-${port}/conf
	touch /home/redis/node-${port}/conf/redis.conf
	sudo chmod 644 /home/redis/node-${port}/conf/redis.conf
	cat <<EOF >/home/redis/node-${port}/conf/redis.conf
bind 0.0.0.0
port ${port}
requirepass GqdLSFUhnm6MpyeVKIu3
masterauth GqdLSFUhnm6MpyeVKIu3
protected-mode no
daemonize no
appendonly yes
cluster-enabled yes 
cluster-config-file nodes.conf
cluster-node-timeout 5000
cluster-announce-ip  ${ip}
cluster-announce-port ${port}
cluster-announce-bus-port 1${port}
EOF
done
echo "===== Config Done ====="

#### Docker #####
# 清理
for port in {6401..6406}; do
	docker container stop redis-${port}
	docker container rm redis-${port}
done
docker network rm redis-net
echo "===== Clean Done ====="
# 创建
docker network create redis-net
for port in {6401..6406}; do
	docker run -it -u 0 -d \
		-p ${port}:${port} -p 1${port}:1${port} \
		--privileged=true \
		-v /home/redis/node-${port}/conf/redis.conf:/usr/local/etc/redis/redis.conf \
		-v /home/redis/node-${port}/data:/data \
		--restart always --name redis-${port} --net redis-net \
		--sysctl net.core.somaxconn=1024 \
		redis:5.0 redis-server /usr/local/etc/redis/redis.conf
done
echo "===== Container Done ====="

#### 集群注册 #####
pwd=GqdLSFUhnm6MpyeVKIu3
cluster_server=""
for port in {6401..6406}; do
	if [[ "${cluster_server}" ]]; then
		cluster_server="${cluster_server} "
	fi
	cluster_server="${cluster_server}${ip}:${port}"
done
echo "cluster_server = ${cluster_server}"
docker exec -i redis-6401 /bin/bash -c "redis-cli -a ${pwd} --cluster create ${cluster_server} --cluster-replicas 1"
echo "===== Bind Done ====="
