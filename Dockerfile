FROM ghcr.io/pburgisser/misp-container-base:misp-v2.4.170

RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx && \
    apt-get autoremove -y && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# nginx
RUN rm /etc/nginx/sites-enabled/*; mkdir /run/php /etc/nginx/certs
COPY files/etc/nginx/misp /etc/nginx/sites-available/misp
COPY files/etc/nginx/misp-secure /etc/nginx/sites-available/misp-secure
COPY files/etc/nginx/misp80 /etc/nginx/sites-available/misp80
COPY files/etc/nginx/misp80-noredir /etc/nginx/sites-available/misp80-noredir

# Entrypoints
COPY files/etc/supervisor/supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY files/entrypoint_fpm.sh /
COPY files/entrypoint_nginx.sh /
COPY files/entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

# Change Workdirectory
WORKDIR /var/www/MISP

EXPOSE 8080
EXPOSE 8443
