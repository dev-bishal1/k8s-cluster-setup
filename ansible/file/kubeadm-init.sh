#!/bin/bash
sudo systemctl restart kubelet
sudo kubeadm init --apiserver-advertise-address=192.168.33.17 --pod-network-cidr=10.244.0.0/16 &> cluster-setup.txt
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# this will extract the joinig token from the cluster-setup txt file
cd $HOME

cat cluster-setup.txt | grep -i 'kubeadm join' > token.sh
cat cluster-setup.txt | grep -i 'discovery-token' >> token.sh

sed -i 's/kubeadm/sudo kubeadm/' token.sh

sudo chmod +x token.sh
