#!/bin/bash
# copy files from MISP-BKP to MISP
#chown -R 33:33 /var/www/MISP-BKP && cp -fR /var/www/MISP-BKP/* /var/www/MISP
# set cronjob for backups
#crontab -l > cron_bkp
#echo "0 */6 * * * cp -fR /var/www/MISP/* /var/www/MISP-BKP" >> cron_bkp
#crontab cron_bkp
#rm cron_bkp
# start supervisord
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf