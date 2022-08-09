#!/bin/sh

# Make sure we react to these signals by running stop() when we see them - for clean shutdown
# And then exiting
trap "stop; exit 0;" TERM INT

stop()
{
# We're here because we've seen SIGTERM, likely via a Docker stop command or similar
# Let's shutdown cleanly
    echo "SIGTERM caught, terminating process(es)..."
    echo "TFTP Terminate..."
    service tftpd-hpa stop
    echo "DHCP Terminate..."
    service isc-dhcp-server stop

    exit 0
}

start()
{
    echo "Starting services..."
    echo "DHCP init..."
    service isc-dhcp-server start
    echo "TFTP init..."
    service tftpd-hpa start

    echo "Started..."
    while true; do sleep 1; done

    exit 0
}

start
