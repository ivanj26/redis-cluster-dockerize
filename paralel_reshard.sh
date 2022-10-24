#!/bin/sh

reshard() {
    echo $2

    touch "output-$2.txt"

    docker exec -i $3 sh<<-EOF > "output-$2.txt"
    redis-cli -p 6379 --cluster reshard localhost:6379 \
        --cluster-from $1 \
        --cluster-to $2 \
        --cluster-slots 5460 \
        --cluster-yes
EOF
}

IP=(redis_1 redis_2)
NODE_FROM="e04a8dfc98dfac2314fd94ade7b2dc94e5844883"
DEST=(9590b9b0ca55aaeb0e4eb85ba8bf256dde202fa4 cb9258d0a74aefb71e5583d975202e397245f571)

for (( i=0; i<=1; i++ ))
do
    reshard $NODE_FROM ${DEST[$i]} ${IP[$i]}&
done

wait