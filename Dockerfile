FROM centos:7

MAINTAINER soeq

Label Remarks="CentOS7 for IMOD application"

RUN yum -y update

RUN yum -y install mesa-libGLU-devel libjpeg-turbo wget

RUN yum -y install xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps

RUN yum -y groupinstall "GNOME Desktop" "Development Tools"

RUN mkdir -p /root/IMOD_install

RUN cd /root/IMOD_install

RUN wget http://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_4.9.12_RHEL6-64_CUDA6.0.sh

RUN yes | sh imod_4.9.12_RHEL6-64_CUDA6.0.sh

RUN mkdir -p /root/IMODWork

RUN yum clean all

WORKDIR /root/IMODWork
