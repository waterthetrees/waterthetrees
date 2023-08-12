# Docker Cheatsheet Commands

Cleaning up
```shell
$ docker-compose down # Stops instances
$ docker-compose rm -v # Removes stopped containers & volumes
$ docker rm $(docker ps -a -q)
$ docker images # Lists all images
$ docker rmi 4b5361dd1869 <--- docker image
$ docker system prune # Removes stopped containers, dangling images, and build caches
```

Rebuilding
```shell
$ docker-compose build --no-cache # Recreates images
$ docker-compose up --force-recreate # Recreates containers
```

listing
```shell
$ docker ps
$ docker images
$ docker container ls
$ docker volume ls (bind mounts will not show up in this list)
```

docker compose
```shell
$ docker-compose up #already built
$ docker-compose up --build
```

Entering container's command line
Find container id with docker ps first
```shell
$ docker exec -it <container id> /bin/bash
```

Accessing the DB from docker
```shell
psql -U trees -h wtt_postgis -d treedb
```

remove or stop docker
```shell
$ docker images -a
$ docker stop ImageId
$ docker stop wtt_server wtt_front treedbdocker
$ docker stop 06f3b2498fdc
$ docker rmi Image
$ docker rmi -f 06f3b2498fdc  1f1bd4302537
$ docker-compose rm -fv
```

Access locally running PSQL server
```shell
$ HOST_IP=docker.for.mac.localhost PSQL_PORT=5435 docker-compose up --build
```
> NOTE: **If on Windows** use: ```host.docker.internal``` in place of ```docker.for.mac.localhost```