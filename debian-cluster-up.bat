@echo off
docker rm debian_server1 --force
docker run --rm -d --name debian_server1 -p 22:22 -p 15672:15672 -p 6379:6379 -p 10001:10001 --network web --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro debian_server
docker exec -it debian_server1 systemctl start sshd

docker rm debian_server2 --force
docker run --rm -d --name debian_server2 --network web --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro debian_server
docker exec -it debian_server2 systemctl start sshd

docker rm debian_server3 --force
docker run --rm -d --name debian_server3 --network web --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro debian_server
docker exec -it debian_server3 systemctl start sshd