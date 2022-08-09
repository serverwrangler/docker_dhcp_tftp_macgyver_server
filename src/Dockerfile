FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
     isc-dhcp-server \
     tftpd-hpa \
    && apt-get clean all \
    && apt-get autoremove -y \
    && apt-get purge \
    && rm -rf /var/lib/{apt,dpkg,cache,log} \
    && touch /var/lib/dhcp/dhcpd.leases 

# Export the DHCP/TFTP server ports
EXPOSE 67/tcp \
       67/udp \
       69/udp

WORKDIR /

VOLUME ["/etc/dhcp"]
VOLUME ["/etc/default"]

COPY entrypoint.sh /entrypoint.sh
    # Set correct entrypoint permission
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
