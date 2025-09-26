# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

devbox is a secure development environment tool that isolates development work inside Docker containers to protect against supply chain attacks and malicious packages. It's designed for beginners to easily containerize their development environments while maintaining full access to their project files.

## Architecture

- **Main Script**: `devbox` - POSIX shell script that handles all container operations
- **Default Environment**: `Dockerfile.devbox` - Ubuntu-based container with common development tools
- **Project-Specific**: Projects can have their own `Dockerfile.devbox` for customized environments
- **Naming Convention**:
  - With local Dockerfile: `devbox-$PROJECT_NAME` (container) and `devbox-$PROJECT_NAME` (image)
  - Without local Dockerfile: `$PROJECT_NAME-devbox` (container) and `devbox` (image)

## Common Commands

| Command | Description |
|---------|-------------|
| `./devbox` | Create and attach to development container |
| `./devbox status` | Show container and image status |
| `./devbox init` | Create custom `Dockerfile.devbox` in current project |
| `./devbox start` | Start a stopped container |
| `./devbox stop` | Stop and remove current project's container |
| `./devbox off` | Stop all devbox containers and shut down Docker |
| `./devbox build` | Force rebuild the Docker image |

## Development Setup

### Prerequisites
- Docker and OrbStack installed via `brew install docker orbstack`
- System-wide installation via symlink: `sudo ln -s "$(pwd)/devbox" /usr/local/bin/devbox`

### Container Environment
- Default port forwarding: 3000 (configurable via `PORT` environment variable)
- Project directory mounted read-write at `/workspace`
- Containers use Zsh with Prezto configuration
- Includes Claude Code (`@anthropic-ai/claude-code`) pre-installed

### Key Features
- Automatic Dockerfile change detection and image rebuilding
- Smart container reuse (attaches to existing containers if running)
- Project isolation through Docker container sandboxing
- Port forwarding for web development

## File Structure
- `/devbox` - Main executable script
- `/Dockerfile.devbox` - Default container template
- `/README.md` - User documentation
- `/NOTES.md` - Development notes and Docker commands
- `/.git/` - Git repository
- `/.gitignore` - Git ignore rules

## Security Model
The tool protects the host system by:
- Running all development work inside isolated containers
- Mounting only the project directory (not system directories)
- Preventing access to SSH keys, credentials, and personal files
- Allowing easy cleanup of potentially compromised environments