FROM node:18-alpine3.17 as build
ARG WEB_DIR

WORKDIR /app
COPY ${WEB_DIR} /app

RUN npm install
RUN npm run build

FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY --from=build /app/dist /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
