FROM alpine:3.7

RUN set -xe \
    && apk add --no-cache aria2 \
    && aria2c https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 -o /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && adduser -D aria2

VOLUME /downloads /etc/aria2

EXPOSE 6800
CMD set -xe \
    && chown -R aria2:aria2 /downloads \
    && chown -R aria2:aria2 /etc/aria2 \
    && gosu aria2 aria2c --conf-path=/etc/aria2/aria2.conf
