FROM php:7-cli

RUN set -eux ; \
	apt-get update ; \
	apt-get install -y gnupg git npm libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libonig-dev libzip-dev; \
	docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache ; \
	pecl install xdebug ; \
	docker-php-ext-enable xdebug ; \
	COMPOSER_EXPECTED_CHECKSUM=`curl https://composer.github.io/installer.sig` ; \
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" ; \
	COMPOSER_ACTUAL_CHECKSUM=`php -r "echo hash_file('sha384', 'composer-setup.php');")` ; \
	test "${COMPOSER_EXPECTED_CHECKSUM}" != "${COMPOSER_ACTUAL_CHECKSUM}" && { >&2 echo 'ERROR: Invalid installer checksum' ; exit 1 ; } ; \
	php composer-setup.php ; \
	rm composer-setup.php ; \
	cp composer.phar /usr/bin/composer ; \
	npm install --global npm ; \
	npm install --global node-linux

