FROM openshift/jenkins-agent-maven:latest

USER root

# Install Chrome
##COPY google-chrome-repo /etc/yum.repos.d/google-chrome-repo
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
#RUN yum -y install redhat-lsb libXScrnSaver
RUN yum -y localinstall ./google-chrome-stable_current_*.rpm

#RUN yum install google-chrome-stable