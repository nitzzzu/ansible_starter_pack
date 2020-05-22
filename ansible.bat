echo off
docker rm ansible --force 
docker run --rm --name ansible -it --network web -v %cd%/projects:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible bash