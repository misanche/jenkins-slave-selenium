# Information

This repository allows you to create a Jenkins agent with Chrome installed for running UI Tests

## Openshift


Note: Using the label role=jenkins-slave the jenkins slave is going to be configured automatically.

### Build image using Red Hat subscription

#### Prerequisites

In order to build an image using Redhat Subscription you need to get the entitlements, rhsm conf and rhsm ca.

#### Get the entitlement keys, ca and conf.

You need to have a machine subscribed. the files are located at:

Entitlements:
```
/etc/pki/entitlement/
 -> XXXXX.pem
 -> XXXXX-key.pem
```

Configuration:
```
/etc/rhsm/
 -> rhsm.conf
 ```

CA:

```
/etc/rhsm/ca
 -> redhat-entitlement-authority.pem
 -> redhat-uep.pem
```
#### Create the secrets in OCP

```
oc create secret generic etc-pki-entitlement --from-file <location>/<-key.pem>.pem  --from-file <location>/<number>-key.pem
```

```
oc create secret generic rhsm-conf --from-file <location>/rhsm.conf
```

```
oc create secret generic rhsm-ca --from-file <location>/redhat-entitlement-authority.pem  --from-file <location>/redhat-uep.pem
```

#### Create the build config

``` terminal
oc new-build https://github.com/misanche/jenkins-slave-selenium.git#ocp --name=jenkins-slave-chrome1 -e GIT_SSL_NO_VERIFY=true --build-secret "etc-pki-entitlement:etc-pki-entitlement" --build-secret "rhsm-conf:rhsm-conf" --build-secret "rhsm-ca:rhsm-ca" --labels=role=jenkins-slave -n <namespace>
```