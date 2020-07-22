# build using: docker build -t jenkins-agent .
FROM dwolla/jenkins-agent-core:debian
MAINTAINER Dwolla Dev <dev+jenkins-python@dwolla.com>
LABEL org.label-schema.vcs-url="https://github.com/Dwolla/jenkins-agent-docker-python"

USER root
RUN apt install --upgrade -y \
        python3 \
        python3-pip \
        python3-dev \
        jq \
        make \
        git \
        zip \
        gcc \
        g++ \
        musl-dev \
        libffi-dev \
        libssl-dev \
        unixodbc-dev \
        && \
    pip3 install --upgrade \
        setuptools \
        && \
    python3 -m pip install --upgrade pip && \
    chown -R jenkins /usr/lib/python3 

USER jenkins
