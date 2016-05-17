FROM debian:jessie

RUN apt-get update \
    && apt-get install -y \
    cron \
    && rm -rf /var/lib/apt/lists/*

RUN touch /var/log/cron.log

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash", "-c", "cron && tail -f /var/log/cron.log"]
