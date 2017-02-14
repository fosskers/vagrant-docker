#!/bin/bash

apt-get update

# --- Docker Setup --- #
# https://docs.docker.com/engine/installation/linux/ubuntu/
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
# Add docker repo
curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
apt-get update
# Pin the docker version
apt-get install -y docker-engine=1.12.6-0~ubuntu-xenial
# Allow non-root to use `docker`
usermod -aG docker ubuntu

# Docker Compose
# https://docs.docker.com/compose/install/
curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
