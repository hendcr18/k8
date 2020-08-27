mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml

kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
