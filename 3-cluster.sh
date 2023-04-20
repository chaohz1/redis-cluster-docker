ip=$(ifconfig -a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | tr -d "addr:" | grep 192 | head -n 1)
#ip=$(ifconfig -a | grep docker -A 2 | grep inet | grep -v inet6 | awk '{print $2}')
#ip=127.0.0.1
pwd=GqdLSFUhnm6MpyeVKIu3
docker exec -i redis-6379 /bin/bash -c "redis-cli -a ${pwd} --cluster create \
${ip}:6379 \
${ip}:6380 \
${ip}:6381 \
${ip}:6382 \
${ip}:6383 \
${ip}:6384 \
-a ${pwd} \
--cluster-replicas 1"


