# Intro

Build a `mariadb` image with specified `uid` and `gid` that makes it able to use unix_socket with host machine.

# Build

## Create user `mysql`

```
sudo useradd -r mysql
```

## Build an image

```
docker -t mariadb:tag-name \
	--build-arg mysql_uid=$(id -u mysql) \
	--build-arg mysql_gid=$(id -g mysql) .
```

# Run

## Setup

```
sudo mkdir /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld
```

## Run container with the image which you just built

```
docker run -v '/var/run/mysqld:/var/run/mysqld' \
	-d mariadb:tag-name
```

or with ports

```
docker run -v '/var/run/mysqld:/var/run/mysqld' \
	-p '3306:3306' -d mariadb:tag-name
```

