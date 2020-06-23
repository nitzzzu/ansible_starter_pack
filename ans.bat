@echo off
docker run --rm -it --network web -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible ansible %*