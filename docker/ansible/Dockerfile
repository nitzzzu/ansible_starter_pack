FROM ubuntu:20.04

ARG PACKER_VERSION="1.5.6"
#ARG TERRAFORM_VERSION="0.12.26"

ADD https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt /tmp/requirements-azure.txt

RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y python3 python3-apt python3-pip python3-setuptools dos2unix openssh-client wget sshpass unzip gnupg2 && \
	pip3 install --no-cache --upgrade wheel ansible mitogen passlib pywinrm ansible-cmdb && \
	pip3 install -r /tmp/requirements-azure.txt && \
	#wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
	wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
	unzip '*.zip' -d /usr/local/bin && \
	#wget -q -O "/usr/local/bin/jq" "https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64" && chmod +x /usr/local/bin/jq && \
	wget -q -O - https://download.docker.com/linux/debian/gpg > /tmp/dkey && apt-key add /tmp/dkey && \
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" > /etc/apt/sources.list && \
	apt-get update && \
	apt-get -y install --no-install-recommends docker-ce-cli && \
	wget -q -O - https://packages.microsoft.com/keys/microsoft.asc > /tmp/akey && apt-key add /tmp/akey && \
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ buster main" > /etc/apt/sources.list && \
	apt-get update && \
	apt-get -y install --no-install-recommends azure-cli && \
	apt-get --purge remove -y python3-setuptools gnupg2 && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* *.zip

RUN ansible-galaxy install geerlingguy.docker geerlingguy.docker_arm geerlingguy.nodejs && \
	ansible-galaxy collection install azure.azcollection --force && \
	ansible-galaxy install elastic.elasticsearch,7.7.1 && \
	ansible-galaxy install geerlingguy.java

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY roles /etc/ansible/roles

COPY vault_pass.py /tmp/vault_pass.py
RUN dos2unix /tmp/vault_pass.py && chmod +x /tmp/vault_pass.py

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN dos2unix /bin/docker-entrypoint.sh && chmod +x /bin/docker-entrypoint.sh

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

WORKDIR /ansible

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/bin/docker-entrypoint.sh"]