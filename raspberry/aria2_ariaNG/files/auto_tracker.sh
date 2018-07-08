#!/bin/sh
docker stop aria2
list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" /home/pi/aria2/conf/aria2.conf`" ]; then
    sed -i '$a bt-tracker='${list} /home/pi/aria2/conf/aria2.conf
    echo add......
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" /home/pi/aria2/conf/aria2.conf
    echo update......
fi
docker start aria2 
