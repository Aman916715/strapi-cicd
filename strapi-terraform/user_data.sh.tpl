#!/bin/bash
set -eux

apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release awscli

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

systemctl enable --now docker
groupadd docker || true
usermod -aG docker ubuntu

# Compute registry from image
REGISTRY=$(echo "${docker_image}" | cut -d'/' -f1)
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin $REGISTRY

# Pull & run container
docker pull ${var.image_uri}:${var.image_tag}
docker run -d --name strapi -p 1337:1337 ${var.image_uri}:${var.image_tag}
