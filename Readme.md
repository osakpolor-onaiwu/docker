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


# Some Docker commands
- **docker images** --> shows all docker images 
- **docker ps** --> shows all running docker containers
- **docker pull {name of image}:{tag}**  ---> to pull an image from a registry
- **docker run {name of image}:{tag}**  --> to create a container from an image and start the image. This will run the container, but if you do ctrl + c, it will kill it. this command has docker pull command in it, so if you don't have the image locally before, it will pull it before starting the container
- **docker run -d {name of image}:{tag}**  --> run container in detach mode. when you do ctrl + c, it will not kill the container. this command has docker pull command in it, so if you don't have the image locally before, it will pull it before starting the container
- **docker logs {container id}** ---> to see logs for a particular container
- **docker stop {container id}** ---> to stop a container
- **docker run -d -p {host port}:{container port} {name of image}:{tag}** to bind container port to  host port, so your host can access it

# Port Binding
- By default, app insides container runs in an isolated docker network. this allows us to run the same app running on the same port multiple times
- to access the container port, we need to expose the container port to the host (the machine the container runs on). this is called port binding
- **docker run -d -p {host port}:{container port} {name of image}:{tag}** to bind container port to  host port, so your host can access it