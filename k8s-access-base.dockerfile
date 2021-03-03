FROM ubuntu:latest

ARG VERSION=1.3

ENV TZ=Europe/Berlin

ENV KUBERNETES_EXTERNAL_IP=192.171.139.28.nip.io
ENV ID_GATEWAY_DOMAIN=192-171-139-82.sslip.io
ENV CLIENT_ID=k8s
ENV CLIENT_SECRET=0f8c3621-79a5-46b8-9358-298b63976fa2

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y -qq apt-utils git vim curl unzip sudo less groff bash-completion gosu wget

WORKDIR /tmp
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN bash ./get_helm.sh

SHELL ["/bin/bash", "-c"]

RUN wget https://github.com/int128/kubelogin/releases/download/v1.22.1/kubelogin_linux_amd64.zip
RUN unzip kubelogin_linux_amd64.zip
RUN mv ./kubelogin /usr/local/bin

COPY scripts/entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY scripts/aws.sh /scripts/
COPY scripts/jasmin.sh /scripts/

ENTRYPOINT ["/entrypoint.sh"]


