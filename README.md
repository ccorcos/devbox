# 🛡️ devbox - Secure Development Environments Made Simple

**Protect your computer from supply chain attacks and malicious code by isolating your development environments in Docker containers.**

## Why devbox?

Modern development involves installing countless packages from npm, pip, cargo, and other package managers. Each package could potentially contain malicious code that could:
- Access your SSH keys and personal files
- Install backdoors or malware on your system
- Steal credentials and sensitive data
- Compromise your entire development machine

**devbox solves this by sandboxing your development work inside secure Docker containers**, keeping potential threats isolated from your main system.

## What is Docker?

Docker is a containerization platform that packages applications and their dependencies into lightweight, isolated containers. Think of containers like virtual machines, but much faster and more efficient.

- **Images**: Read-only templates that define what goes into a container (like a blueprint)
- **Containers**: Running instances of images that are completely isolated from your host system
- **Isolation**: Each container has its own filesystem, network, and processes - totally separate from your computer

When you run code inside a Docker container, even if it's malicious, it can't access your personal files, SSH keys, or other sensitive data on your host machine.

## Installation

### Prerequisites

Install Docker and OrbStack (a fast Docker runtime for macOS):

```bash
brew install docker orbstack
```

### Install devbox

```bash
# Clone the repository
git clone https://github.com/your-username/devbox.git
cd devbox

# Make devbox available system-wide by symlinking it to your PATH
sudo ln -s "$(pwd)/devbox" /usr/local/bin/devbox
```

## Quick Start

### 1. Basic Usage (Default Environment)

Navigate to any project and run devbox:

```bash
cd your-project
devbox
```

This creates a secure container with common development tools and drops you into a shell inside it. Your project files are mounted read-write, but everything else is isolated.

### 2. Custom Project Environment

For project-specific tool requirements:

```bash
cd your-project
devbox init
```

This creates a `Dockerfile.devbox` in your project that you can customize.

Then run:

```bash
devbox
```

Your customized environment will be built and started automatically.

## How It Works

1. **Project Detection**: devbox automatically detects if you have a custom `Dockerfile.devbox` in your project
2. **Image Building**: Creates a Docker image with your specified tools and dependencies
3. **Container Creation**: Spins up an isolated container from the image
4. **File Mounting**: Mounts your project directory into the container so you can edit files
5. **Shell Access**: Drops you into a shell inside the secure container

## Security Benefits

- **Supply Chain Protection**: npm/pip/cargo packages can only access the container, not your host system
- **Credential Isolation**: Your SSH keys, browser cookies, and other credentials stay on your host
- **Clean Environments**: Each project gets a fresh, clean environment without conflicts
- **Easy Cleanup**: Delete containers instantly without leaving traces on your system
- **Consistent Environments**: Same tools and versions across different machines

## Commands

| Command | Description |
|---------|-------------|
| `devbox` | Create and attach to your development container |
| `devbox status` | Show status of your containers and images |
| `devbox init` | Create a custom `Dockerfile.devbox` for your project |
| `devbox start` | Start a stopped container |
| `devbox stop` | Stop and remove the current project's container |
| `devbox off` | Stop all devbox containers and shut down Docker |
| `devbox build` | Force rebuild the Docker image |

## Example Workflows

### Web Development with Node.js

```bash
cd my-web-app
devbox init
# Edit Dockerfile.devbox to include Node.js, npm, etc.
devbox
# Inside container:
npm install
npm run dev
```

## Advanced Configuration

### Port Forwarding

By default, port 3000 is forwarded. To use a different port:

```bash
PORT=8080 devbox
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
