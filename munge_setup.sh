useradd munge
chsh -s /bin/bash munge

chmod 0700 /etc/munge/
chown munge /etc/munge/

chmod 0711 /var/lib/munge/
chown munge /var/lib/munge/

chmod 0700 /var/log/munge
chown munge /var/log/munge

chmod 0755 /var/run/munge
chown munge /var/run/munge
