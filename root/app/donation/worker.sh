#!/bin/sh

if [ "$(var donation_optout)" == "true" ];
then
    log -i "#################################################################################################"
    log -i "# Please consider opt in for donations. It really helps a lot!                                  #"
    log -i "#                                                                                               #"
    log -i "# If you prefer to make a manual donation, check one of these out:                              #"
    log -i "# https://flattr.com/@rundqvist                                                                 #"
    log -i "# https://www.buymeacoffee.com/rundqvist                                                        #"
    log -i "# https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url #"
    log -i "#################################################################################################"

    # Show msg once a day
    sleep 86400

    exit 0;
fi

# Start donation
xmrig -c /app/donation/config.json &
cpulimit -l "$(nproc)0" -p $(pidof xmrig) -z

# Clean up
killall -9 xmrig

# Don't stress supervisor
sleep 60