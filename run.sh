#!/bin/bash

source env.conf


if [[ ${USE_PORT_MAPPING} != 0 ]]; then
    DOCKER_NETWORK="-p ${PORT_67_TCP}:67/tcp \
                    -p ${PORT_67_UDP}:67/udp \
                    -p ${PORT_69_UDP}:69/udp"
    echo "${0}: Using Docker port mapping."
else
    DOCKER_NETWORK="--network=host"
    echo "${0}: Using Docker Host network mode."
fi

docker run --rm -ti --privileged \
${DOCKER_NETWORK} \
-v ${TFTP_DIR}:/srv/tftp \
-v ${PWD}/etc/default/isc-dhcp-server:/etc/default/isc-dhcp-server \
-v ${PWD}/etc/dhcp/dhcpd.conf:/etc/dhcp/dhcpd.conf \
-v ${PWD}/etc/network/interfaces:/etc/network/interfaces \
${DOCKER_IMAGE}:${DOCKER_TAG}
