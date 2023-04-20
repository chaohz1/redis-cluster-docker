for i in {79..84}; do docker logs  redis-63${i} --tail 20 ; echo "---- redis-63${i}  ----"; done ;
