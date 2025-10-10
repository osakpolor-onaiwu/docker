#this specifies how to build a docker image for the app

#this first uses the node 22 alpine image as base image
FROM node:22-alpine

#this sets the working directory in the container to /app. this acts as root directory for the app
WORKDIR /app

#this copies package.json and package-lock.json to the working directory in the container
COPY package*.json /app/

#this runs npm install in the container to install dependencies
RUN npm install

#this copies the src folder to the working directory in the container
COPY src /app/

#this copies all other files to the working directory in the container
COPY . .

#this exposes port 3000 to the outside world
EXPOSE 3000

#this specifies the command to run the app
CMD ["npm", "start"]
