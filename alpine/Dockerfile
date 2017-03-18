FROM alpine:latest

RUN set -ex \
# install bash
    && apk add --no-cache \
    bash \
# making logging pipe
    && mkfifo -m 0666 /var/log/cron.log \
    && ln -s /var/log/cron.log /var/log/crond.log

COPY start-cron /usr/sbin

CMD ["start-cron"]
