FROM registry.access.redhat.com/ubi8/ubi-minimal

#RUN yum --disableplugin=subscription-manager -y install postgresql \
#  && yum --disableplugin=subscription-manager -y install emacs-nox 