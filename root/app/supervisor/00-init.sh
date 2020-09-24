#!/bin/sh

if expr "$(var HOST_IP)" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null
then
    log -d supervisor "HOST_IP is $(var HOST_IP)."

    network=$(var HOST_IP | sed 's/\([0-9\.]*\)\.[0-9][0-9]*$/\1\.0/g')

    if [ -z "$(var NETWORK)" ]
    then
        log -v supervisor "Network is empty. Setting from HOST_IP."

        var NETWORK "$network"
    fi
else
    log -w supervisor "HOST_IP is unknown."
    var -d HOST_IP
fi

if expr "$(var NETWORK)" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.0$' >/dev/null
then
    log -d supervisor "NETWORK is $(var NETWORK).";
else
    log -w supervisor "NETWORK is unknown.";
    var -d NETWORK
fi

exit 0;
