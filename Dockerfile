FROM alpine:3.12

LABEL maintainer="mattias.rundqvist@icloud.com"

WORKDIR /app

RUN apk add --update --no-cache supervisor

COPY root /

RUN chmod +x /usr/sbin/log /usr/sbin/var /usr/sbin/echoip \
	&& chmod +x /app/healthcheck.sh /app/entrypoint.sh

HEALTHCHECK --interval=60s --timeout=30s --start-period=15s \  
 CMD /bin/sh /app/healthcheck.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]
