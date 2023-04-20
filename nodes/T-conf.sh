# 检查配置映射
echo "检查配置映射 >>"
for i in {79..84}; do docker exec -i redis-63${i} cat /usr/local/etc/redis/redis.conf; echo "---"; done ;
echo "检查配置映射 redis-63${i}<<"
