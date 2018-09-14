FROM ubuntu:latest

ENV NOTVISIBLE "in users profile"

RUN apt-get update \
        && \
        env DEBIAN_FRONTEND=noninteractive \
            apt-get install -y \
                openssh-server \
                sudo \
                git vim nano \
                nginx \
                php-fpm php-mysql \
                mysql-client \
                mysql-server

RUN \
        mkdir /var/run/sshd \
        && \
        sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config \
        && \
# SSH login fix. Otherwise user is kicked off after login
        sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
        && \
        mv /etc/mysql/mysql.conf.d/mysqld.cnf /tmp/ \
        && \
        cat /tmp/mysqld.cnf | \
            sed 's/^#\?\(general_log\s*=\s*\).$/\11/' | \
            sed 's/^#\?\(log_error\s*=\s*.*\)$/#\1/' > \
            /etc/mysql/mysql.conf.d/mysqld.cnf \
        && \
        rm -f /tmp/mysqld.cnf \
        && \
        mv /etc/nginx/nginx.conf /tmp/nginx.conf \
        && \
        cat /tmp/nginx.conf | \
            sed 's/access_log.*\?;/access_log \/dev\/stdout;/' | \
            sed 's/error_log.*\?;/error_log \/dev\/stderr;/' > \
            /etc/nginx/nginx.conf \
        && \
        rm /tmp/nginx.conf \
        && \
        cat /etc/nginx/sites-available/default | \
            sed '56,63 {s/^\(\s*\?\)#/\1/}' | \
            sed 's/php7\.0-fpm/php7.2-fpm/g' | \
            sed '62 s/^\(\s*\?\)/\1# /' | \
            sed '63 i \\t\tfastcgi_param\tSCRIPT_FILENAME\t$fastcgi_script_name;' | \
            sed '64 i \\t\tfastcgi_param\tPATH_INFO\t$fastcgi_script_name;' > \
            /etc/nginx/sites-available/default-with-php-enabled \
        && \
        rm /etc/nginx/sites-enabled/* \
        && \
        ln -s /etc/nginx/sites-available/default-with-php-enabled /etc/nginx/sites-enabled/default-with-php-enabled \
        && \
        echo "export VISIBLE=now" >> /etc/profile \
        && \
        mkdir -p /var/run/php /var/run/mysqld /var/www \
        && \
        phpenmod mysqli pdo_mysql \
        && \
        echo "[www]\nchroot=/var/www/html" > /etc/php/7.2/fpm/pool.d/chroot.conf \
        && \
        chown www-data:www-data /var/run/php /var/www \
        && \
        chown mysql:mysql /var/run/mysqld

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /

EXPOSE 22
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]

