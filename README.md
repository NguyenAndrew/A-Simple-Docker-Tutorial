This repository contains several tutorials and notes on how to use Docker. It is recommended to go through the tutorials, while using the README.md as reference material.

Main Reference Material: [DOCKER, FROM scratch by Aaron Powell](https://www.youtube.com/watch?v=i7yoXqlg48M)

Would like to give a shout out to Aaron Powell. I used several difference sources to make this guide (Stack Overflow / Official Documentation), but his tech talk presented the ideal flow on how to learn Docker from a beginner point of view. Would highly recommend watching his talk (Main Reference Material). Here is their GitHub: https://github.com/aaronpowell

---

Docker is...

* Not a virtual machine

An Image is...

* Your starting point
* What you produce as an output
* A class definition

A Container is...

* A running image
* A running implementation of a class definition (See above: Image)

A Host is...

* The machine docker is installed on

A DockerFile is...

* An instruct set (Domain-specific-language), on how to create an image in docker. Used to create an image, which can be run as a container later on

docker-compose is...

* Is a file called docker-compose.yml
* Describes an environment we can use to run docker
* "...A tool for defining and running multi-container Docker applications." - https://docs.docker.com/compose/overview/

---

Example command:

docker run -it --rm ubuntu /bin/bash

* cli: docker
* command: run
* options: -it --rm
* arguments (first is image, second is executable): ubuntu /bin/bash

---


docker ps

Lists the containers running on the machine

---

exit

When executed within a container, exits the container, and returns to host's terminal

---

docker ps -a 

or 

docker ps --all

Lists all containers, regardless of status (example: running or stopped)

---

-it 

* -i keeps STDIN open even if not attached
* -t Allocate a pseudo-tty

For interactive processes (like a shell), you must use -i -t together in order to allocate a tty for the container process. 

Summary: -it allows you to use a terminal to interact with a running Docker container.

For reference, see https://docs.docker.com/engine/reference/run/

---

docker start INSERT_ID_HERE

Starts the container with id. Can use either partial CONTAINER ID or the full NAMES

---

docker stop INSERT_ID_HERE

Stop the container with that id. Can use either partial CONTAINER ID or the full NAMES. This will stop a container gracefully (proper cleanup of database connections). Not a hard 'pull the power' stop

---

docker rm INSERT_ID_HERE

Removes the container. Can use either partial CONTAINER ID or the full NAMES

---

-d

Starts container in detached mode

---

--rm

When the container stops, remove itself

---

--name NAME_HERE

Specify the name of the container

---

By default, docker containers are isolated. The containers do not know about each other or how to talk to one other. They do not share a file system.

---

docker run --rm -v DIRECTORY_FROM_HOST:DIRECTORY_YOU_WANT_TO_MOUNT_TO

or (example below)

docker run --rm -v %CD%:/my_cool_directory

Docker Volumes. Creates a mount point between the host (where the container is running from) and the container itself. Allows host and containers to share files between each other.

---

docker stop $(docker ps -a -q)

Stops all containers

---

-w 

Sets the working directory of the docker container

---

Learn how to mount directories of host in different file systems (https://stackoverflow.com/questions/41485217/mount-current-directory-as-a-volume-in-docker-on-windows-10)

Below works on both PowerShell and Unix

docker run --rm -it -v ${PWD}:/usr/src/project gcc:4.9

---

docker logs INSERT_ID_HERE

Prints logs of a docker container

---

docker logs INSERT_ID_HERE -f

Follows the logs of a container

---

docker inspect INSERT_ID_HERE

See numerous settings about a docker container

---

-p PORT_ON_HOST:PORT_ON_CONTAINER

Maps the port on the host machine to the port on a container. Example: If you had a container running a web server on PORT_ON_CONTAINER, you can do an http request on that container using PORT_ON_HOST.

---

DockerFile syntax

* FROM 
* EXPOSE
* RUN
* COPY
* WORKDIR
* CMD

--

* FROM INSERT_BUILD_HERE
* EXPOSE INSERT_PORT_HERE
* RUN INSERT_COMMAND_HERE
* COPY FILE_FROM_HOST DIRECTORY_ON_CONTAINER
* WORKDIR SET_WORKING_DIRECTORY_HERE
* CMD EXECUTE_THIS_COMMAND_ON_CONTAINER_STARTUP

--

* A DockerFile always starts with a FROM command
* Difference between RUN and CMD listed here. Quick Summary: RUN triggers while docker image is built. CMD trigger when a docker image is launched.

---

docker build -t INSERT_TAG_HERE INSERT_LOCATION_OF_DOCKERFILE

or (example below)

docker build -t nodejs-app .

Uses the DockerFile to build an image

---

docker images

Lists the docker images on the host machine

---

docker rmi INSERT_NAME_OF_IMAGE

Deletes a Docker image

---

docker-compose -f INSERT_FILE_NAME_HERE up CHOOSE_SERVICE_FROM_THAT_FILE_HERE

Runs a service from a docker-compose file.

---

docker-compose rm -f

When process is closed, forcefully cleanup docker-compose

---

docker rm -f INSERT_ID_HERE

Forcefully remove a Docker container

---

docker network prune

Removes all Docker networks

---

When you stop a docker container with a database, the data will remain. HOWEVER, if you remove a docker container, that data will vanish. Volume mounting can be used to persist the data.

---

docker-compose represents environments. (Example: An application that depends on RabitMQ, MongoDB, Redis, etc.) The compose file can make it so that you have a source of truth for environment setup.

---

In most use cases, you most likely you will not need to use Scratch. Meant for high performance, applications that would compile down to a native process.

---

Networking with Docker:

* https://hackernoon.com/build-a-crud-api-with-mongodb-express-and-docker-70510c6f706b
* (Official Reference) https://docs.docker.com/network/ 


For additional content, like Security or running a Java application in Docker, check out the following link:

* https://docs.docker.com/samples/