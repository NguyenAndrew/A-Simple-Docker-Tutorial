Docker is...

* Not a virtual machine

An Image is...

* Your starting point
* What you produce as an output
* A class definition

A Container is...

* A running image
* A running implementation of a class

A Host is...

* The machine docker is installed on

---

Example command:

docker run -it --rm ubuntu /bin/bash

* cli: docker
* command: run
* options: -it --rm
* arguments (first is image, second is executable): ubuntu /bin/bash