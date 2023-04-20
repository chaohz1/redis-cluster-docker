for port in {6401..6406}; do
	docker logs redis-${port} --tail 20
	echo "---- redis-${port}   ----"
done
