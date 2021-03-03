FROM tt101

WORKDIR /home/user

COPY scripts/aws.sh /home/user/scripts/
COPY scripts/jasmin.sh /home/user/scripts/

CMD ["/bin/bash"]
