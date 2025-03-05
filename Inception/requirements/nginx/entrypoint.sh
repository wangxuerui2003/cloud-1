#!/bin/bash

sed /etc/nginx/sites-available/wordpress -e "s/cloud1_server_name/$DOMAIN_NAME/g" -i

exec "$@"
