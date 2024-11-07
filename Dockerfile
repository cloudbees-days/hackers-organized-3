FROM node:lts AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

RUN npm run build
FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
#COPY --from=builder /app/node_modules /app/node_modules
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
