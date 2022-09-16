# Kubernetes

Kubernetes (also known by K8s), is a system for automating deployment, scaling and management of containerised applications.

It groups containers that make up (micro-service) applications into logical units, known as a K8 CLuster.

Kubernetes is open source, meaning it's free and widely available (and used).

### Benefits

- allows automation

- scaling Up and Down

- Strong open source communities

- cost efficiencies & savings

- ability to run anywhere

- multi-cloud possibilities

- native tooling available

- widely used (therefore accessible); 69% of organisations use it


### Self-Healing

### Horizontal Scaling

### Automated Rollouts and Rollbacks

### Service Discovery & Load Balancing

## Management

Because kubernetes is not easy to manage, with only 1,700 people globally bing certified, organisations typically use management services alongside it.

## K8 Cluster

A Kubernetes K8 cluster is a number of containers grouped together for use as an application, which can be efficient, automated, distributed, and scalable. K8 clusters allow engineers to orchestrate and monitor containers multiple physical, virtual, and cloud servers.

In a sense, it's exactly the same as a CLI (command line interface), with both, you still interface and manage instances (be they containers or machine instances). The only real difference is that you can build and run multiple (scalable) containers. 

### Using K8

k8 works with api version to delcare the resources

we  have to declare the api version and the kind of service/component

services: deployment, service, pods, replicasests, crobjob, autoscaling groups, horizon

`kubectl get service_name` - deployment - pod - rs

`kubectl get deploy nginx_deploy (nginx_svc)`

`kubectl get pods`

`kubectl describe pod pod_name` looks at the documentation, i.e., like the `cat` command

`kubectl`

`kubectl get svc` 'kube control get service'

`kubectl pod pod_name` pods in kubernetes are basically instances in 

`kubectl delete deploy NAME_OF_DEPLOYMENT` deletes a service/deployment

create a 'nginx-deploy.yml' file

```
# Create an API call for deployment, using documentation


# YML is case sensitive - indentation should be 2 spaces (not TAB)

apiVerion: apps/v1 # which api to use for deployment
kind: Deployment # what kind of service/object you want to create

# what would you liek to call it - name the service/object

metadata:
  name: nginx-deployment # naming the deployment
spec:
  selector:
    matchLabels:
      app: nginx

# let's create a replica set of this with 3 instances:pods
  replicas: 3

  # template to use it's label for k8 service to launch in the browser
  template:
  
# create a kubernetes nginx-service.yml to create a k8 service

  metadata: 
    labels:
      app: nginx # this label connects to the service or any other k8 components

# let's define the container spec
    spec:
      containers:
      - name: nginx
        image: ahskhan/eng89automatednginx:latest
        ports:
        - containerPort: 80

```

`kubectl create -f nginx-deploy.yml` run the pod .yml file