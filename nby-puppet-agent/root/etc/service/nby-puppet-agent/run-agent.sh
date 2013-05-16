#!/bin/sh
PATH=/usr/sbin:/usr/bin:/sbin:/bin
while sleep 30; do
   puppet agent --server $MASTER_NODE --onetime --no-daemonize
done
