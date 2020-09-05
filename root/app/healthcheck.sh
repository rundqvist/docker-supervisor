#!/bin/sh

#
# Find all healtcheck.sh files
#
CHECKS="$(find /app/*/ -type f -name healthcheck.sh)";

for filepath in $CHECKS ; do

    #
    # Ensure execution rights and execute file
    #
    log -v "[Healthcheck] Executing $filepath"
    chmod +x $filepath    
    $filepath

    #
    # Check outcome
    #
    RC=$?

    if [ $RC -eq 1 ]; then
        log -e "[Healthcheck] $filepath failed"
        exit 1;
    fi
done

exit 0;
