FROM alpine:3.12

LABEL maintainer="mattias.rundqvist@icloud.com"

WORKDIR /app

COPY root /

RUN apk add --update --no-cache supervisor \
	&& chmod 755 /usr/sbin/log \
	&& chmod 755 /app/healthcheck.sh \
	&& chmod 755 /app/entrypoint.sh

HEALTHCHECK --interval=30s --timeout=60s --start-period=15s \  
 CMD /bin/sh /app/healthcheck.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]