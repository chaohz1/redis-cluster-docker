docker stop redis-cluster-proxy
docker rm redis-cluster-proxy

ip=$(ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"| grep 192 | head -n 1)
cluster_server=""
for port in {6401..6406}; do
	if [[ "${cluster_server}" ]]; then
		${cluster_server}="${cluster_server} "
	fi
	${cluster_server}="${cluster_server}${ip}:${port}"
done
docker run -it -d -p 6688:7777 --net redis-net --name redis-cluster-proxy redis-cluster-proxy:v1 redis-cluster-proxy -a GqdLSFUhnm6MpyeVKIu3 ${cluster_server}
