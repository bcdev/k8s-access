FROM ubuntu:latest

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get install -y -qq git vim curl unzip sudo less groff

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
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

ENV KUBECTL_USER_NAME=kubectl

SHELL ["/bin/bash", "-c"]
RUN groupadd -g 1000 ${KUBECTL_USER_NAME}
RUN useradd -u 1000 -g 1000 -ms /bin/bash ${KUBECTL_USER_NAME}
RUN mkdir /workspace && chown ${KUBECTL_USER_NAME}.${KUBECTL_USER_NAME} /workspace

USER ${KUBECTL_USER_NAME}


RUN ( \
  set -x; cd "$(mktemp -d)" && \
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" && \
  tar zxvf krew.tar.gz && \
  KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" && \
  "$KREW" install krew \
)


ENV PATH="~/.krew/bin:${PATH}"

RUN echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.bashrc

RUN export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH" && kubectl krew install oidc-login

WORKDIR /workspace

ENTRYPOINT ["bash"]


