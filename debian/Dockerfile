FROM debian:latest

RUN set -ex \
    && apt-get clean && apt-get update \
# install cron
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/* \
# making logging pipe
    && mkfifo --mode 0666 /var/log/cron.log \
# make pam_loginuid.so optional for cron
# see https://github.com/docker/docker/issues/5663#issuecomment-42550548
    && sed --regexp-extended --in-place \
    's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' \
    /etc/pam.d/cron

COPY start-cron /usr/sbin

CMD ["start-cron"]
