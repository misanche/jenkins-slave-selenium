FROM registry.redhat.io/openshift4/ose-jenkins-agent-maven:latest

USER root

# Copy entitlements
COPY ./etc-pki-entitlement /etc/pki/entitlement
# Add CentOS Repo
#COPY centos.repo /etc/yum.repos.d/centos.repo
# Add Chrome Repo
#COPY google-chrome.repo /etc/yum.repos.d/google-chrome.repo
# Add chrome-driver installation script
COPY install-chrome-driver.sh .

# Install Chrome & chromedriver
RUN yum install -y google-chrome-stable && ./install-chrome-driver.sh

USER 1001