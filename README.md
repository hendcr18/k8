# k8

# YOU NEED TO DISABLE SWAP BEFORE DOING ANYTHING
#if you're running Ubuntu, you can do one of the following:

#this command will need to be run as root and then reboot

swapoff -a

#secondly, you can do the following:

sudo vim /etc/fstab

#comment out the second line and then reboot

#Run the master.sh on your master node and the worker.sh on your worker nodes

#After you run the master.sh script, ensure you run the three commands you see on the CLI as a normal user, not as root.

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

#The script will run the following command to initialize the cluster, don't change the subnet.

sudo kubeadm init --pod-network-cidr=192.168.0.0/16

#you'll need to join your worker nodes by using the kubeadm join command provided. Copy and paste that command into the worker nodes

#Finally, run the last two commands here to install Calico:

kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml

kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
