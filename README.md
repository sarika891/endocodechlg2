# endocodechlg2

Creating a small service with two http endpoints while will server basic functionality.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

What things you need to install the service and how to install them

* centos 7  
* make 
* git (sudo yum install git)
* docker  (Run yum install docker && sudo service docker start)

## Installation and Usage instructions

* Clone this git repo into your local machine
* Run below commands to build run and enable this service per your need:  
  make : This will show you all the available options.  
  make up : This command will clean,build and run the service in docker container by first cleaning up old docker instances if any and then build and run the instances.  
  make run: This command will use only to run the docker container.  
  make build: This command will use only to build the docker image by reading instructions from Dockerfile.  
  make clean: This command will stop and remove the container.  
  make version: This command will give you the git hash of the project.  
  
* Once the service is up and running you can access the service with below link:  
  http://$HostIp:8080 : This will show you the default home page.  
  http://$HostIp:8080/version: This will give you the git hash of the project.  
  http://$HostIp:8080/helloworld: This will print "Hello World Stranger".  
  http://$HostIp:8080/helloworld?name=SarikaChawlaSharma: This will split the string provided on camelcase and print Hello World Sarika Chawla Sharma.  
  
  
