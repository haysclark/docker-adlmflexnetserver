
FROM centos:centos6

MAINTAINER hays.clark@gmail.com

ARG NLM_URL=http://download.autodesk.com/us/support/files/network_license_manager/11_13_1_2_v2/Linux/nlm11.13.1.2_ipv4_ipv6_linux64.tar.gz
ARG TEMP_PATH=/tmp/flexnetserver

EXPOSE 2080
EXPOSE 27000-27009

# Ideally this list of dependancies will be trimmed down
RUN yum update -y && yum install -y \
    redhat-lsb \
    wget && \
    yum clean all

RUN echo "Downloading..." && \
    mkdir -p ${TEMP_PATH} && \
    cd ${TEMP_PATH} && \
    wget ${NLM_URL} -q && \
    tar -zxvf *.tar.gz && \
    echo "Installing..." && \
    rpm -vhi *.rpm && \
    echo "Install complete!" && \
    rm -rf ${TEMP_PATH}

# lmadmin is required for -2 -p flag support
RUN groupadd -r lmadmin && \
    useradd -r -g lmadmin lmadmin

RUN mkdir -p /var/log/flexlm && \
    touch /var/log/flexlm/lmgrd.log && \
    chown lmadmin /var/log/flexlm/lmgrd.log

VOLUME ["/var/flexlm", "/var/log/flexlm"]

# add the flexlm commands to $PATH
ENV PATH="${PATH}:/opt/flexnetserver/"

# do not use ROOT user
USER lmadmin

# lmgrd -z flag is required to 'Run in foreground.' so that
# Docker will not start sleeping regardless flags.
ENTRYPOINT ["lmgrd", "-z"]

# default arguments for 'lmgrd', note '-z' is ALWAYS added
CMD ["-l", "/var/log/flexlm/lmgrd.log", "-c", "/var/flexlm/mayaserver.lic"]

# if you are unsure if the server is running correctly, you can log
# into the container with ```docker exec -it CONTAINER_ID /bin/bash```
# once in bash you can run: ```lmutil lmstat -a -c LICENSE_PATH```
