This repository contains several tutorials and notes on how to use Docker. It is recommended to go through the tutorials, while using the README.md as reference material.

Main Reference Material: [DOCKER, FROM scratch by Aaron Powell](https://www.youtube.com/watch?v=i7yoXqlg48M)

Would like to give a shout out to Aaron Powell. I used several difference sources to make this guide (Stack Overflow / Official Documentation), but his tech talk presented the ideal flow on how to learn Docker from a beginner point of view. Would highly recommend watching his talk (Main Reference Material). Here is their GitHub: https://github.com/aaronpowell

---

Docker is...

* Containers (Not a virtual machine)
* Usable in Linux, Mac OS, and Windows
* https://stackoverflow.com/questions/28089344/docker-what-is-it-and-what-is-the-purpose

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

An example Docker command: `docker run -it --rm ubuntu /bin/bash`

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

docker start INSERT_CONTAINER_NAME_OR_ID

Starts the container with id. Can use either partial CONTAINER ID or the full NAMES

---

docker stop INSERT_CONTAINER_NAME_OR_ID

Stop the container with that id. Can use either partial CONTAINER ID or the full NAMES. This will stop a container gracefully (proper cleanup of database connections). Not a hard 'pull the power' stop

---

docker rm INSERT_CONTAINER_NAME_OR_ID

Removes the container. Can use either partial CONTAINER ID or the full NAMES

---

-it


* -i keeps STDIN open even if not attached
* -t Allocate a pseudo-tty

-it allows you to use a terminal to interact with a running Docker container.

Examples: 
* Start new container with bash: `docker run -it ubuntu /bin/bash`
* View running container with bash): `docker exec -it INSERT_CONTAINER_NAME_OR_ID bash`

For reference, see https://docs.docker.com/engine/reference/run/

---

-d

Starts container in detached mode.

---

-w 

Sets the working directory of the docker container

---

-p PORT_ON_HOST:PORT_ON_CONTAINER

Maps the port on the host machine to the port on a container. Example: If you had a container running a web server on PORT_ON_CONTAINER, you can do an http request on that container using PORT_ON_HOST.

---

--rm

When the container stops, remove itself

---

--name CONTAINER_NAME

Specify the name of the container

---

By default, docker containers are isolated. The containers do not know about each other or how to talk to one other. They do not share a file system.

---

docker run -v DIRECTORY_FROM_HOST:DIRECTORY_YOU_WANT_TO_MOUNT_TO

Example: `docker run -v ${PWD}:/my_cool_directory_that_will_be_created_on_my_container`

Docker Volumes. Creates a mount point between the host (where the container is running from) and the container itself. Allows host and containers to share files between each other.

Examples:
* The following works on both PowerShell and Unix: `docker run --rm -it -v ${PWD}:/usr/src/project gcc:4.9`
* For additional information: https://stackoverflow.com/questions/41485217/mount-current-directory-as-a-volume-in-docker-on-windows-10

---

docker stop $(docker ps -a -q)

Stops all containers

---

docker logs INSERT_CONTAINER_NAME_OR_ID

Prints logs of a docker container

---

docker logs INSERT_CONTAINER_NAME_OR_ID -f

Follows the logs of a container

---

docker inspect INSERT_CONTAINER_NAME_OR_ID

See numerous settings about a docker container

---

Dockerfile syntax

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

--

Dockerfile reference: https://docs.docker.com/engine/reference/builder/

---

docker build -t INSERT_NAME_OR_TAG_HERE INSERT_LOCATION_OF_DOCKERFILE

or (example below)

docker build -t nodejs-app .

Uses the DockerFile to build an image. It is important to mention that The -t flag both tags and name the container. https://docs.docker.com/engine/reference/commandline/build/

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

docker rm -f INSERT_CONTAINER_NAME_OR_ID

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
More on Docker Compose:

* Supercharged Docker with Docker Compose by Engineer Man: https://www.youtube.com/watch?v=2qKlZQX1Ums. Examples located at: https://github.com/engineer-man/youtube/tree/master/066

Networking with Docker:

* https://hackernoon.com/build-a-crud-api-with-mongodb-express-and-docker-70510c6f706b
* (Official Reference) https://docs.docker.com/network/ 


For additional content, like Security or running a Java application in Docker, check out the following link:

* https://docs.docker.com/samples/