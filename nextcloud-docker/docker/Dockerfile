FROM nextcloud:apache

RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        libmagickcore-6.q16-6-extra \
        procps \
        smbclient \
        supervisor \
#       libreoffice \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    \
    savedAptMark="$(apt-mark showmanual)"; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libbz2-dev \
        libc-client-dev \
        libkrb5-dev \
        libsmbclient-dev \
    ; \
    \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install \
        bz2 \
        imap \
    ; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    \
# reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
    apt-mark auto '.*' > /dev/null; \
    apt-mark manual $savedAptMark; \
    ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
        | awk '/=>/ { print $3 }' \
        | sort -u \
        | xargs -r dpkg-query -S \
        | cut -d: -f1 \
        | sort -u \
        | xargs -rt apt-mark manual; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p \
    /var/log/supervisord \
    /var/run/supervisord \
;

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

# start: rclone
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
        curl \
        fuse \
    ; \
# Install rclone (support for remote filesystem)
# fixed: /bin/sh: 1: sudo: not found
#RUN curl https://rclone.org/install.sh | sudo bash
RUN curl https://rclone.org/install.sh | bash
RUN mkdir -p ~/.config/rclone/
# fixed: 注意: 在 COPY 中 使用 ~ 无法成功复制 ( 无 ~/.config/rclone/rclone.conf 文件 ), 但不会报错
#COPY rclone/rclone.conf ~/.config/rclone/rclone.conf
COPY rclone/rclone.conf /root/.config/rclone/rclone.conf
RUN mkdir -p /app/rclone
# rclone pcloud-1
COPY rclone/pcloud-1.sh /app/rclone/pcloud-1.sh
# end: rclone

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]