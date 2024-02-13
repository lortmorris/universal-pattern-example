FROM node:latest
RUN mkdir -p /home/up-example
WORKDIR /home/up-example
COPY . .
RUN npm install
RUN npm install nodemon -g
EXPOSE 3500
CMD ["nodemon", "index.js"]
