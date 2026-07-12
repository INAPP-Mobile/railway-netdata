#!/bin/sh

# Ensure the data directories exist and are writable
mkdir -p /var/lib/netdata/registry /var/lib/netdata/cloud.d /var/cache/netdata 2>/dev/null || true

exec /usr/sbin/netdata -D -p "${NETDATA_PORT:-19999}"