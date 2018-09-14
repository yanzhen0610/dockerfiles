#!/bin/bash

if [ -z "$@" ]
then

  if [ -z "$PHP_DISPLAY_ERROR" ]
  then
    sed -i 's/display_errors = Off/display_errors = On/' /etc/php/7.2/fpm/php.ini
  fi

  /usr/sbin/sshd -D &
  /usr/sbin/mysqld &
  /usr/sbin/nginx -g 'daemon on; master_process on;' &
  /usr/sbin/php-fpm7.2 &

  sleep 5

  processes='sshd mysqld nginx php-fpm'

  while sleep 1; do
    for process in $processes
    do
      ps -aux | grep $process | grep -q -v grep || exit 1
#      if [ $? -ne 0 ]; then
#        exit 1
#      fi
    done
  done

else
  
  exec "$@"

fi

