#!/bin/sh

log -v supervisor "[health] Check health"

#
# Find all healtcheck.sh files
#
CHECKS="$(find /app/*/ -type f -name healthcheck.sh)";

for filepath in $CHECKS ; do

    #
    # Ensure execution rights and execute file
    #
    log -d supervisor "[health] Executing $filepath"
    chmod +x $filepath    
    $filepath

    #
    # Check outcome
    #
    RC=$?

    if [ $RC -eq 1 ]; then
        log -e supervisor "[health] $filepath failed"
        exit 1;
    fi
done

exit 0;
