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

# Port Binding
- By default, app insides container runs in an isolated docker network. this allows us to run the same app running on the same port multiple times
- to access the container port, we need to expose the container port to the host (the machine the container runs on). this is called port binding
- **docker run -d -p {host port}:{container port} {name of image}:{tag}** to bind container port to  host port, so your host can access it
- it's wise to bind your defualt image port to the host port. if the container port is 80, bind it to 80 on your host too

# Some important note
- docker run command creates a new container every time. every time you run it, it will stop existing one and create new one. 

# building your own docker image
- you do this when you app is ready and you want to deploy to a server
- first you need to create a **definition** of how to build an image from your app
- to do this you need to create a **Dockerfile**

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