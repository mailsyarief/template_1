#Contoh Dockerfile
#   Dockerfile pada direktori ini akan di build pada host,
#   Dockerfile ini menggunakan image php7.4-fpm yang dimodifikasi
#   dengan menambahkan Composer & Nginx.
#=========================================================
#   FROM php:7.4-fpm                                        #| Base image yang digunakan
#                                                           #|
#   RUN apt-get update -y \                                 #| Update & Instalasi Nginx
#       && apt-get install -y nginx \                       #|
#       && apt-get install -y \                             #|
#       git \                                               #|
#       zip \                                               #|
#       nano \                                              #|
#       curl                                                #|
#                                                           #|
#   ENV PHP_CPPFLAGS="$PHP_CPPFLAGS -std=c++11"             #| Instalasi plugin php
#                                                           #|
#   RUN docker-php-ext-install pdo_mysql \                  #| 
#       && docker-php-ext-install opcache \                 #|
#       && apt-get install libicu-dev -y \                  #|
#       && docker-php-ext-configure intl \                  #|
#       && docker-php-ext-install intl \                    #|
#       && apt-get remove libicu-dev icu-devtools -y        #|
#                                                           #|
#   RUN curl -sS https://getcomposer.org/installer | php    #| Instalasi Composer
#   RUN mv composer.phar /usr/local/bin/composer            #|
#   RUN chmod +x /usr/local/bin/composer                    #|
#                                                           #|
#   RUN { \                                                 #|
#           echo 'opcache.memory_consumption=128'; \        #|
#           echo 'opcache.interned_strings_buffer=8'; \     #|
#           echo 'opcache.max_accelerated_files=4000'; \    #|
#           echo 'opcache.revalidate_freq=2'; \             #|
#           echo 'opcache.fast_shutdown=1'; \               #|
#           echo 'opcache.enable_cli=1'; \                  #|
#       } > /usr/local/etc/php/conf.d/php-opocache-cfg.ini  #|
#                                                           #|
#   COPY nginx-site.conf /etc/nginx/sites-enabled/default   #| Menyalin konfigurasi nginx ke container
#   COPY entrypoint.sh /etc/entrypoint.sh                   #| Menyalin entrypoint.sh ke container
#                                                           #|
#   COPY --chown=www-data:www-data . /var/www/mysite        #| Merubah permission
#                                                           #|
#   WORKDIR /var/www/mysite                                 #| Menentukan root direktori dari container
#                                                           #|
#                                                           #|
#   EXPOSE 80 443                                           #| Menunjukan Image berjalan pada port 80 433
#   RUN chmod +x /etc/entrypoint.sh                         #| 
#   ENTRYPOINT ["/etc/entrypoint.sh"]                       #| Menentukan file yang akan dijalankan ketika container berjalan
#=========================================================


FROM php:7.4-fpm

RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get install -y \
    git \
    zip \
    nano \
    curl

ENV PHP_CPPFLAGS="$PHP_CPPFLAGS -std=c++11"

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && apt-get install libicu-dev -y \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apt-get remove libicu-dev icu-devtools -y

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN { \
        echo 'opcache.memory_consumption=128'; \
        echo 'opcache.interned_strings_buffer=8'; \
        echo 'opcache.max_accelerated_files=4000'; \
        echo 'opcache.revalidate_freq=2'; \
        echo 'opcache.fast_shutdown=1'; \
        echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/php-opocache-cfg.ini

COPY nginx-site.conf /etc/nginx/sites-enabled/default
COPY entrypoint.sh /etc/entrypoint.sh

COPY --chown=www-data:www-data . /var/www/mysite

WORKDIR /var/www/mysite

EXPOSE 80 443
RUN chmod +x /etc/entrypoint.sh
ENTRYPOINT ["/etc/entrypoint.sh"]