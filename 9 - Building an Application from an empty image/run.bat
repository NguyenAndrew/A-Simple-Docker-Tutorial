@ECHO OFF

ECHO Building app (NOTE: This first command does not work in the run.bat. Manually copy it onto your terminal)

docker run --rm -v ${PWD}/src:/src -w /src golang:1.8 go build -v -o app

ECHO Creating image

docker build -t dfs-scratch -f Dockerfile .

ECHO Running container

docker run --rm dfs-scratch

docker rmi dfs-scratch