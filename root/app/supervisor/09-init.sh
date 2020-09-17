#!/bin/sh

log -v supervisor "Checking network..."

if var -e NETWORK; then

    log -i supervisor "Adding route for communication with network $(var NETWORK)/24";
    route add -net $(var NETWORK) netmask 255.255.255.0 gw $(ip route | awk '/default/ { print $3 }') 2>/dev/null

    if [ $? -eq 1 ] ; then
        log -e supervisor "Failed to add route. Add '--cap-add=NET_ADMIN' to docker run command to avoid this.";
    fi

else

    log -w supervisor "NETWORK missing or wrong format. May cause communication problems.";

fi

exit 0;
