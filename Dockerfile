FROM python:latest

MAINTAINER Steve HOUËL <steve.houel.perso@gmail.com>

# Install groff to enable AWS CLI command line help
RUN apt-get update \
    && apt-get --assume-yes install groff \
    && apt-get clean

COPY dev-requirements.txt /tmp/

RUN pip install --upgrade -r /tmp/dev-requirements.txt

RUN useradd aws

USER aws

WORKDIR /app

CMD aws --version
