# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Unbound and Bash
RUN apt-get update && \
    apt-get install -y unbound bash && \
    rm -rf /var/lib/apt/lists/*

# Copy the Unbound configuration file and root hints
COPY unbound.conf /etc/unbound/unbound.conf

# curl -Lo root.hints https://www.internic.net/domain/named.cache
COPY root.hints /etc/unbound/root.hints
COPY local.zone /etc/unbound/local.zone

# Set the working directory
WORKDIR /root

# Expose DNS port
EXPOSE 53/udp

# Start Unbound

CMD ["/bin/sh", "-c", "unbound-checkconf && exec unbound -c /etc/unbound/unbound.conf -vvv"]

#CMD ["bash"]

