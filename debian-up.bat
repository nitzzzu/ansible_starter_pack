@echo off
docker rm debian_server1 --force
docker run --rm -d --name debian_server1 -p 22:22 -p 15672:15672 --network web --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro debian_server
docker exec -it debian_server1 systemctl start sshd