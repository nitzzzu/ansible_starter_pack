# Ansible starter pack

- Windows friendly
- SSH key authentication ready
- Customizable
- mitogen enabled
- Small docker image size

## Install

- Install `docker`
- Create ssh public/private keys: `ssh-keygen -t rsa -b 2048` (available in `~/.ssh` folder)
- Create docker network `web`: `docker network create web`
- Build `ansible` docker image: `docker/ansible/build_image.bat` (Adjust `ansible-galaxy` packages and `ansible.cfg` if needed)
- *(Optional)* Build `debian_server` docker image: run `docker/debian_server/build_image.bat`

## Use

- Start debian docker image: `debian_server_start.bat`
- Start ansible: `ansible.bat` and test with provided playbook (nodejs hello world):
  ```
  cd node-hello
  ansible-playbook -i hosts main.yml
  ```
- The included debian server is accessible through SSH on port 2222