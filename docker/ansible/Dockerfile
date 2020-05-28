FROM debian:buster-slim

ADD https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt /tmp/requirements-azure.txt

RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y python3 python3-pip python3-setuptools dos2unix openssh-client wget sshpass && \
	pip3 install --no-cache --upgrade wheel ansible mitogen && \
	pip3 install -r /tmp/requirements-azure.txt  && \
	apt-get --purge remove -y python3-pip python3-setuptools && rm -rf /var/lib/apt/lists/*

RUN ansible-galaxy install geerlingguy.docker geerlingguy.docker_arm geerlingguy.nodejs && \
	ansible-galaxy collection install azure.azcollection --force

COPY ansible.cfg /etc/ansible/ansible.cfg

COPY vault_pass.py /tmp/vault_pass.py
RUN dos2unix /tmp/vault_pass.py && chmod +x /tmp/vault_pass.py

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN dos2unix /bin/docker-entrypoint.sh && chmod +x /bin/docker-entrypoint.sh

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

RUN mkdir -p /ansible
WORKDIR /ansible

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/bin/docker-entrypoint.sh"]