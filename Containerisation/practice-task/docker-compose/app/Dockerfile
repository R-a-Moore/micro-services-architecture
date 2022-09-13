
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