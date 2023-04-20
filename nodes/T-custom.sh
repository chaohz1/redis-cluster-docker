key=$1
for i in {79..84}; do docker exec -i redis-63${i} /bin/bash -c  "redis-cli -p 63${i} -a GqdLSFUhnm6MpyeVKIu3 info| grep $key -A 10"; echo "---- redis-63${i} ----"; done ;
