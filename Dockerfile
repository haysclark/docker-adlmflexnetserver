FROM centos:centos6
MAINTAINER hays.clark@gmail.com

#########################################
##             CONSTANTS               ##
#########################################
# path for Network Licence Manager
ARG NLM_URL=https://knowledge.autodesk.com/sites/default/files/file_downloads/nlm11.16.2.0_ipv4_ipv6_linux64.tar.gz
# path for temporary files
ARG TEMP_PATH=/tmp/flexnetserver

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
# add the flexlm commands to $PATH
ENV PATH="${PATH}:/opt/flexnetserver/"

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
ADD /files /usr/local/bin

RUN yum update -y && yum install -y \
    redhat-lsb-core \
    wget && \
    yum clean all

RUN mkdir -p ${TEMP_PATH} && cd ${TEMP_PATH} && \
    wget --progress=bar:force ${NLM_URL} && \
    tar -zxvf *.tar.gz && rpm -vhi *.rpm && \
    rm -rf ${TEMP_PATH}

# lmadmin is required for -2 -p flag support
RUN groupadd -r lmadmin && \
    useradd -r -g lmadmin lmadmin

#########################################
##              VOLUMES                ##
#########################################
VOLUME ["/var/flexlm"]

#########################################
##            EXPOSE PORTS             ##
#########################################
EXPOSE 2080
EXPOSE 27000-27009

# do not use ROOT user
USER lmadmin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
# no CMD, use container as if 'lmgrd'
