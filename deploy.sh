#!/bin/bash

cmd=$1 # install then upgrade or finally uninstall
release=olafrv-com
namespace=olafrv-com
chart="./k8s/mychart"

# Namespaces can be created before install, maybe in Helm 3.1
kubectl get namespaces -o custom-columns=NAME:.metadata.name | grep "^${namespace}$" \
  || kubectl apply -f "./k8s/mychart/namespaces.yaml"

helm lint -n $namespace $chart
helm template -n $namespace --debug $release $chart
if [ "$cmd" != "uninstall" ]
then 
  helm $cmd -n $namespace --debug --dry-run $release $chart
  helm $cmd -n $namespace $release $chart
else
  helm $cmd -n $namespace $release
fi

# helm package ./mychart
# helm install example mychart-<version>.tgz --set service.type=NodePort
# helm get manifest $release
# helm get all $release
# helm status $release --debug
# helm uninstall $release