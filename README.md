# Linux

Currently this setup is tested with [Ubuntu 18.04 LTS](http://releases.ubuntu.com/releases/18.04/).

# Docker

[My Specific Docker Installation for K8s nodes](https://github.com/olafrv/k8s/blob/master/010_all_docker.sh).

After docker installation, read comments and then run script *build.sh* to the prepare the image(s).

# Kubernetes (Minikube in a VM)

Network Layout:
```
Desktop (ens33: 192.168.2.X/24) -> Virtualbox Machine (ens33:192.168.2.Y/24 + docker0:$(minikube ip))
```

Prepare [Minikube](https://minikube.sigs.k8s.io/docs/start/) with
[NGINX IngressController](https://kubernetes.github.io/ingress-nginx/deploy/#minikube) inside the VM:

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
minikube start
minikube addons enable ingress
kubectl get pods -n kube-system | grep nginx-ingress-controller
```

At this moment, you can install optionally [My Preferred K8S Tools](https://github.com/olafrv/k8s/blob/master/999_user_tools.sh) inside the VM.

If using [Lens K8s IDE](https://github.com/lensapp/lens) in your Desktop, allow it to access the API Server (Using --accept-hosts="RegExp"):
```
# Custom kubeconfig for Lens (Copy & Paste)
kubectl config view --minify --flatten # https -> http & change to IP(Y) !!!
# Proxy the access to the API Server (Must be running in the background when using Lens) !!!
# kubectl proxy --accept-hosts='^.*$' --address='192.168.2.Y' --port=8443
kubectl proxy --accept-hosts='^127.0.0.1,localhost,192.168.2.X$' --address='192.168.2.Y' --port=8443
# Ensure you can still access the API locally INSIDE the VM !!!
curl --insecure http://192.168.2.Y:8443/version
curl --insecure http://localhost:8443/version
curl --insecure http://127.0.0.1:8443/version
```
Deploy the site (www.olafrv.com) with [Helm](https://helm.sh/docs/intro/install/) to Minikube:
```
sudo snap install helm --classic
. deploy.sh
```
Test the deployed service inside the VM:
```
sudo kubectl port-forward service/olafrv-com --address 192.168.2.Y 8081:80 --namespace=olafrv-com
curl http://192.168.2.Y:8081/pico/
```

Test the deployed service through the ingress controller:
```
curl http://$(minikube ip):80
# curl https://$(minikube ip):443
```

## Forward LAN Port inside the VM:  

This step needed because Minikube Cluster IP is not accesible from your Desktop (LAN):
```
(ens33) 192.168.2.Y:80 => (docker0) $(minikube ip):80 (NGINX IngressController) 
```

### HTTP Forward
```
sudo iptables -A PREROUTING -t nat -i ens33 -p tcp --dport 80 -j DNAT --to $(minikube ip):80
sudo iptables -A FORWARD -p tcp -d $(minikube ip) --dport 80 -j ACCEPT
```

### HTTPS Forward (Only when TLS is enable inside containers)
```
sudo iptables -A PREROUTING -t nat -i ens33 -p tcp --dport 443 -j DNAT --to $(minikube ip):80
sudo iptables -A FORWARD -p tcp -d $(minikube ip) --dport 443 -j ACCEPT
```

# Fake /etc/hosts

```
192.168.2.X olafrv.local
# 192.168.2.X olafrv.com # Google Chrome does not works with HTTP with Global Domains!!!
```