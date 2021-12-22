# syntax=docker/dockerfile:1
FROM centos:centos7.9.2009

# Docker image build arguments:
ARG endpoint="https://api.slateci.io:443"
ARG token

# Docker container environmental variables:
ENV DEBUG=True
ENV HISTFILE=/work/.bash_history_docker
ENV SLATE_API_ENDPOINT=${endpoint}
ENV SLATE_CLI_TOKEN=${token}

# Package installs/updates:
RUN yum install epel-release -y
RUN yum install cmake3 \
    gcc-c++.x86_64 \
    libcurl-devel \
    make \
    openssl-devel \
    zlib-devel -y

# Prepare entrypoint:
COPY ./docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh

# Create the work directory:
RUN mkdir /work
WORKDIR /work

# Volumes
VOLUME [ "/work" ]

# Run once the container has started:
ENTRYPOINT [ "/docker-entrypoint.sh" ]