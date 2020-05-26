@echo off
if exist .env (
    docker run --rm -it --network web --env-file .env -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible bash    
) else (
    docker run --rm -it --network web -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible bash
)