FROM node:20.8-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
USER node
COPY --chown=node:node ./src/ .
EXPOSE 3000
CMD ["node", "app.js"]