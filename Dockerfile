#this specifies how to build a docker image for the app

#this first uses the node 22 alpine image as base image
FROM node:22-alpine

#this sets the working directory in the container to /app. this acts as root directory for the app
WORKDIR /app

#this copies package.json and package-lock.json to the working directory in the container
COPY package*.json /app/

#this runs npm install in the container to install dependencies
#you can also run other things liek RUN mkdir -p /app/src/uploads to create folders
#the Run command runs during the image build, and it is used for any command to run
# like installing dependencies, creating folders, etc
#you can have multiple RUN commands in a dockerfile
RUN npm install

#this copies the src folder to the working directory in the container
# COPY src /app/

#this copies all other files to the working directory in the container
COPY . .

#this sets environment variables in the container
ENV MONGOURI=mongodb://host.docker.internal:27017/exprenses-express \
    MONGO_DB_USERNAME=admin \
    MONGO_DB_PASSWORD=admin123

#this exposes port 3000 to the outside world
EXPOSE 3000

#this specifies the command to run the app
# you can have only one CMD command in a dockerfile
# if you have multiple CMD commands, only the last one will be used
CMD ["npm", "start"]

#if you didn't copy all file, and you copied specific folder instead
# and you want to navigater to the folder to run the app you can do
#CMD["npm", "./path/to/folder"], e.g CMD["npm", "/app/src/server.js"]
