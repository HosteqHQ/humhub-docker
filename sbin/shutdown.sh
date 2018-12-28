#!/bin/sh

# Thx to Sanj Ambalavanar (https://sanjeevan.co.uk/blog/running-services-inside-a-container-using-runit-and-alpine-linux/)

RUNSVDIR=$(cat /run/runsvdir.pid)
kill -HUP $RUNSVDIR
wait $RUNSVDIR

# kill any other processes still running in the container
for _pid  in $(ps -eo pid | grep -v PID  | tr -d ' ' | grep -v '^1$' | head -n -6); do
  timeout 5 /bin/sh -c "kill $_pid && wait $_pid || kill -9 $_pid"
done

touch /etc/runit/stopit
chmod 100 /etc/runit/stopit
