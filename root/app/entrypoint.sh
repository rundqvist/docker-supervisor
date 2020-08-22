#!/bin/sh

INIT=$(find /app/*/ -type f -name *-init.sh | sed -n -e 's/^\(.*\)\/\(\d\d\)-init.sh/\2-init.sh/p' | sort)

log -i "Initialize begin.";
for file in $INIT ; do
    filepath=$(find /app/ -type f -name $file)

    chmod +x $filepath
    log -i "Executing: "$filepath
    $filepath
done
log -i "Initialize done.";

log -i "Starting supervisord.";
exec supervisord -c /etc/supervisord.conf
