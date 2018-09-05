FROM python:latest

MAINTAINER Steve HOUËL <steve.houel.perso@gmail.com>

# Install groff to enable AWS CLI command line help
RUN apt-get update \
    && apt-get --assume-yes install groff \
    && apt-get clean

COPY dev-requirements.txt /tmp/

RUN pip install -r /tmp/dev-requirements.txt --user --upgrade

# Adding AWS CLI Executable to Path
RUN echo 'export PATH=~/.local/bin:$PATH'>>root/.bashrc

WORKDIR /app

ENTRYPOINT ["aws"]
CMD [ "--version" ]
