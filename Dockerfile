FROM node:lts-alpine
WORKDIR /app
RUN npm install -g http-server
COPY package*.json ./
RUN apk add --no-cache --virtual .gyp \
        py3-pip \
        make \
        g++ \
    && npm ci \
    && apk del .gyp
COPY . .
EXPOSE 8080
# Built in the crappiest way possible so we're still running in the node pod to get all the vulnerabilities
CMD ["npx", "vue-cli-service", "serve"]
