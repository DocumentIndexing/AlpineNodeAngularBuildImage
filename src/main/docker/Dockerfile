FROM node:alpine
RUN npm install -g npm@latest && \
    npm install --save-dev @angular-devkit/build-angular && \
    npm install -g @angular/cli && \
    npm install -g typescript
RUN apk update && \
    apk fix && \
    apk add su-exec

COPY maven/scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
