# Containerisation

Containerisation is when you encapsulate and package all application/software code together with dependencies, config files, libraries etc, into uniform "containers" so that they can run anywhere on any infrastructure.

Thus, containers are considered in a "written once, run anywhere" moto.

It's great for development operations, as the typical change when bringing working code from development environment to production environments typically sees failures to arise. However containersation negates this occurance.

This makes containers portable.

Containers are typically considered lightweight, as they rest beside the operating system's kernel, and do not require an operating system association within each application. 

Containerised applications are 'isolated', they do not bundle in a copy of the OS. Instead, a runtime engine (i.e., Docker and the like) running on the host operating system becomes the conduit for containers to share an OS with other containers on the same computing system. Common bins and libraries can also be shared among multiple containers; eliminating the running overhead for an operating system, making containers smaller and faster to start up.

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


