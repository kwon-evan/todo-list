FROM node:18-alpine3.17 as build
ARG WEB_DIR

WORKDIR /app

COPY ${WEB_DIR}/package* /app
RUN rm -rf node_modules
RUN npm cache clean --force
RUN npm install

COPY ${WEB_DIR} /app
EXPOSE 5173/tcp
CMD ["npm", "run", "dev"]
