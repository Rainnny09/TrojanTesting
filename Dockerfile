FROM v2fly/v2fly-core:latest
COPY config.json /etc/v2ray/config.json
ENV PORT 8080

# Starts V2Ray, waits 300 seconds (5 mins), then kills the process to end the test
ENTRYPOINT ["sh", "-c", "v2ray run -config /etc/v2ray/config.json & PID=$!; sleep 300; kill $PID"]
