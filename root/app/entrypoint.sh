#!/bin/sh

/app/supervisor/init.sh

exec supervisord -c /etc/supervisord.conf