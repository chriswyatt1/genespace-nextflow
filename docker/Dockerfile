FROM mambaorg/micromamba:0.25.1

COPY R-base.yml R-base_micro.yml

USER root

RUN micromamba install -y -n base -f R-base_micro.yml && \
    micromamba clean --all --yes

RUN apt-get clean && apt-get update && apt-get install -y git

RUN git clone https://github.com/wyp1125/MCScanX.git
RUN git clone https://github.com/jtlovell/GENESPACE.git

COPY My_Rscript.txt My_Rscript_mamba.txt

RUN apt-get install --reinstall make

RUN /opt/conda/bin/R --vanilla < My_Rscript_mamba.txt

RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    autoconf \
    git \
    wget \
    unzip

WORKDIR /tmp

RUN apt-get install -y software-properties-common
RUN apt-get install -y apt-transport-https

RUN apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main'

#RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && \
    apt-get -y upgrade

RUN apt-get install -y openjdk-8-jdk;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN cd /tmp/MCScanX && \
   make


