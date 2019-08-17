#!/bin/sh

sigterm()
{
  echo '"docker stop"' detected
  echo stopping now
  exit 0
}

trap 'sigterm' TERM

if [ -z "$NOIP_USERNAME" ]
then
  echo username is required
  echo use '"-e NOIP_USERNAME=your-username"' to set username
  exit 1
fi

if [ -z "$NOIP_PASSWORD" ]
then
  echo password is required
  echo use '"-e NOIP_PASSWORD=your-password"' to set password
  exit 1
fi

if [ -z "$NOIP_HOSTNAME" ]
then
  echo host name is required
  echo user '"-e NOIP_HOSTNAME=your-hostname"' to set hostname
  exit 1
fi

if [ -z "$PERIOD" ]
then
  PERIOD=30
elif ! [[ $PERIOD =~ '^[0-9]+$' ]]
then
  echo '$PERIOD' should be a positive integer
  exit 2
fi

while :
do
  /usr/bin/curl -s https://$NOIP_USERNAME:$NOIP_PASSWORD@dynupdate.no-ip.com/nic/update?hostname=$NOIP_HOSTNAME
  sleep $PERIOD &
  wait $!
done

