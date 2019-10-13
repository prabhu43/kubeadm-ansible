# kubeadm-ansible

Ansible playbooks with roles to setup multi-node kubernetes cluster using kubeadm. 

## Prerequistes

* Vagrant >= 2.2.5

* Ansible (>=2.8.0)

## Commands

Install vagrant plugin vagrant-hostsupdater to update `/etc/hosts` on vagrant up
`vagrant plugin install vagrant-hostsupdater`

Spin up virtual machines
`vagrant up`

Create non-root user with sudo privileges in all VMs
`ansible-playbook -i inventory/hosts user.yml`

Install kube dependencies on all VMs
`ansible-playbook -i inventory/hosts kube-dependencies.yml`

Initialise master
`ansible-playbook -i inventory/hosts master.yml`

Join worker nodes to cluster
`ansible-playbook -i inventory/hosts workers.yml`

Install kube-bench in all nodes
`ansible-playbook -i inventory/hosts kube-bench.yml`