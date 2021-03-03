[![Docker Repository on Quay](https://quay.io/repository/bcdev/k8s-access/status "Docker Repository on Quay")](https://quay.io/repository/bcdev/k8s-access)

# k8s-access Docker Image

The aim of this repo is to generate a docker image that contains all necessary software for
accessing (AWS) K8s clusters.

Run this docker image usin the following command:

```bash
docker run -it -v $PWD:/home/user/work -v $HOME/.kube:/home/user/.kube -v $HOME/.aws:/home/user/.aws  -e LOCAL_USER_ID=`id -u $USER` -e LOCAL_GROUP_ID=`id -g $USER` quay.io/bcdev/k8s-access:v1.1
```

This will add the local user to the docker container and mount your kubernetes as well as aws configurations.

You can also set aliases. E.g.

```bash
alias k8s-admin="docker run -it -v $HOME/k8s-work:/home/user/work -v $HOME/.kube:/home/user/.kube -v $HOME/.aws:/home/user/.aws  -e LOCAL_USER_ID=`id -u $USER` -e LOCAL_GROUP_ID=`id -g $USER` quay.io/bcdev/k8s-access:v1.1"
k8s-admin
```
