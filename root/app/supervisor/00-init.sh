#!/bin/sh

if [ ! -z "$(var HOST_IP)" ]
then

    if ! expr "$(var HOST_IP)" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null
    then
        log -e supervisor "HOST_IP has incorrect format."
        exit 1;
    fi

    log -d supervisor "HOST_IP is $(var HOST_IP)."

    if [ -z "$(var NETWORK)" ]
    then
        log -v supervisor "Network is empty. Setting from HOST_IP."

        var NETWORK "$(var HOST_IP | sed 's/\([0-9\.]*\)\.[0-9][0-9]*$/\1\.0/g')"
    fi
else
    log -w supervisor "HOST_IP is unknown."
    var -d HOST_IP
fi

if [ ! -z "$(var NETWORK)" ]
then
    if ! expr "$(var NETWORK)" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.0$' >/dev/null
    then
        log -e supervisor "NETWORK has incorrect format."
        exit 1;
    fi
    
    log -d supervisor "NETWORK is $(var NETWORK).";
else
    log -w supervisor "NETWORK is unknown.";
    var -d NETWORK
fi

exit 0;
