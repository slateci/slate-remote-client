# syntax=docker/dockerfile:1
FROM centos:centos7.9.2009

# Docker container environmental variables:
ENV HISTFILE=/work/.bash_history_docker

# Docker container environmental variables:
ENV DEBUG=True

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

# Set the work directory:
RUN mkdir /work

# Volumes
VOLUME [ "/work" ]

# Run once the container has started:
ENTRYPOINT [ "/docker-entrypoint.sh" ]