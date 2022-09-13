
# base image 
FROM mongo

# label
LABEL MAINTAINER=christian

# inside the container what would the default working directory be; /usr/src/app
WORKDIR /usr/src/environment

# copy dependencies - app folder
COPY mongod.conf /usr/src/etc/mongo/mongod.conf
#copy all files with /json extension to default location

# run some commands to configure and install dependencies
RUN apt update -y
RUN apt upgrade -y
RUN apt install sudo -y
RUN apt install systemctl -y
#RUN sudo systemctl restart mongod
#RUN sudo systemctl enable mongod

# COPY EVERYTHING FROM CURRENT LOCATION & PASTE INSIDE DEFAULT LOCAL
COPY . .

# expose the port 3000
EXPOSE 27017

# run the code
CMD ["mongod"]

# build this image - package it up