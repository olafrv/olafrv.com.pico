# Expose k8s API Server (e.g. Lens)
```
kubectl proxy --accept-hosts='^127.0.0.1,0.0.0.0$' --address='192.168.2.219' --port=8443
```
# Expose k8s service with pods service 80 for testing (eth0=192.168.2.219)
```
sudo kubectl port-forward service/test --address 192.168.2.219 80:80 --namespace=test
```