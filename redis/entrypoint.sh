#!/bin/sh

if [ ! -f /data/redis.conf ]; then
	cp /usr/local/redis/etc/redis.conf /data/redis.conf
fi

set -e
sysctl -w net.core.somaxconn=1024 >/dev/null 2>&1
sysctl -w vm.overcommit_memory=1 >/dev/null 2>&1
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

exec "$@"