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

Deletes a docker image

---