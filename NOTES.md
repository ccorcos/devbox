
## Docker Notes

```sh
# running containers
docker ps
# all containers
docker ps -a
# stop all containers
docker stop $(docker ps -q)
# delete all stopped containers
docker container prune -f

# list all images
docker image ls
# delete all images
docker rmi $(docker images -a -q)

# List dangling images that were overwritten
docker images -f dangling=true
# Delete dangling images
docker image prune
```

## Devbox Notes



Testing
```sh
devbox build
```

I'd like a function `auto_stop` which firsts first checks if a container has any attaches shells and if not, it will call stop_container. I want to run this after attach_container for the default command. This means that if I run `devbox`, when I exit, the container will be stopped and deleted. However, if I run `devbox` in two different terminals, I will attach to the same container and if I exit from either of them, the container won't be stopped and deleted until I exit from both processes.


I'd like a command `devbox off`. It stops and deletes all active devbox containers regardless of whether there are connections to it. And then it turns off orb so long as no other containers (non-devbox containers) are cucrrently running.







Claudemd update. Readme update.
How to use claude inside the devbox?

Handle ctrl-c to stop orb, etc.

---




## Installation

1. git clone this repo
2. run devbox install which will symlink the devbox command to your local/bin folder.

## Setup

I want future developers to be able to use the Dockerfile for development even if they don't have this tool installed.
So when I go to a new project and run `devbox init` it should create an initial Dockerfile for that project.
That Dockerfile should be loaded up with goodies and make it easy to comment out / uncomment things that I need. For example, node.js tools, python tools, zsh, other utilities. One question here is whether there's a better way of doing this -- is it better to have some other kind of requirements.txt file? Probably not?

## Using it

When I run the devbox command inside a project folder, it tries to get be into a devbox container.
- if there's no Dockerfile, it tells me to run devbox init.
- if orb is not installed, it tells me how to install it.
- if orb is not running, it will start it.
- if the docker image is not built, it will build it.
- then it will run the docker image, drop me into an interactive shell.
- if I run the command in another terminal, I'm in another shell on the same container
- on exit, if there are no more shells open on that container, the container is stopped and deleted

The important thing is that this should make developing a project very similar to using your computer normally. The proj directory is mounted wholesale. I can run `devbox` and then start doing things like `npm install` and `npm run dev` with the ports exposed.

## Cleaning up

The `devbox cleanup` command will delete any images that havent been used in 30 days.





---

