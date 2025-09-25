# Use an official Ubuntu base image
FROM ubuntu:latest

# Update and install necessary utilities
RUN apt-get update

# Python
RUN apt-get install -y \
			python3 \
			python3-pip

# Node
RUN apt-get install -y \
			nodejs \
			npm

# Basics
RUN apt-get install -y \
			git \
			git-extras \
			curl \
			openssl \
			build-essential \
			cmake

# Utils
RUN apt-get install -y \
			gnupg \
			jq \
			tldr \
			pandoc \
			sqlite3 \
			ffmpeg \
			imagemagick \
			graphicsmagick


# Install z command
RUN curl -L https://raw.githubusercontent.com/rupa/z/master/z.sh -o /usr/local/bin/z.sh && \
    chmod +x /usr/local/bin/z.sh && \
		mkdir -p /usr/local/share/man/man1 && \
		curl -L https://raw.githubusercontent.com/rupa/z/master/z.1 -o /usr/local/share/man/man1/z.1

# Zsh
RUN apt-get install -y zsh

# Install Zsh and Prezto
RUN apt-get update && apt-get install -y zsh git && \
    git clone --recursive https://github.com/sorin-ionescu/prezto.git /root/.zprezto && \
    zsh -c 'setopt EXTENDED_GLOB; for rcfile in /root/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "/root/.${rcfile:t}"; done'
#     echo "\
# zstyle ':prezto:*:*' case-sensitive 'no'\n\
# zstyle ':prezto:*:*' color 'yes'\n\
# zstyle ':prezto:load' pmodule \\\n\
#   'environment' \\\n\
#   'terminal' \\\n\
#   'editor' \\\n\
#   'history' \\\n\
#   'directory' \\\n\
#   'spectrum' \\\n\
#   'utility' \\\n\
#   'completion' \\\n\
#   'git' \\\n\
#   'osx' \\\n\
#   'syntax-highlighting' \\\n\
#   'history-substring-search' \\\n\
#   'prompt'\n\
# zstyle ':prezto:module:editor' dot-expansion 'yes'\n\
# zstyle ':prezto:module:history-substring-search:color' found ''\n\
# zstyle ':prezto:module:history-substring-search:color' not-found ''\n\
# zstyle ':prezto:module:prompt' theme 'sorin'\n\
# zstyle ':prezto:module:terminal' auto-title 'yes'\n\
# zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'\n\
# zstyle ':prezto:module:terminal:tab-title' format '%m: %s'\n\
# " > /root/.zpreztorc


# More image-related tools.
RUN apt-get install -y \
	libcairo2-dev \
	libjpeg-dev \
	libpango1.0-dev \
	libgif-dev \
	librsvg2-dev \
	pkg-config \
	libreoffice \
	iputils-ping

RUN apt-get install -y locales && \
		locale-gen en_US.UTF-8 && \
		echo "export LANG=en_US.UTF-8\nexport LANGUAGE=en_US:en\nexport LC_ALL=en_US.UTF-8" >> /root/.zshrc

# Cleanup apt cache
RUN apt-get clean

CMD ["zsh"]

# Expose a range of ports (still need to use docker -P).
# EXPOSE 8000-8099
EXPOSE 8080

# Later
# - make sure pip is up to date.
# - install n to change node versions.

