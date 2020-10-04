#!/bin/sh

if [ ! -z "$(var HOST_IP)" ]
then

    if ! expr "$(var HOST_IP)" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null
    then
        log -e "HOST_IP has incorrect format."
        exit 1;
    fi

    log -d "HOST_IP is $(var HOST_IP)."

    if [ -z "$(var NETWORK)" ]
    then
        log -v "Network is empty. Setting from HOST_IP."

        var NETWORK "$(var HOST_IP | sed 's/\([0-9\.]*\)\.[0-9][0-9]*$/\1\.0/g')"
    fi
else
    log -w "HOST_IP is unknown."
    var -d HOST_IP
fi

if [ ! -z "$(var NETWORK)" ]
then
    if ! expr "$(var NETWORK)" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.0$' >/dev/null
    then
        log -e "NETWORK has incorrect format."
        exit 1;
    fi
    
    log -d "NETWORK is $(var NETWORK).";
else
    log -w "NETWORK is unknown.";
    var -d NETWORK
fi

exit 0;
