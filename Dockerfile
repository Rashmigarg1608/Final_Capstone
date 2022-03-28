FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install


COPY . .

EXPOSE 3000

CMD export NODE_OPTIONS=--openssl-legacy-provider
CMD [ "npm", "run", "dev" ]
