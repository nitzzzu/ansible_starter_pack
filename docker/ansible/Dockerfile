FROM debian:buster-slim

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY ansible.cfg /etc/ansible/ansible.cfg

ADD https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt /tmp/requirements-azure.txt

RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y python3 python3-pip python3-setuptools dos2unix openssh-client && \
	dos2unix /bin/docker-entrypoint.sh && chmod +x /bin/docker-entrypoint.sh && \
	pip3 install --no-cache --upgrade wheel ansible mitogen && \
	pip3 install -r /tmp/requirements-azure.txt  && \
	ansible-galaxy install geerlingguy.docker geerlingguy.docker_arm geerlingguy.nodejs && \
	ansible-galaxy collection install azure.azcollection --force && \
	apt-get --purge remove -y python3-pip python3-setuptools dos2unix && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ansible
WORKDIR /ansible

ENTRYPOINT ["/bin/docker-entrypoint.sh"]