@echo off
if exist .env (
    docker run --rm -it --env-file .env -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible ansible-vault %*
) else (
    docker run --rm -it -v %cd%:/ansible -v %USERPROFILE%/.ssh:/tmp/.ssh:ro ansible ansible-vault %*
)