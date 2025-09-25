
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
```

## Devbox Notes



Testing
```sh
devbox build
```





Currently container names are called $project but I'd like the container names should be `$project-devbox` so we can easily tell which containers and images are devboxes. Same goes with custom images -- those should also be called $project-devbox instead of just $project.


I'd like an "autostop" function that we can run after users exit when running the default command. It should check to see if there are any other processes attached to the container and if not it should call stop to clean it up.


I'd like to make the zshj

zsh inside look better.
Auto-stop?



Claudemd better
claude inside the devbox.




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

