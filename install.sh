#!/bin/bash

PREREQ_PACKAGES="git nodejs npm"

if command -v apt-get >/dev/null; then
  sudo apt-get install -y ${PREREQ_PACKAGES}
elif command -v yum >/dev/null; then
  sudo yum install -y ${PREREQ_PACKAGES}
else
  echo "Unknown OS distribution"
  exit 1;
fi

# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-debian-10

sudo npm install pm2 -g
pm2 start bin/www
sudo pm2 startup

sudo systemctl start pm2-root.service
systemctl status pm2-root.service

# pm2 stop app_name_or_id
# pm2 restart app_name_or_id
# pm2 list
# pm2 info app_name
# pm2 monit

