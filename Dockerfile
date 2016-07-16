FROM hypriot/rpi-node

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app
RUN cp .envnow .env

RUN npm run clean
RUN npm run build

EXPOSE 8004
CMD [ "npm", "start" ]
