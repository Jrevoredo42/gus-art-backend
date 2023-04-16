FROM node:current

WORKDIR /gusArt

COPY package*.json ./
COPY prisma ./prisma/
COPY .env ./

RUN npm install

COPY . .

EXPOSE 3001
CMD [ "npm", "run", "start:dev" ]
