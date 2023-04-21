# 二次开发过，修复了 Protocol error: invalid bulk length 报错问题
rm -rf ./redis-cluster-proxy
git clone https://codeup.aliyun.com/5f707fab3035265285847763/rewrite/redis-cluster-proxy.git
docker build -t redis-cluster-proxy:v1 . 
