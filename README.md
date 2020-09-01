# k8

#Run the master.sh on your master node and the worker.sh on your worker nodes

#After you run the master.sh script, ensure you run the three commands you see on the CLI as a normal user, not as root.

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#You need to initialize the kubeadm cluster and in doing so will need to use the right subnet for Calico. 

sudo kubeadm init --pod-network-cidr=192.168.0.0/16

#Finally, run the last two commands here to install Calico:
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
