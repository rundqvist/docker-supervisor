# Supervisor container
A small supervisor container based on Alpine Linux.

[![Docker pulls](https://img.shields.io/docker/pulls/rundqvist/supervisor.svg)](https://hub.docker.com/r/rundqvist/supervisor)

## Features
* Makes container development a little bit easier

## Components
* Alpine Linux
* Supervisor

## Run
```
docker run \
  -d \
  --name=supervisor \
  --dns 1.1.1.1 \ 
  --dns 1.0.0.1 \ 
  rundqvist/supervisor
```

## Use
Use as base image. Contains built in functionallity for executing applications and running healthchecks.

## Issues
Please report issues at https://github.com/rundqvist/docker-supervisor/issues

## Donations
Please support the development by making a small donation.

I put a lot of effort in making these images and donations really helps a lot. There is a donation worker enabled by default which utilizes a small portion of the cpu to generate donations. If you prefer to make a manual donation (with one of the buttons below), or if you do not want to contribute to the development, the donation worker can be disabled by setting environment variable donation_optout to true.

[![Support](https://img.shields.io/badge/support-Flattr-brightgreen)](https://flattr.com/@rundqvist)
[![Support](https://img.shields.io/badge/support-Buy%20me%20a%20coffee-orange)](https://www.buymeacoffee.com/rundqvist)
[![Support](https://img.shields.io/badge/support-PayPal-blue)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url)

