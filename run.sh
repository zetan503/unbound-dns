#!/bin/bash

# Build the Docker image

docker stop unbound-dns
docker rm unbound-dns
docker build -t unbound-dns .
docker run --name unbound-dns -p 53:53/udp -p 53:53/tcp -d --network host unbound-dns
