@echo off
if exist .env (
    docker run --rm -it --network web --env-file .env -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible /usr/local/bin/ansible-cmdb %*
) else (
    docker run --rm -it --network web -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro python3 /usr/local/bin/ansible-cmdb %*
)