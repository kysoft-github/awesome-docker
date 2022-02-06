FROM ubuntu:20.04

LABEL maintainer="yiyun <yiyungent@gmail.com>"


COPY SSPanel-Uim /var/www
WORKDIR /var/www


RUN cp config/.config.example.php config/.config.php && \
    cp config/appprofile.example.php config/appprofile.php && \
    wget https://getcomposer.org/installer -O composer.phar && \
    chmod 755 -R * && \
    chmod -R 777 /var/www/storage/framework/smarty/compile/ && \
    chown www -R * && \
    php composer.phar && \
    php composer.phar install && \
    php xcat initQQWry && \
    php xcat ClientDownload && \
    crontab -l | { cat; echo "30 22 * * * php /var/www/xcat sendDiaryMail"; } | crontab - && \
    crontab -l | { cat; echo "0 0 * * * php /var/www/xcat Job DailyJob"; } | crontab - && \
    crontab -l | { cat; echo "*/1 * * * * php /var/www/xcat Job CheckJob"; } | crontab - && \
    { \
        echo '[program:crond]'; \
        echo 'command=cron -f'; \
        echo 'autostart=true'; \
        echo 'autorestart=true'; \
        echo 'killasgroup=true'; \
        echo 'stopasgroup=true'; \
    } | tee /etc/supervisor/crond.conf

