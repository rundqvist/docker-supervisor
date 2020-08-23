#!/bin/sh

log -i "Initialize begin.";

#
# Find all filenames matching [dd]-init.sh and order them
#
INIT=$(find /app/*/ -type f -name *-init.sh | sed -n -e 's/^\(.*\)\/\(\d\d\)-init.sh/\2-init.sh/p' | sort)

for file in $INIT ; do

    #
    # Resolve entire path to file
    #
    filepath=$(find /app/ -type f -name $file)

    #
    # Ensure execution rights and execute file
    #
    chmod +x $filepath
    log -i "Executing: "$filepath
    $filepath

done

log -i "Initialize done.";

log -i "Starting supervisor.";
exec supervisord -c /app/supervisor/01-supervisord.conf
