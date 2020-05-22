FROM debian:buster-slim

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY ansible.cfg /etc/ansible/ansible.cfg

RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y python3 python3-pip python3-setuptools dos2unix openssh-client && \
    dos2unix /bin/docker-entrypoint.sh && chmod +x /bin/docker-entrypoint.sh && \
	pip3 install --no-cache --upgrade ansible mitogen && \
	ansible-galaxy install geerlingguy.docker geerlingguy.docker_arm geerlingguy.nodejs && \
	apt-get --purge remove -y python3-pip python3-setuptools dos2unix && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ansible
WORKDIR /ansible

ENTRYPOINT ["/bin/docker-entrypoint.sh"]