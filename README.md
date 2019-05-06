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

Stop the container with that id. Can use either partial CONTAINER ID or the full NAMES

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