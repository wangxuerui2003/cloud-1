#!/bin/bash
set -e

# Generate a random Blowfish secret key (32 characters)
BLOWFISH_SECRET=$(openssl rand -base64 32 | tr -d '\n')

# Replace the blowfish secret in the config.inc.php file
sed -i "s|\$cfg\['blowfish_secret'\] = .*;|\$cfg['blowfish_secret'] = '$BLOWFISH_SECRET';|" /usr/share/phpmyadmin/config.inc.php

# If PMA_HOST is set, update the MySQL host in the config
if [ -n "$PMA_HOST" ]; then
  sed -i "s|\(\$cfg\['Servers'\]\[\$i\]\['host'\] = \).*;|\1'$PMA_HOST';|" /usr/share/phpmyadmin/config.inc.php
else
  sed -i "s|\(\$cfg\['Servers'\]\[\$i\]\['host'\] = \).*;|\1'mariadb';|" /usr/share/phpmyadmin/config.inc.php
fi

# Execute the original entrypoint command
exec "$@"
