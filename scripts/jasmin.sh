#!/bin/env bash

kubectl config set-cluster kubernetes \
    --server https://"${KUBERNETES_EXTERNAL_IP}":6443 \
    --insecure-skip-tls-verify=true


kubectl config set-credentials oidc \
    --auth-provider=oidc \
    --auth-provider-arg=idp-issuer-url=https://"${ID_GATEWAY_DOMAIN}"/auth/realms/master \
    --auth-provider-arg=client-id="${CLIENT_ID}" \
    --auth-provider-arg=client-secret="${CLIENT_SECRET}"


kubectl config set-context oidc@kubernetes --cluster kubernetes --user oidc

kubectl config use-context oidc@kubernetes