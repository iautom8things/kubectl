#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

sh -c "/builder/google-cloud-sdk/bin//kubectl${KUBECTL_VERSION:+.${KUBECTL_VERSION}} $*"
