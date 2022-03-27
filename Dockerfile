FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN export NODE_OPTIONS=--openssl-legacy-provider

COPY . .

EXPOSE 3000

CMD [ "npm", "run", "dev" ]
