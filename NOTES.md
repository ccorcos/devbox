
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





Claudemd update. Readme update.
How to use claude inside the devbox?


