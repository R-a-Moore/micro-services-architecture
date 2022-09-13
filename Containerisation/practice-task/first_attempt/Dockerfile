
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

