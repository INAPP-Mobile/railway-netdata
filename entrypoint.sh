#!/bin/sh
# entrypoint.sh — ensure volume permissions, then start netdata

# Ensure the data directory exists and is writable
mkdir -p /var/lib/netdata/registry /var/lib/netdata/cloud.d /var/cache/netdata

exec /usr/sbin/netdata -D -p "${NETDATA_PORT:-19999}"