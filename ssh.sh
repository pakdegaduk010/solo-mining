#!/bin/bash
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok
sudo apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen >/dev/null
echo root:root | chpasswd
rm -f .ngrok.log
./ngrok authtoken 1yXJ100mAj0OpSLezldmQl02Dqf_54WFxVwTR6H9d5jaoQHpJ
./ngrok tcp 22 --log ".ngrok.log" &
HAS_ERRORS=$(grep "command failed" < .ngrok.log)
if [[ -z "$HAS_ERRORS" ]]; then
  echo $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh root@/" | sed "s/:/ -p /")"
else
  echo "$HAS_ERRORS"
  exit 1
fi
