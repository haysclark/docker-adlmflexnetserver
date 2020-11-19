FROM centos:centos6

#########################################
##        BUILD-TIME VARIABLES        ##
#########################################
# url for Network Licence Manager
ARG NLM_URL=https://knowledge.autodesk.com/sites/default/files/file_downloads/nlm11.16.2.0_ipv4_ipv6_linux64.tar.gz
# path for temporary files
ARG TEMP_PATH=/tmp/flexnetserver

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
# add the flexlm commands to $PATH
ENV PATH="$PATH:/opt/flexnetserver/"

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
COPY /files /usr/local/bin

RUN yum install -y redhat-lsb-core-4.0 wget-1.12 && yum clean all

WORKDIR $TEMP_PATH
RUN wget --progress=bar:force -- $NLM_URL
RUN tar -zxvf ./*.tar.gz
RUN rpm -vhi ./*.rpm
RUN rm -rf $TEMP_PATH

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
