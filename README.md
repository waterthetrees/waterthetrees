# waterthetrees
Water The Trees is a platform that crowd sources tree planting and maintenance. We believe in the power of trees to restore natural habitat for animals, insects, and fauna. We are interesting in continuous massive tree planting events to help sequester carbon and stabilize climate change extremes.

## Join Us!
https://docs.google.com/document/d/1L5Hc8_K_NhVhAejdE05C_Y__CgqeBWFrFYFoNqBSBbQ/edit
Water the Trees is an open source project run by tree planting volunteers at Sierra Club, Public Works, and developers at Code for America.

### INSTALL GIT
-------------
1. Install git https://git-scm.com/downloads

### INSTALL DOCKER
-------------
1. Install Docker Desktop https://www.docker.com/get-started
2. (Only for Linux users) Install docker-compose https://docs.docker.com/compose/install/

### CLONE REPOS
-------------
1. Clone the waterthetrees parent repo
```shell
$ git clone https://github.com/waterthetrees/waterthetrees.git
```
2. Clone frontend, server, and db child repos
```shell
$ cd waterthetrees
$ ./clone_repos.sh
```

### BUILD & RUN DOCKER CONTAINERS
---------------
1. Run docker-compose to build and run Docker containers
```shell
$ docker-compose up
```
> Docker mirrors local files*, so any changes you make will be reflected in the corresponding Docker container.
>
> **Excluding node_modules*

### INSTALLING NEW NPM PACKAGES
---------------
> :cyclone: Since Docker does not mirror your local node_modules folder, we'll need to have Docker re-run npm install when adding a new package to the project.
1. Rebuild images from scratch. *This step runs npm install.*
```shell
$ docker-compose build --no-cache
```
2. Spin up brand-new containers
```shell
$ docker-compose up --force-recreate
```