FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
    sed -Ei 's/security.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list; \
    sed -Ei 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list;

RUN date

RUN apt update && apt install -y cron openssl coreutils git wget tzdata
RUN apt update && apt install -y nodejs
RUN apt update && apt install -y npm
WORKDIR /
RUN git clone https://github.com/chinnkarahoi/jd-scripts-docker.git
RUN git clone https://github.com/lxk0301/scripts.git
RUN cd /scripts && npm install || npm install --registry=https://registry.npm.taobao.org
COPY sync.sh /sync.sh
RUN bash sync.sh
CMD crontab -l && cron -f
