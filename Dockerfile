FROM alpine:3.12

LABEL maintainer="mattias.rundqvist@icloud.com"

WORKDIR /app

COPY root /

RUN apk add --update --no-cache supervisor \
	&& chmod +x /usr/sbin/log /usr/sbin/var /usr/sbin/getv /usr/sbin/setv \
	&& chmod +x /app/healthcheck.sh \
	&& chmod +x /app/entrypoint.sh

HEALTHCHECK --interval=30s --timeout=60s --start-period=15s \  
 CMD /bin/sh /app/healthcheck.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]