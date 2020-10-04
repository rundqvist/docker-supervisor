#!/bin/sh

log -v "Checking network..."

if var -e NETWORK
then
    log -i "Adding route for communication with network $(var NETWORK)/24.";
    route add -net $(var NETWORK) netmask 255.255.255.0 gw $(ip route | awk '/default/ { print $3 }') 2>/dev/null

    if [ $? -eq 1 ]
    then
        log -e "Failed to add route. Add '--cap-add=NET_ADMIN' to docker run command to allow adding route.";
    fi
else
    log -w "NETWORK missing or wrong format. May cause communication problems.";
fi

exit 0;
