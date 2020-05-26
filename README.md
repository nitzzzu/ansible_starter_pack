# Ansible starter pack

- Latest ansible version
- Windows friendly
- SSH key authentication ready
- Customizable
- Packed with the following roles: geerlingguy.docker, geerlingguy.docker_arm, geerlingguy.nodejs, azure.azcollection

## Install

- Install `docker`
- Create ssh public/private keys: `ssh-keygen -t rsa -b 2048` (available in `~/.ssh` folder)
- Create docker network `web`: `docker network create web`
- Build `ansible` docker image: `docker/ansible/build_image.bat` (Adjust `ansible-galaxy` packages and `ansible.cfg` if needed)
- _(Optional)_ Build `debian_server` docker image: run `docker/debian_server/build_image.bat`
- Make `ansible` and `ansible-playbook` available system wide by adding ansible starter folder to PATH

## Use

- Start debian docker image: `debian-up.bat`
- Test with provided playbook (nodejs hello world):
  ```
  cd node-hello
  ansible all -m ping -i hosts
  ansible-playbook -i hosts main.yml
  ```
- The included debian server is accessible through SSH on port 2222
- After running the test playbook check: localhost:3000
