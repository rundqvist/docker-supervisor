#!/bin/sh

#
# Find all healtcheck.sh files
#
CHECKS=$(find /app/*/ -type f -name healthcheck.sh)

for filepath in $CHECKS ; do

    #
    # Ensure execution rights and execute file
    #
    chmod +x $filepath    
    $filepath

    #
    # Check outcome
    #
    RC=$?

    if [ $RC -eq 1 ]; then
        echo "Healthcheck $filepath failed" >> /var/log/healthcheck.log
        exit 1;
    fi
done

exit 0;
