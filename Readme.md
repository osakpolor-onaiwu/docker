# What is docker?
- Docker is a virtualization software
- it packages apps with all the necessary dependencies, config, system tool and runtime


# Images vs Container
## images
- Image is an executable application artifact 
- Immutable templage that defines how a container will be realized.
- it includes app source code, complete environment configuration, any service that is needed to run the app, envs. 

## Containers

- A container actually starts the app.
- you can run multiple containers from one image 
- it is a running instance of an image

# Docker Registries
-  It's like a storage and distribution system for docker images. similar to how npm has packages for node js
- Docker hosts one of the biggest docker registry known as **Docker hub**.
- Docker images are versioned
- different versions are identified by tags. 
- note not all registries are public. there are some private ones that companies like google, aws etc has. you will need to authenticate to access these
- you can create a private registry on docker hub, by signing up to docker hub

# Registries vs Repostitory
## registry
 - a registry is a service providing storage
 - it's a collection of repostories

## repository
- collection of related images with the same name but different version 


# Some Docker commands
- **docker images** --> shows all docker images 

- **docker ps** --> shows all running docker containers

- **docker pull {name of image}:{tag}**  ---> to pull an image from a registry

- **docker ps -a** shows all containers, both running ones and stopped ones

- **docker run {name of image}:{tag}**  --> to create a container from an image and start the image. This will run the container, but if you do ctrl + c, it will kill it. this command has docker pull command in it, so if you don't have the image locally before, it will pull it before starting the container

- **docker run -d {name of image}:{tag}**  --> run container in detach mode. when you do ctrl + c, it will not kill the container. this command has docker pull command in it, so if you don't have the image locally before, it will pull it before starting the container

- **docker start {container id or container name}** this will restart an existing container that was stopped before

- **docker logs {container id or container name}** ---> to see logs for a particular container

- **docker stop {container id or container name}** ---> to stop a container

- **docker run -d -p {host port}:{container port} {name of image}:{tag}** to bind container port to  host port, so your host can access it

- **docker run --name {name you are giving the container} -d -p {host port}:{container port} {name of image}:{tag}** with the name flag, you are able to give your container a name.

- **docker build -t {name of image (you name it yourself)}:{version} .** this is the comand to build the image. note the dot at the end, you need to pass it to specify the current directory

- **docker network ls** will list all you docker networks

- **docker run -d -p {host port}:{container port} -e {env name}={env value} --name {name you are giving the container} {name of image}:{tag}** to add env. you can add as many envs, just add **-e** before each env

- **docker network create {network name}** to create your networks 

- **docker run -d -p {host port}:{container port} -e {env name}={env value} --name {name you are giving the container} --net {network name} {name of image}:{tag}** to add the container to the network

- **docker rmi {image id}** to delete an image you build
- **docker rm {container id}** to delete a container 

# Some flags
## for when running a container
- \-e for environmental variable
- \-p for port
- \--name for container name
- \-d for running on detach mode
- \--net for network


# Port Binding
- By default, app insides container runs in an isolated docker network. this allows us to run the same app running on the same port multiple times
- to access the container port, we need to expose the container port to the host (the machine the container runs on). this is called port binding
- **docker run -d -p {host port}:{container port} {name of image}:{tag}** to bind container port to  host port, so your host can access it
- it's wise to bind your defualt image port to the host port. if the container port is 80, bind it to 80 on your host too

# Some important note
- docker run command creates a new container every time. every time you run it, it will stop existing one and create new one. 
- when starting a container you can provide the docker network it should run, you can also provide some env for it
- most images on docker hub have some documentation on how to run them and set variables 
- when writing a docker command if it is very long, you can break it into different line, after each line, add \ and press enter it will go to a new line to continue with the rest of the command
- by default when you close a container, it does not persist data, so when you run a container of a db, when you close the container, the data in the db will be deleted.
- docker volumes helps you with persistence

# Building your own docker image
- you do this when you app is ready and you want to deploy to a server
- first you need to create a **definition** of how to build an image from your app
- to do this you need to create a **Dockerfile**

## Best Practices for setting envs on docker file
- Use ARG for sensitive data like API keys during builds, but avoid storing them in the final image.

- Use .env files with Docker Compose for managing runtime variables securely.

- Always validate environment variables in your application to ensure proper configuration.

- By combining ARG and ENV, you can create flexible and configurable Docker images tailored for different environments.

## structure of Dockerfile
- Dockerfile starts from a **parent image** or **base image**. it's a docker image that your image is based on

- you choose the base image, depending on which tools you need to have available
- for javascript stuf use node as base, for java use tomcat etc
- the Docker file starts with a FROM {BASE IMAGE}
- see Dockerfile in this app
- after completing the docker file, run the command to build the image
- **docker build -t {name of image (you name it yourself)}:{version} .** this is the comand to build the image. note the dot at the end, you need to pass it to specify the current directory

## files to ignore
- To state files and folders to be ignored in dockerization, create a **.dockerignore** file. note he dot in the start
- this file does the same job as **.gitignore**
- see the one in this project

# Docker network
- Docker creates an isolated docker network where it's containers are running in 
- if you have 2 containers running on the network, they can talk to each other using just the contianer name because they are in the same network
- you normal apps, browser, etc on your system will have to connect to them using the port you expose
- you can create your own docker networks, see commands to know how to do it

# Docker compose
- This is used when you are running several containers together
- this is a yaml file where your write the configurations of the different docker containers, so you won't have to be writing the docker run commands separetely on the command line
- when using docker compose, you don't need to add the docker network
the docker compose will handle that for you
- see mongo.yaml file in this project as sample
- reference this site https://www.freecodecamp.org/news/what-is-docker-compose-how-to-use-it/
- to run it do **docker-compose -f {file name.yaml} up**
- to stop and close the containers and networks  do **docker-compose -f {file name.yaml} down**

# Docker Volumes
- docker volumes is used for data persistence
- it works by mounting a folder in the physical host file system into the virtual file system of Docker. this ensure that even if the container is restarted, it can pick up changes from the host.

## types of docker volumes
- 1. Host volume: here we use the docker run command with a -v flag, and specify the host folder and the docker own e.g
** docker run -v {host folder path}:{docker container path}**
    - you decide where on the host file system the reference is made
- 2. here you only specify the path in the docker container. docker handles where in the host folder to pick it.
**docker run -v {docker container paht}**

