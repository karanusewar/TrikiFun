# Stage 1: Build and Verify (Quality Gates)
FROM node:24-alpine AS verify
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run lint
RUN npm run test

# Stage 2: Production Release (Lightweight Nginx)
FROM nginx:1.27-alpine
COPY --from=verify /app/index.html /usr/share/nginx/html/index.html
COPY --from=verify /app/logo-top.png /usr/share/nginx/html/logo-top.png
COPY --from=verify /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
