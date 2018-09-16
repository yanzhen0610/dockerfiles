#! /bin/sh

EOF=false
until $EOF ;do
  read line || EOF=true
  [ ! -z "$line" ] && echo $(date +'[%Y%m%d %H%M%S]') $line
done

