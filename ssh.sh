#!/bin/bash
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok
echo -e "root" | sudo passwd root
rm -f .ngrok.log
./ngrok authtoken 1yXJ100mAj0OpSLezldmQl02Dqf_54WFxVwTR6H9d5jaoQHpJ
./ngrok tcp 22 --log ".ngrok.log" &

sleep 10
HAS_ERRORS=$(grep "command failed" < .ngrok.log)

if [[ -z "$HAS_ERRORS" ]]; then
  echo ""
  echo "=========================================="
  echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh root@/" | sed "s/:/ -p /")"
  echo "=========================================="
  
  else
  echo "$HAS_ERRORS"
  exit 4
fi
