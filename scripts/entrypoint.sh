#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}
GROUP_ID=${LOCAL_GROUP_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u "$USER_ID" -o -c "" -m user
export HOME=/home/user/

cp /etc/skel/.bashrc $HOME/
cp /etc/skel/.profile $HOME/
cp /etc/skel/.bash_logout $HOME/

kubectl completion bash >>  /etc/bash_completion.d/kubectl
helm completion bash >> /etc/bash_completion.d/helm
eksctl completion bash >> /etc/bash_completion.d/eksctl
echo "complete -C '/usr/local/bin/aws_completer' aws" >> $HOME/.bashrc

chown "$USER_ID"."$GROUP_ID" -R /home/user

exec /usr/sbin/gosu user "$@"
