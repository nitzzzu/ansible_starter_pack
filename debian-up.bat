@echo off
docker rm debian_server1 --force 
docker run --rm -d --name debian_server1 --privileged -p 2222:22 -p 3000:3000 --network web -v %USERPROFILE%/.ssh:/tmp/.ssh:ro debian_server
pause