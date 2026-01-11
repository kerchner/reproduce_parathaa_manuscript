# Use Ubuntu 24.04 (Noble Numbat)
FROM --platform=linux/amd64 ubuntu:24.04

# Prevent tzdata and other packages from prompting for input
ENV DEBIAN_FRONTEND=noninteractive

# Create ubuntu user with home directory
RUN id -u ubuntu 2>/dev/null || useradd -ms /bin/bash ubuntu

# Update and install basic tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Switch to ubuntu user
USER ubuntu
WORKDIR /home/ubuntu

# Install pixi as ubuntu user
RUN curl -fsSL https://pixi.sh/install.sh | sh

# Manually add to the path
RUN echo 'export PATH="$HOME/.pixi/bin:$HOME/.local/bin:$PATH"' >> /home/ubuntu/.bashrc


# Default command
CMD [ "bash" ]

