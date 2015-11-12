# docker run -dt -p 8112:8112 pluribuslabs/centos7-youtrack-server

FROM pluribuslabs/centos7-oracle-jdk-7

MAINTAINER Pluribus Labs Docker Dev <docker-dev@pluribuslabs.com>



RUN yum -y install wget
RUN yum -y install unzip
ENV HUB_PACKAGE hub-ring-bundle-1.0.648.zip
ENV HUB_DOWNLOAD http://download-cf.jetbrains.com/hub/1.0
ENV HUB_PORT 8110

RUN wget -nv $HUB_DOWNLOAD/$HUB_PACKAGE && \
             unzip $HUB_PACKAGE -C /opt
EXPOSE $HUB_PORT

# Looks like ENV variables don't get subbed in the CMD command hence the hardcode
# from https://confluence.jetbrains.com/display/YTD6/YouTrack+JAR+as+a+Service+on+Linux
CMD ["/opt/hub-ring-bundle-1.0.648/bin/hub.sh", "run"]
