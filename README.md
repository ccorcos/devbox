# 🛡️ devbox - Development Environments Made Simple

**Protect your computer from malicious code by isolating your development environments in Docker containers.**

## Setup

Install Docker and OrbStack (a fast Docker runtime for macOS):

```bash
brew install docker orbstack
```

Clone the repository and add the `devbox` command to your path somewhere.

```bash
# Clone the repository
git clone https://github.com/your-username/devbox.git
cd devbox

# Make devbox available system-wide by symlinking it to your PATH
sudo ln -s "$(pwd)/devbox" /usr/local/bin/devbox
```

Customize your default devbox by modifying `Dockerfile.devbox`

## Usage

```bash
cd your-project
devbox
```

For a project-specific `Dockerfile.devbox`:

```bash
cd your-project
devbox init
```

Docker containers will be started and stopped on demand. And when you exit the container it will ask you if you'd like to delete it.

```
❯❯❯ devbox --help
Usage: /usr/local/bin/devbox [COMMAND]

Commands:
  (no args)  - Create the devbox and attach to it.
  status     - Show status of devbox Dockerfile, image, and container.
  init       - Copy Dockerfile.devbox template to current directory for a project-specific devbox.
  delete     - Stop the container, delete it, and delete the image.
  stop       - Stop the container and delete the container.
  off        - Force stop all devbox containers and stop OrbStack.
```

## How It Works

1. **Project Detection**: devbox automatically detects if you have a custom `Dockerfile.devbox` in your project
2. **Image Building**: Creates a Docker image with your specified tools and dependencies
3. **Container Creation**: Spins up an isolated container from the image
4. **File Mounting**: Mounts your project directory into the container so you can edit files
5. **Shell Access**: Drops you into a shell inside the secure container

## Security Benefits

- **Supply Chain Protection**: npm/pip/cargo packages can only access the container, not your host system
- **Clean Environments**: Each project gets a fresh, clean environment without conflicts
- **Consistent Environments**: Same tools and versions across different machines
- **Easy Cleanup**: Delete containers instantly without leaving traces on your system

## Advanced Configuration

### Port Forwarding

By default, no ports are forwarded. To forward a port into your container:

```bash
PORT=3000 devbox
```

You can run multiple devboxes simultaneously with different ports:

```bash
# In one project
PORT=3000 devbox

# In another project
PORT=3001 devbox
```

### Persistent Data

Your project files are automatically mounted and persist between container runs. Everything else in the container is ephemeral.

## Troubleshooting

### Docker/OrbStack Issues

```bash
# Check if Docker is running
devbox status

# Restart OrbStack if needed
orb restart

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
