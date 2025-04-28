FROM jenkins/jenkins:1.18.2

USER root

# Instalar docker y docker-compose
RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    curl \
    sudo \
    && apt-get clean

# Dar permisos al usuario Jenkins para usar docker
RUN usermod -aG docker jenkins

USER jenkins
