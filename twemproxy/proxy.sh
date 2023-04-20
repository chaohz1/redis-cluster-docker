# 使用本机网卡IP
ip=$(ifconfig -a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | tr -d "addr:" | grep 192 | head -n 1)
# Docker网桥IP
#ip=$(ifconfig -a | grep docker -A 2 | grep inet | grep -v inet6 | awk '{print $2}')

mkdir -p /home/redis/twemproxy/conf
touch /home/redis/twemproxy/conf/nutcracker.conf
sudo chmod 644 /home/redis/twemproxy/conf/nutcracker.conf
cat <<EOF >/home/redis/twemproxy/conf/nutcracker.conf
staging:
  listen: '0.0.0.0:6380'
  hash: fnv1a_64
  distribution: ketama
  redis: true
  redis_auth: GqdLSFUhnm6MpyeVKIu3
  servers:
    - ${ip}:6379:1
    - ${ip}:6380:1
    - ${ip}:6381:1
    - ${ip}:6382:1
    - ${ip}:6383:1
    - ${ip}:6384:1
EOF

docker stop twemproxy
docker rm twemproxy
docker run -it -d \
	--privileged=true \
	-v /home/redis/twemproxy/conf/nutcracker.conf:/etc/nutcracker.conf \
	--restart=always \
	--network=redis-net \
	-p 6480:6380 \
	--name twemproxy \
	malexer/twemproxy:latest
# 测试
echo ">> test proxy"
redis-cli -p 6480 -a GqdLSFUhnm6MpyeVKIu3 SET test-key v1
redis-cli -p 6480 -a GqdLSFUhnm6MpyeVKIu3 GET test-key

