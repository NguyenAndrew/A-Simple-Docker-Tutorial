@ECHO OFF

ECHO nodejs image. nodejs image. NOTE: Does not work in bat file. Copy and paste to terminal.

docker run -it --rm --name node -d -v ${PWD}:/src -w /src -p 8080:3000 node:7.7.4-alpine node app.js