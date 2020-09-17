#!/bin/sh

touch /var/log/main.log
tail -f -n 0 /var/log/main.log &

cat /app/supervisor/info.txt

var --set-env;

if [ -f /app/mandatory.sh ] ; then
    
    chmod +x /app/mandatory.sh
    /app/mandatory.sh
    
    if [ $? = 1 ] ; then

        log -e supervisor "Failed to start."
        sleep 5;
        exit 1;

    fi
fi

log -i supervisor "Initializing container.";

for i in 0 1 2 3 4 5 6 7 8 9 ; do

    INIT=$(find /app/*/ -type f -name 0$i-init.sh)

    for filepath in $INIT ; do

        #
        # Ensure execution rights and execute file
        #
        chmod +x $filepath
        log -d supervisor "Executing: "$filepath
        $filepath

        if [ $? = 1 ] ; then

            log -e supervisor "Initialize failed on executing: $filepath"
            sleep 5;
            exit 1;

        fi
        
    done

done

log -i supervisor "Starting applications.";
exec supervisord -c /app/supervisor/01-supervisord.conf
