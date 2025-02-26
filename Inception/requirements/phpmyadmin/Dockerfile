FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
  apache2 \
  php \
  libapache2-mod-php \
  php-mbstring php-zip php-gd php-json php-curl \
  php-mysql php-mysqli \
  openssl \
  wget gnupg \
  && rm -rf /var/lib/apt/lists/*

# Download phpMyAdmin, extract, and move to webserver root
# RUN cd /tmp && \
#   wget -q https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.zip -O pma.tar.gz

ADD https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.tar.gz /tmp/pma.tar.gz

WORKDIR /tmp
RUN mkdir -p pma && \
  tar -xzf pma.tar.gz -C pma --strip-components=1 && \
  mv pma /usr/share/phpmyadmin

# config phpmyadmin
RUN mkdir -p /usr/share/phpmyadmin/tmp && \ 
  chown -R www-data:www-data /usr/share/phpmyadmin/tmp && \
  cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php

COPY ./conf/phpmyadmin.conf /etc/apache2/conf-available/phpmyadmin.conf

# Remove default content and link phpMyAdmin as the default site
RUN rm -rf /var/www/html && ln -s /usr/share/phpmyadmin /var/www/html


# load phpmyadmin config
RUN a2enconf phpmyadmin && a2enmod rewrite

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["apache2ctl", "-D", "FOREGROUND"]

