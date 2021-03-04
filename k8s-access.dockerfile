FROM quay.io/bcdev/k8s-access:v1.1.base

WORKDIR /workspace

COPY scripts/jasmin.sh /home/user/scripts/

CMD ["/bin/bash"]
