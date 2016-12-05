FROM python:2.7-slim
MAINTAINER Richard Silver motu@fastmail.com

RUN apt-get update && apt-get -qqy install lbzip2 imagemagick sqlite fontconfig libfontconfig1 libfontconfig1-dev python-fontconfig tar \
    && rm -rf /var/lib/apt/lists/*

COPY . /project

WORKDIR /project

RUN pip install -r requirements.txt && pip install -e .

ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 /tmp/

RUN tar -xf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs-2.1.1-linux-x86_64/bin/phantomjs --strip-components 2 \
    && mv phantomjs /bin/ \
    && rm -rf /tmp/*

RUN python -c 'from dpxdt import server; server.db.drop_all(); server.db.create_all()'

CMD bash /project/run_combined.sh
