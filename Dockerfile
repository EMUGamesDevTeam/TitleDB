FROM python:3.6

EXPOSE 6543

RUN groupadd --gid 5000 titledb && useradd --no-log-init --no-create-home --home-dir /usr/src/titledb --uid 5000 --gid 5000 --shell /bin/false titledb
RUN mkdir -p /usr/src/titledb && chown titledb:titledb /usr/src/titledb
RUN mkdir -p /var/log/titledb && chown titledb:titledb /var/log/titledb
WORKDIR /usr/src/titledb

RUN apt-get update && apt-get install -y \
	cron \
	libarchive13 \
        lrzip \
	--no-install-recommends && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* && pip install dumb-init

COPY --chown=titledb:titledb setup.py version.py /usr/src/titledb/
RUN pip install -e .
COPY --chown=titledb:titledb . /usr/src/titledb
COPY --chown=titledb:titledb extras/cron/titledb /var/spool/cron/crontabs/

ENTRYPOINT ["dumb-init", "--"]
CMD ["bash", "-c", "cron && su -s /bin/bash -c \"exec pserve production.ini\" titledb"]
