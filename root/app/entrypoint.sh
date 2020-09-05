#!/bin/sh

touch /var/log/main.log
tail -f -n 0 /var/log/main.log &

cat /app/supervisor/info.txt

var --set-env;

log -i "Initializing container.";

for i in 0 1 2 3 4 5 6 7 8 9 ; do

    INIT=$(find /app/*/ -type f -name 0$i-init.sh)

    for filepath in $INIT ; do

        #
        # Ensure execution rights and execute file
        #
        chmod +x $filepath
        log -d "Executing: "$filepath
        $filepath

        if [ $? = 1 ] ; then

            log -e "Initialize failed on executing: $filepath"
            exit 1;

        fi
        
    done

done

log -i "Starting applications.";
exec supervisord -c /app/supervisor/01-supervisord.conf
