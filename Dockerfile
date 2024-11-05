FROM node:lts AS builder
WORKDIR /app
RUN npm install -g http-server
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 8080
# Built in the crappiest way possible so we're still running in the node pod to get all the vulnerabilities
CMD ["npx", "vue-cli-service", "serve"]
