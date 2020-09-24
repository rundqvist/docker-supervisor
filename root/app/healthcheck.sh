#!/bin/sh

log -d supervisor "Running health checks."

#
# Find all healtcheck.sh files
#
CHECKS="$(find /app/*/ -type f -name healthcheck.sh)";

for filepath in $CHECKS ; do

    #
    # Ensure execution rights and execute file
    #
    log -v supervisor "Executing $filepath."
    chmod +x $filepath    
    $filepath

    #
    # Check outcome
    #
    if [ $? -eq 1 ]; then
        log -d supervisor "Check $filepath failed."
        exit 1;
    fi
done

exit 0;
