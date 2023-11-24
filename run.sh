#!/bin/bash

# Build the Docker image

docker stop unbound-dns
docker rm unbound-dns

docker build -t unbound-dns .
# Run the Docker container
docker run -it --rm --name unbound-dns -p 53:53/udp -p 53:53/tcp --network host unbound-dns
