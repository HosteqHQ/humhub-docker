#!/bin/sh

# Thx to Sanj Ambalavanar (https://sanjeevan.co.uk/blog/running-services-inside-a-container-using-runit-and-alpine-linux/)

PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

exec env - PATH=$PATH runsvdir -P /etc/service &

RUNSVDIR=$!
echo "Started runsvdir, PID is $RUNSVDIR"
echo "$RUNSVDIR" > /run/runsvdir.pid

wait $RUNSVDIR
