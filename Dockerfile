FROM alpine/node
RUN npm install -g @angular/cli && \
    npm install -g typescript
RUN apk update && \
    apk fix && \
    apk add su-exec

COPY src/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
