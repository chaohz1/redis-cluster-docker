
ip=$(ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"| grep 192 | head -n 1)
#ip=$(ifconfig -a | grep docker -A 2 | grep inet | grep -v inet6 | awk '{print $2}')
for port in $(seq 6379 6384); 
do 
mkdir -p /home/redis/node-${port}/conf
touch /home/redis/node-${port}/conf/redis.conf
sudo chmod 644 /home/redis/node-${port}/conf/redis.conf
cat  << EOF > /home/redis/node-${port}/conf/redis.conf
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

