# 检查配置映射
echo "检查配置映射 >>"
for port in {6401..6406}; do
	docker exec -i redis-${port} cat /usr/local/etc/redis/redis.conf
	echo "---"
done
echo "检查配置映射 redis-63${i}<<"
