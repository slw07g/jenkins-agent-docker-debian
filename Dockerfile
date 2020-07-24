# build using: docker build -t jenkins-agent .
FROM dwolla/jenkins-agent-core:debian
MAINTAINER Dwolla Dev <dev+jenkins-python@dwolla.com>
LABEL org.label-schema.vcs-url="https://github.com/Dwolla/jenkins-agent-docker-python"

USER root
RUN apt update && apt install --upgrade -y \
        apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
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
    chown -R jenkins /usr/lib/python3 && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt update && apt install -y docker-ce docker-ce-cli containerd.io && \
    usermod -aG docker jenkins


USER jenkins
