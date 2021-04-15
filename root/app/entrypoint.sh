#!/bin/sh

touch /var/log/main.log
tail -f -n 0 /var/log/main.log &

var --set-env;

log -i "Initializing container.";

for i in 0 1 2 3 4 5 6 7 8 9
do
    INIT=$(find /app/*/ -type f -name 0$i-init.sh)

    for filepath in $INIT
    do
        #
        # Ensure execution rights and execute file
        #
        chmod +x $filepath
        log -v "Executing: $filepath."
        $filepath

        if [ $? = 1 ]
        then
            log -d "Initialize failed on executing: $filepath."
            sleep 5;
            exit 1;
        fi
    done
done

log -i "Starting applications.";
exec supervisord -c /app/supervisor/01-supervisord.conf
