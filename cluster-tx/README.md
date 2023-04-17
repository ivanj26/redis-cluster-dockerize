# Template to Spawn Redis Cluster with Segregation inside Docker
This repository provides a script to spawn redis cluster docker container.

## How to spawn redis cluster?

1. Create a docker network by enter the following command:

```shell
docker network create --gateway 173.18.0.1 --subnet 173.18.0.0/24 redis_cluster_net
```

2. Execute the `docker-compose.yaml` script by enter the following command:

```shell
docker-compose up --build -d
```

3. After the process is finished. Check if the redis was created properly by enter the one of redis cluster container.

```shell
docker exec -it redis_1 bash
```

4. Check the redis configuration and also make sure if the redis cluster was setup correctly or not.

```shell
redis-cli -a {password} CONFIG get cluster-enabled

redis-cli -a {password} cluster nodes
```

## How to destroy/delete the redis container volume?

```shell
chmod +x destroy-redis-volume.sh
./destroy-redis-volume.sh
```