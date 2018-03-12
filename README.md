# kubeadm-ansible

Ansible playbooks with roles to setup multi-node kubernetes cluster using kubeadm. 

## Prerequistes

* 1 master machine - centos 7

* 1+ worker machines - centos 7

* Ansible (>=2.4) is required in the client machine from where cluster setup will run

If your trying to setup cluster in your local machine, use the Vagrantfile provided to create 3 centos7 virtual machine. Please change the cpu and memory requirements as per your need.

## Configuration

1. Change the inventory hosts configuration.

2. Change the group variables (inventory/all.yml). Change the 'network_interface' to the correct one. Note: If the virtual machine is created using vagrant/virtualbox, network_interface will be 'eth1'.
