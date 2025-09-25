# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is `devbox`, a Docker-based development environment isolation tool. It allows developers to isolate projects using Docker containers, with each project directory becoming a mounted volume in a named container.

## Core Architecture

The project consists of three main components:

1. **devbox shell script** (`devbox`) - The main CLI tool that manages Docker containers
2. **Dockerfile** - Defines the development environment with Ubuntu base, development tools, and shell configuration
3. **Docker workflow** - Container lifecycle management based on current directory name

## Key Commands

### Container Management
```sh
# Start/create a container for current directory (or attach if running)
devbox

# Explicitly start container (creates if doesn't exist, starts if stopped)
devbox start

# Stop container without removing
devbox stop

# Destroy container (stop and remove)
devbox destroy

# List all running devbox containers
devbox list
```

### Docker Operations
```sh
# Build the devbox image (must be done first)
docker build -t devbox .

# Check running containers
docker ps

# View all containers (running and stopped)
docker ps -a
```

## Development Environment Setup

The Dockerfile includes a comprehensive development stack:
- **Languages**: Python 3, Node.js/npm
- **Tools**: Git, curl, build-essential, cmake, jq, pandoc, SQLite3
- **Media**: FFmpeg, ImageMagick, GraphicsMagick, LibreOffice
- **Shell**: Zsh with Prezto configuration
- **Utilities**: z command for directory jumping, various development libraries

## Container Behavior

- Container name matches the current directory basename (`$(basename "$PWD")`)
- Current directory is mounted as `/$CONTAINER_NAME` inside the container
- Port 8080 is exposed by default
- Containers persist between runs (stop/start cycle)
- Multiple terminal sessions can attach to the same running container

## Prerequisites

Install Docker and OrbStack:
```sh
brew install docker orbstack
```

Start OrbStack VM:
```sh
orb        # start
orb stop   # stop
```

Install devbox command globally:
```sh
sudo ln -s "$(pwd)"/devbox /usr/local/bin/devbox
```
