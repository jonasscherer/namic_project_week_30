#!/bin/bash
# -*- coding: utf-8; mode: sh; sh-indentation: 2; indent-tabs-mode: nil; -*-

# @Usage: ./deploy_platform.sh
# @Author: Jonas Scherer <jonas.scherer@dkfz-heidelberg.de>
# @Vendor: www.dkfz.de, Deutsches Krebsforschungszentrum - Stiftung des
#    öffentlichen Rechts, INF 280, 69120 Heidelberg, <kontakt@dkfz.de>
# @Copyright 2018 (c) German Cancer Research Center, Division of Medical and
#    Biological Informatics. All rights reserved.
# @License: BSD Lizenz 2.0

cd "$(dirname "$0")"


echo "Checking if Kubectl is installed..."
command -v kubectl >/dev/null 2>&1 || {
    echo >&2 "Kubectl has to be installed for this script - but it's not installed.  Aborting.";
    exit 1; }
echo "OK!"


echo "Checking if correct Kubectl config is in place..."
kubectl get pods --all-namespaces
if [ $? -eq 0 ]; then
    echo "Server connection - OK!"
else
    echo "Kubectl could not communicate with the server."
    echo "Have a look at the output, "
    echo "Check if the correct server certificate file is in place @ ~/.kube/config, "
    echo "Check if the IP address in the certificate matches the IP address of the server "
    echo "and try again."
    exit 1
fi


kubectl apply -f ./certificate
kubectl apply -f ./dcm4che
kubectl apply -f ./traefik_standalone
kubectl apply -f ./keycloak
kubectl apply -f ./keycloak_proxy_standalone
kubectl apply -f ./ohif
