@ECHO OFF

ECHO nodejs image. NOTE: Does not work in bat file. Copy and paste to powershell.

docker run -it --rm --name node -d -v ${PWD}:/src -w /src node:7.7.4-alpine node app.js