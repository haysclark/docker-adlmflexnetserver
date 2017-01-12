
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

RUN mkdir -p ${TEMP_PATH} && cd ${TEMP_PATH} && \
    wget --progress=bar:force ${NLM_URL} && \
    tar -zxvf *.tar.gz && rpm -vhi *.rpm && \
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

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

# append additional aguments to 'lmgrd', unless user overrides
CMD ["-l", "/var/log/flexlm/lmgrd.log", "-c", "/var/flexlm/mayaserver.lic"]
