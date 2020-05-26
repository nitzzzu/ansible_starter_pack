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
- Make ansible scripts available system wide by adding ansible starter folder to PATH:

```
ans = ansible
ansb = ansible bash
ansd = ansible decrypt
anse = ansible encrypt
ansp = ansible playbook
ansv = ansible vault
```

## Use

- Any environment variables can be passed by creating an .env file near your playbooks 
- If you are using Ansible vault you can pass the password as environment variable
```
ANSIBLE_VAULT_PASSWORD=[your password here]
```
- Start debian docker image: `debian-up.bat`
- Test with provided playbook (nodejs hello world):
  ```
  cd node-hello
  ans all -m ping -i hosts
  ansp -i hosts main.yml
  ```
- The included debian server is accessible through SSH on port 2222
- After running the test playbook check: localhost:3000
