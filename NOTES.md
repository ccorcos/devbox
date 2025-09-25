
Here's what happened when I tried to run devbox from a project.

❯❯❯ devbox
Error: Default devbox image not found.
Please build the default devbox image first:
  cd <devbox-repo-path>
  docker build -f Dockerfile.devbox -t devbox .

I want two things to happen here.
1. if the devbox image doesnt exist, then build it.
2. if the Dockerfile.devbox file has changed since it was built, then rebuild it.

Add some helper commands to expose this functionallity manually.
- `devbox path` will tell you which Dockerfile.devbox file its looking at. Either the project or the default.
- `devbox status` will tell you if the container is out of date and needs to be rebuilt.
- `devbox build` will build / rebuild the container.
- `devbox delete` will delete the container

---


devbox install should walk me through dependencies and symlink the command.
devbox cleanup should clean up old images that


Can I attach to the same box multiple times?
Does it stop and remove itself when I exit?



    echo "Usage: $0 {list|init|cleanup|path|status|build|delete|start|stop|destroy}"
    echo "       $0               # attach to devbox (default)"
    echo ""
    echo "Commands:"
    echo "  (no args)  - Attach to or create devbox container for this directory"
    echo "  list       - List all running devbox containers"
    echo "  init       - Copy Dockerfile.devbox template to current directory"
    echo "  cleanup    - Remove old devbox containers and images"
    echo ""
    echo "New commands:"
    echo "  path       - Show path to Dockerfile being used"
    echo "  status     - Show status of devbox image and container"
    echo "  build      - Build/rebuild the devbox image"
    echo "  delete     - Delete the devbox image (stops containers first)"
    echo ""
    echo "Container management:"
    echo "  start      - Start container (create if doesn't exist)"
    echo "  stop       - Stop container without removing"
    echo "  destroy    - Stop and remove container"




---

devbox install





I think instead, container names should be `$proj-devbox` so each


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

