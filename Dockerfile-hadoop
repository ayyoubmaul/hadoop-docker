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
    python3-setuptools \
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

# =================  Install Spark  ====================================
ENV SPARK_VERSION spark-3.3.1-bin-hadoop3
ENV SPARK_URL https://downloads.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz

RUN set -x \
    && curl -fSL "$SPARK_URL" -o /tmp/spark.tar.gz \
    && tar -xvzf /tmp/spark.tar.gz -C /opt/ \
    && rm /tmp/spark.tar.gz*

ENV SPARK_HOME=/opt/$SPARK_VERSION
ENV PATH $SPARK_HOME/bin:$PATH
# =======================================================================

# update alternatives for python command and run python3 instead
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# install Cython package
RUN pip3 install Cython

# install all python package listed in requirements
ADD requirements.txt /requirements.txt

# run install
RUN pip3 install -r /requirements.txt
