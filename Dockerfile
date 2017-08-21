FROM abiosoft/caddy:0.10.6-php

ENV HUMHUB_VERSION=1.2.2

RUN apk add --no-cache php7-exif php7-intl && \
    curl -L "https://www.humhub.org/en/download/start?version=${HUMHUB_VERSION}&type=tar.gz&ee=0" | tar xz --strip-components=1 && \
    chmod +x ./protected/yii && \
    # php7-fpm run as nobody
    chown -R nobody:nobody /srv
