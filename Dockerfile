FROM node:latest

WORKDIR run

COPY package.json .

RUN npm install

COPY . .

CMD ["npm","start"]