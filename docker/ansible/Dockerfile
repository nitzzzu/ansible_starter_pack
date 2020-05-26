FROM debian:buster-slim

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY ansible.cfg /etc/ansible/ansible.cfg

ADD https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt /tmp/requirements-azure.txt

RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y python3 python3-pip python3-setuptools dos2unix openssh-client wget && \
	dos2unix /bin/docker-entrypoint.sh && chmod +x /bin/docker-entrypoint.sh && \
	pip3 install --no-cache --upgrade wheel ansible mitogen && \
	pip3 install -r /tmp/requirements-azure.txt  && \
	ansible-galaxy install geerlingguy.docker geerlingguy.docker_arm geerlingguy.nodejs && \
	ansible-galaxy collection install azure.azcollection --force && \
	apt-get --purge remove -y python3-pip python3-setuptools dos2unix && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ansible
WORKDIR /ansible

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/bin/docker-entrypoint.sh"]