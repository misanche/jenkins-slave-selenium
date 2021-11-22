# Information

This repository allows you to create a Jenkins agent with Chrome installed for running UI Tests

## Docker

### Build

``` terminal
docker build --no-cache -t jenkins-slave-chrome .
```

## Openshift

``` terminal
oc new-build https://github.com/misanche/jenkins-slave-selenium.git --name=jenkins-slave-chrome -e GIT_SSL_NO_VERIFY=true --labels=role=jenkins-slave -n <namespace>
```

Note: Using the label role=jenkins-slave the jenkins slave is going to be configured automatically.
