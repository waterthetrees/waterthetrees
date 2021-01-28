# Docker Cheatsheet Commands

listing
```shell
$ docker ps
$ docker images
$ docker container ls
$ docker volume ls (bind mounts will not show up in this list)
```

docker compose
```shell
$ docker start wtt_server wtt_front treedbdocker (If you already built them)
$ docker-compose up #already built
$ docker-compose up --build
```

Entering container's command line
Find container id with docker ps first 
```shell
$ docker exec -it <container id> /bin/bash
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
