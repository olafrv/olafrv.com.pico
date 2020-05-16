#!/bin/bash

cmd=$1 # install then upgrade
release=olafrv-com
namespace=olafrv-com

kubectl config set-context --current --namespace=$namepsace \
  && helm lint ./mychart \
  && helm template --debug $release ./mychart \
  && helm $cmd --debug --dry-run $release ./mychart \
  && helm $cmd $release ./mychart 

# helm package ./mychart
# helm install example mychart-<version>.tgz --set service.type=NodePort
# helm get manifest $release
# helm get all $release
# helm status $release --debug
# helm uninstall $release