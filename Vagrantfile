# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.require_version ">= 2.2.5"

servers = [
    {
        :name => "k8s-master",
        :type => "master",
        :box => "ubuntu/xenial64",
        :box_version => "20180831.0.0",
        :eth1 => "192.168.205.10",
        :memory => "2048",
        :cpu => "2"
    },
    {
        :name => "k8s-worker-1",
        :type => "node",
        :box => "ubuntu/xenial64",
        :box_version => "20180831.0.0",
        :eth1 => "192.168.205.11",
        :memory => "2048",
        :cpu => "2"
    },
    {
        :name => "k8s-master-secure",
        :type => "master",
        :box => "ubuntu/xenial64",
        :box_version => "20180831.0.0",
        :eth1 => "192.168.205.13",
        :memory => "2048",
        :cpu => "2"
    },
    {
        :name => "k8s-worker-1-secure",
        :type => "node",
        :box => "ubuntu/xenial64",
        :box_version => "20180831.0.0",
        :eth1 => "192.168.205.14",
        :memory => "2048",
        :cpu => "2"
    }
]

# Defaults for config options defined in CONFIG
$vm_gui = false

Vagrant.configure("2") do |config|
  
  # always use Vagrants insecure key
  config.ssh.insert_key = false
  
  (servers).each do |server|
  
    config.vm.define server[:name] do |config|

      config.ssh.username = "vagrant"

      config.vm.box = server[:box]
      config.vm.box_version = server[:box_version]
      config.vm.hostname = server[:name]
      config.vm.network :private_network, ip: server[:eth1]

      config.vm.provider :virtualbox do |vb|
        vb.name = server[:name]
        vb.gui = $vm_gui
        vb.memory = server[:memory]
        vb.cpus = server[:cpu]
      end

    end

  end

end
