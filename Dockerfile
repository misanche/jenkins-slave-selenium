FROM registry.redhat.io/openshift4/ose-jenkins-agent-maven:latest

USER root

# Add CentOS Repo
COPY centos.repo /etc/yum.repos.d/centos.repo
# Add Chrome Repo
COPY google-chrome.repo /etc/yum.repos.d/google-chrome.repo

# Install Chrome
RUN yum install -y google-chrome-stable

USER 1001