# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'

Vagrant.require_version ">= 2.0.2"

SUPPORTED_OS = {
  "centos"        => {box: "centos/7",           bootstrap_os: "centos", user: "vagrant"}
}

# Defaults for config options defined in CONFIG
$num_instances = 3
$instance_name_prefix = "kube"
$vm_gui = false
$vm_memory = 4096
$vm_cpus = 1
$forwarded_ports = {}
$subnet = "172.17.8"
$os = "centos"

# The first three nodes are etcd servers
$etcd_instances = $num_instances
# The first two nodes are kube masters
$kube_master_instances = $num_instances == 1 ? $num_instances : ($num_instances - 1)
# All nodes are kube nodes
$kube_node_instances = $num_instances

$local_release_dir = "/vagrant/temp"

host_vars = {}

$box = SUPPORTED_OS[$os][:box]
$inventory = File.join(File.dirname(__FILE__), "inventory")

Vagrant.configure("2") do |config|
  config.vm.box = $box

  # always use Vagrants insecure key
  config.ssh.insert_key = false
  
  config.ssh.username = SUPPORTED_OS[$os][:user]
  
  (1..$num_instances).each do |i|
    config.vm.define vm_name = "%s-%02d" % [$instance_name_prefix, i] do |config|
      config.vm.hostname = vm_name

      config.vm.provider :virtualbox do |vb|
        vb.gui = $vm_gui
        vb.memory = $vm_memory
        vb.cpus = $vm_cpus
      end

      ip = "#{$subnet}.#{i+100}"

      config.vm.network :private_network, ip: ip
    end
    
  end
end
