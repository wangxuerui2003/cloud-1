#!/bin/bash

# If no wordpress file, download and configure the wp-config.php file
if [ ! -e "./wp-config.php" ]; then    

	wp core download --allow-root

	wp config create --dbname=$WORDPRESS_DB_NAME \
		--dbuser=$WORDPRESS_DB_USER \
		--dbpass=$WORDPRESS_DB_PASSWORD \
		--dbhost=$WORDPRESS_DB_HOST \
		--allow-root

	wp core install --url=$DOMAIN_NAME \
		--title="Inception" \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	wp user create john john@example.com \
		--role=subscriber \
		--user_pass=$WP_USER_PASSWORD \
		--first_name=john \
		--last_name=doe \
		--user_url=johndoe.com \
		--allow-root

	chown -R www-data:www-data .
fi

mkdir -p /run/php

exec "$@"
