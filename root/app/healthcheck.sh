#!/bin/sh

CHECKS=$(find /app/*/ -type f -name healthcheck.sh)

for filepath in $CHECKS ; do
    
    chmod +x $filepath
    
    $filepath
    RC=$?

    if [ $RC -eq 1 ]; then
        echo "Healthcheck $filepath failed" >> /var/log/healthcheck.log
        exit 1;
    fi
done

exit 0;
