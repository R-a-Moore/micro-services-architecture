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

## Kubernetes

what are kubernetes?



