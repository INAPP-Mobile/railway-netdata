FROM docker.io/netdata/netdata:v2.10.3

ENV NETDATA_PORT=19999

EXPOSE 19999

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
  CMD curl --fail http://localhost:${NETDATA_PORT}/api/v1/info || exit 1

# Run as non-root (netdata user exists in the base image)
USER netdata

# Log to stdout
ENV NETDATA_LISTENER_PORT=${NETDATA_PORT}

ENTRYPOINT ["/usr/sbin/netdata"]
CMD ["-D", "-s", "/host", "-p", "${NETDATA_PORT}"]
