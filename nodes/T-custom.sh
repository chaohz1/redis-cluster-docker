key=$1
for port in {6401..6406}; do
	docker exec -i redis-${port} /bin/bash -c "redis-cli -p ${port}  -a GqdLSFUhnm6MpyeVKIu3 info| grep $key -A 10"
	echo "---- redis-63${i} ----"
done
