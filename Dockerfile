FROM wxwmatt/hadoop-base:2.1.1-hadoop3.3.1-java8

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    iputils-ping \
    wget \
    python3-dev \
    python3.6 \
    python3-pip \
    gcc \
    git-core \
    libffi-dev \
    libjpeg-dev \
    libpcre3 \
    libpcre3-dev \
    autoconf \
    libtool \
    pkg-config\
    zlib1g-dev \
    libssl-dev \
    libexpat1-dev \
    libxslt1.1\
    gnuplot

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

RUN pip3 install Cython

ADD requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt
