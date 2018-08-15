FROM mariadb:latest

ARG mysql_uid
ARG mysql_gid

COPY load_unix_socket.cnf /etc/mysql/mariadb.conf.d/

RUN /usr/sbin/usermod -u ${mysql_uid} mysql \
      && /usr/sbin/groupmod -g ${mysql_gid} mysql

