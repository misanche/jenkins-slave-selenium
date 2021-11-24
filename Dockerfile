FROM registry.redhat.io/openshift4/ose-jenkins-agent-maven:latest

USER root

# Copy entitlements
COPY ./etc-pki-entitlement /etc/pki/entitlement
# Copy subscription manager configurations
COPY ./rhsm-conf /etc/rhsm
COPY ./rhsm-ca /etc/rhsm/ca
# Add Chrome Repo
COPY google-chrome.repo /etc/yum.repos.d/google-chrome.repo
# Add chrome-driver installation script
COPY install-chrome-driver.sh .

# Delete /etc/rhsm-host to use entitlements from the build container
RUN rm /etc/rhsm-host && \
    # Initialize /etc/yum.repos.d/redhat.repo
    # See https://access.redhat.com/solutions/1443553
    yum repolist --disablerepo=* && \
    subscription-manager repos --enable rhel-8-for-x86_64-appstream-rpms && \
    yum -y update && \
    yum -y install google-chrome-stable && \
    # Remove entitlements and Subscription Manager configs
    rm -rf /etc/pki/entitlement && \
    rm -rf /etc/rhsm

# Install Chrome & chromedriver
RUN ./install-chrome-driver.sh

USER 1001