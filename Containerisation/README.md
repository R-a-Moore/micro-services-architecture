# Containerisation

Containerisation is when you encapsulate and package all application/software code together with dependencies, config files, libraries etc, into uniform "containers" so that they can run anywhere on any infrastructure.

Thus, containers are considered in a "written once, run anywhere" moto.

It's great for development operations, as the typical change when bringing working code from development environment to production environments typically sees failures to arise. However containersation negates this occurance.

This makes containers portable.

Containers are typically considered lightweight, as they rest beside the operating system's kernel, and do not require an operating system association within each application. 

Containerised applications are 'isolated', they do not bundle in a copy of the OS. Instead, a runtime engine (i.e., Docker and the like) running on the host operating system becomes the conduit for containers to share an OS with other containers on the same computing system. Common bins and libraries can also be shared among multiple containers; eliminating the running overhead for an operating system, making containers smaller and faster to start up.

![What is a Container - Docker](https://user-images.githubusercontent.com/47668244/189632819-a577ebfb-b1a9-41df-8dc6-e7512ddb54f7.png)

### Benefits

- portability

- agility

- speed

- fault isolation

- efficiency

- ease of management

- security

## Containerisation VS Virtualisation

Both containers and virtual machines (VMs) enable significant compute abilities to be run on the same single environment. However the two have their differences.

Virtualisation allows for multiple heavy resources to be run on the same hardware (such as operating systems and software applications), simultaneously. For example, an organisation could run a Linux operating system on a Windows localhost machine, each instance having a copy of the same software application running. 

Smaller than a VM, and require less start-up time; allowing more containers to be run on the same capacity as a single VM. This increases efficiencies, and thus reduces server or licensing costs.

![containers vs vms](https://user-images.githubusercontent.com/47668244/189631842-b7508654-f377-4f07-ac2a-b2de72bb89b0.png)

## Docker

![docker logo](https://user-images.githubusercontent.com/47668244/189632782-93325e56-0f2c-4137-ba5a-8e7115818795.png)


Docker Engine is a set of platform as a service (PaaS) products, which use virtualisation on the OS-level to deliver containerisation.

Open Source

Over 50,000 uses across organisations of all colour of industries; Ebay, Spotify, Uber. Due to its vast usecases and user numbers of Docker, it is a great motivation for 

#### Images & Containers

Containers are applications in fluid action. Images (similar to virtualisation images, such as AMIs in AWS), are imutable - unchangable - snapshots of containers, which are what are typically used to run applications in deployment. In other words, a team will have the build of the application, place it into a docker image, then have that be run as deployment.

### Using Docker

[Install from site first of course](https://docs.docker.com/desktop/install/windows-install/)

Similar to github, docker has a registry for containers, images etc, called 'docker hub'.

- docker build; 

- docker pull; 

- docker run; `docker run -p 80 80 nginx`. if you don't specify version, it will by default go for the latest image version.

![dockerhub](https://user-images.githubusercontent.com/47668244/189656735-bc747954-e282-4f42-88c7-45aac950e6f0.png)

the great thing about docker, is that you don't need to be located in a specific/relevant directory in order to run commands on the terminal.

`docker run hello-world` this will run an API call. see what it does

![run hello world](https://user-images.githubusercontent.com/47668244/189700684-9e2263fc-f95e-4e71-8ad6-6d1e0e5e90fa.png)

if you can't run commands with docker (on the commandline) then you may need to `docker login` or make an alias

`docker images` lists all of the available images you have in your local docker engine.

`docker ps` checks docker's containers. shows id, status etc `docker ps -a` view hidden ones.

TAGS are important in docker because they can be really useful when executing commands by specific type, i.e., run an image on the version, by using the 'latest' tag.

`docker run -p 80:80 nginx` runs your nginx container, communicating your localhost on port 80 with docker on port 80. `docker run -d -p 80:80 nginx` the `-d` makes it run in background so you can get your terminal back.

![docker run nginx](https://user-images.githubusercontent.com/47668244/189701337-178383f6-2f05-4317-9cf9-94475fc861c7.png)

![docker run nginx - evidence](https://user-images.githubusercontent.com/47668244/189701144-ad79d0d8-8f62-4e52-8c3c-18d1ef851153.png)

`docker stop YOUR CONTAINER_ID`. Stops your running container. Use `docker ps` to get the id of the container you want to stop. If doesn't work, use `-f`.

![container already running  docker stop is solution](https://user-images.githubusercontent.com/47668244/189701091-0dfe3bd8-60a2-4a95-a17a-bd1bbc408c67.png)

`docker exec -it CONTAINER_ID sh` interacts with a container. Just like sshing into a vm or ec2;

![the power of docker exec](https://user-images.githubusercontent.com/47668244/189701000-c11e6907-2fff-4ddf-b4d5-eaeb6c5d6104.png)

Let's check out how organisations use docker containers. We'll check out index.html

Go to default local `cd /usr/share/nginx/html`

`cat index.html` 

(may need to update & upgrade, then install sudo, nano, and then you should be able to nano).

`sudo nano index.html`

edit the `<h1>` from 'welcome to nginx!' to become 'welcome to eng122 devops'.

You should be able to see the changes when you reload now

![making changes on an image](https://user-images.githubusercontent.com/47668244/189701402-5c10829b-bdf9-4c46-9263-b174f4aa78af.png)

however, these changes that you've made do not remain on the container, as images are imutable on docker.

Now let's checkout someone else's image being run on our localhost, `docker run -d -p 90:80 ahskhan/eng114_nginx:v2`.

![using someone else's image #1](https://user-images.githubusercontent.com/47668244/189700759-b3bf40f4-1b60-47eb-a823-51aa3c7c0440.png)

![using someone else's image #2](https://user-images.githubusercontent.com/47668244/189700782-305e7a27-111e-404d-af80-29d12fb609e8.png)

When going by other's repos or sharing your own, the naming convention is `USERNAME/REPO_NAME:VERSION`

delete an image: `docker rm CONTAINER_ID` Use `-f` to force deletion if running

delete an image: `docker rmi IMAGE_NAME` Use `-f` to force deletion if running

#### Creating And Push an Image

[Steps to create containers & images](https://www.dataset.com/blog/create-docker-image/)

create a container

`docker create --name CONTAINER NAME -p LOCAL_PORT:DOCKER_PORT PACKAGE(nginx etc)`

create an image

`docker commit CONTAINER_NAME`

give it tags

`docker tag CONTAINER_ID IMAGE_NAME` to do it with tags; `docker commit CONTAINER_ID IMAGE_NAME TAG` the tag should follow the naming convention of 'dockerhub account name'/'dockerhub repo name'

then push it

`docker push IMAGE_TAG`

![tagging   pushing image](https://user-images.githubusercontent.com/47668244/189700555-4da3087a-194f-4c06-928f-bab838f42728.png)

You should be able to see it in your dockerhub repositories:

![tagging   pushing image - proof](https://user-images.githubusercontent.com/47668244/189700538-1b10d8c5-8e9e-4542-bbfc-16947d5f670e.png)

### Real world Use

`docker run -d -p 2368:2368 ghost` (need to enable port 2368)

`nano index.html` write a bunch of html into the file:

```
<html> 
  <head>
    <title>Welcome to Christian's Website</title>
      <body>
        <h1>Welcome to CHristian's Website</h1>
        <h2>This Website is hosted inside a microservice using docker</h2>
      </body>
  </head>
</html>
```
I put this file into a 'resources' directory for ease of use, later on.

Now we want to replace the default index.html with our one we've just created, in a running container.

run/create a container `docker run -d -p 80:80 nginx`

now we need to permission and go into the nginx docker we're running and change it.

move file from localhost to container

delete existing file

send file.html from localhost to nginx container (i.e., copy data from a - b): `docker cp SOURCE_ADDRESS CONTAINER_ID:`. However there may be permission issues (either on your localhost OS, or your docker hub end).

```
docker cp /c/Users/Raphael/GitHub/week8/Micro-Services/resources/index.html 6af7e0f6be4a:/
```
then enter the container

```
docker exec -it 6af7e0f6be4a sh
```
replace default index.html

```
sudo cp -f index.html /usr/share/nginx/html/index.html
```

### Automating with Dockerfile

create (in the same directory as your index.html file); a file called `Dockerfile`

```
# select base image (version `:` optional)
FROM nginx

# label it (optional)
LABEL MAINTAINER=christian@sparta

# copy data from localhost to the container
COPY index.html /usr/share/nginx/html/

# allow required port
EXPOSE 80

# execute required command - as per the default given by the documentation of nginx in dockerhub (since we're using nginx)
CMD [ "nginx", "-g", "daemon off;" ]

```

`docker build -t DOCKERHUB_ACCOUNT/REPO_NAME FILEPATH` i.e., in this example `docker build -t rcmoore/eng122_nginx_web_hosting .`

Now push it to docker hub: `docker push rcmoore/eng122_nginx_web_hosting`

## Docker Compose

Docker-compose allows you to deploy multiple containers with docker, such that you could have our node-app working alongside our mongodb.


Dockerfile for our node-app

```
# base image 
FROM node

# label
LABEL MAINTAINER=christian

# inside the container what would the default working directory be; /usr/src/app
WORKDIR /usr/src/app

# copy dependencies - app folder
COPY package*.json ./
#copy all files with /json extension to default location

# run some commands such as npm install
RUN npm install -g npm@7.20.6

# COPY EVERYTHING FROM CURRENT LOCATION & PASTE INSIDE DEFAULT LOCAL
COPY . .

# expose the port 3000
EXPOSE 3000

# run the code
CMD ["node", "app.js"]

# build this image - package it up
```

Docker-compose.yml file

```version: "3"

services:

  mongo:

    image: mongo

    container_name: mongo

    volumes:

      - ./mongod.conf:/etc/mongod.conf

      - ./logs:/var/log/mongod/

      - ./db:/var/lib/mongodb

    ports:

      - "27017:27017"

  app:

    container_name: app

    restart: always

    build: .

    ports:

      - "3000:3000"

    links:

      - mongo

    environment:

      - DB_HOST=mongodb://mongo:27017/posts

    command: node seeds/seed.js
```

Then we run the docker-compose.yml file with `docker compose up` or `docker-compose up`





