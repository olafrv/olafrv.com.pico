helm create 
helm install 
helm get manifest 
helm uninstall 

helm lint
helm template --debug
helm install --debug --dry-run goodly-guppy ./mychart | less

helm get manifest
helm status 
helm get all 

helm install example ./mychart --set service.type=NodePort
helm package ./mychart
helm install example3 mychart-0.1.0.tgz --set service.type=NodePort
helm search local

helm serve

helm install example4 local/mychart --set service.type=NodePort

kubectl proxy --accept-hosts='^127.0.0.1,0.0.0.0$' --address='192.168.2.219' --port=8443

sudo kubectl port-forward service/test --address 192.168.2.219 80:80 --namespace=test