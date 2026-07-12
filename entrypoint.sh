#!/bin/sh

# Ensure the data directories exist and are writable
mkdir -p /var/lib/netdata/registry /var/lib/netdata/cloud.d /var/cache/netdata 2>/dev/null || true

# Railway injects $PORT — must listen on it for healthcheck to work
LISTEN_PORT="${PORT:-${NETDATA_PORT:-19999}}"

exec /usr/sbin/netdata -D -p "${LISTEN_PORT}"