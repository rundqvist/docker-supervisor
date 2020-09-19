FROM alpine:3.12

LABEL maintainer="mattias.rundqvist@icloud.com"

WORKDIR /app

RUN apk add --update --no-cache supervisor

COPY root /

RUN chmod +x /usr/sbin/log /usr/sbin/var \
	&& chmod +x /app/healthcheck.sh /app/entrypoint.sh

HEALTHCHECK --interval=30s --timeout=60s --start-period=15s \  
 CMD /bin/sh /app/healthcheck.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]