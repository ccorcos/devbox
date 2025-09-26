
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

Write a better README.md file.
I want to communicate that the purpose of this project is to make it really easy for beginners to isolate their development environments inside docker containers for the purpose of security. Things like npm supply chain attacks are thus limited to the docker container, for example, rather than exposing your computer.
Provide a little explanation of what docker is and how it works with images and containers just so they have some sense.
Then explain how to use the tool.
Make sure to include a quickstart that involves cloning the repo, symlinking it so its on your path, and then running it. Then show how to use init to customize.







Claudemd update. Readme update.
How to use claude inside the devbox?


