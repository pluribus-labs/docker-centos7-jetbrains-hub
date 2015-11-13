# docker run -dt -p 8110:8110 pluribuslabs/centos7-jetbrains-hub

FROM pluribuslabs/centos7-oracle-jdks-7-8

MAINTAINER Pluribus Labs Docker Dev <docker-dev@pluribuslabs.com>



RUN yum -y install wget
RUN yum -y install unzip
ENV HUB_PACKAGE hub-ring-bundle-1.0.648.zip
ENV HUB_DOWNLOAD http://download-cf.jetbrains.com/hub/1.0
ENV HUB_PORT 8110

RUN wget -nv $HUB_DOWNLOAD/$HUB_PACKAGE
RUN unzip $HUB_PACKAGE -d /opt/hub-ring-bundle-1.0.648
EXPOSE $HUB_PORT

# Looks like ENV variables don't get subbed in the CMD command hence the hardcode of values
# from https://confluence.jetbrains.com/display/YTD6/YouTrack+JAR+as+a+Service+on+Linux
CMD ["/opt/hub-ring-bundle-1.0.648/bin/hub.sh", "run", "--listen-port 8110"]
