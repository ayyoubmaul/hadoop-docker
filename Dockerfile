FROM wxwmatt/hadoop-base:2.1.1-hadoop3.3.1-java8

# change user to root
USER root

# install linux dependencies
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

# update alternatives for python command and run python3 instead
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# install Cython package
RUN pip3 install Cython

# install all python package listed in requirements
ADD requirements.txt /requirements.txt

# run install
RUN pip3 install -r /requirements.txt
