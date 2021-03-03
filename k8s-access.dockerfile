FROM quay.io/bcdev/k8s-access:1.1.base

WORKDIR /home/user

COPY scripts/aws.sh /home/user/scripts/
COPY scripts/jasmin.sh /home/user/scripts/

CMD ["/bin/bash"]
