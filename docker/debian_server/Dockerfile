FROM debian:buster

COPY init.sh /bin/init.sh
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends python3 openssh-server dos2unix && \
    dos2unix /bin/init.sh && chmod +x /bin/init.sh && /bin/init.sh && \
	dos2unix /bin/docker-entrypoint.sh && chmod +x /bin/docker-entrypoint.sh && \
	apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/docker-entrypoint.sh"]