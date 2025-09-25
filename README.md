# `devbox`

Isolate all of your projects easily using Docker containers.

## Setup

Install Docker and OrbStack:
```sh
brew install docker orbstack
```

Start orb to host your docker containers.
```sh
# start the vm
orb

# docker commands work now
docker ps

# stop the vm
orb stop
```

Edit the Dockerfile in this repo to suit your needs and build your devbox

```sh
docker build -t devbox .
docker images
```

Setup the `devbox` command on your path somewhere.

```sh
sudo ln -s "$(pwd)"/devbox /usr/local/bin/devbox
```

Devbox if you're in a directory `/path/to/proj1`, then that path will be mounted `/proj1` in a container named `proj1`

```sh
devbox start
#$ X=$(basename "$PWD")
#$ docker run -d -P --name "$X" -v "$(pwd)":/"$X" devbox

#$ docker ps -a

devbox
#$ docker exec -it "$X" /bin/zsh

devbox stop
#$ docker stop "$X"

devbox destroy
#$ docker rm "$X"
```


```sh
# stop all containers
docker stop $(docker ps -q)
# delete all stopped containers
docker container prune -f
# delete all images
```



```sh
# running containers
docker ps
# all containers
docker ps -a
# images
docker image ls
```

Testing
```sh
devbox path
devbox build
```

devbox status