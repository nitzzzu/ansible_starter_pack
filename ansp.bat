@echo off
if exist .env (
    docker run --rm -it --network web --env-file .env -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible ansible-playbook %*
) else (
    docker run --rm -it --network web -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible ansible-playbook %*
)