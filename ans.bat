@echo off
docker run --rm -it --network web -v %cd%:/opt -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible ansible %*