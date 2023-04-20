for port in {6401..6406}; do
	docker exec -i redis-${port} /bin/bash -c "redis-cli -p ${port} -a GqdLSFUhnm6MpyeVKIu3 info| grep Replication -A 8"
	echo "---"
done
