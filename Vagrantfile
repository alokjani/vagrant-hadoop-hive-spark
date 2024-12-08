# Vagrantfile for Apache Bigtop Hadoop Lab

Vagrant.configure("2") do |config|
  # Use Ubuntu 22.04 LTS
  config.vm.box = "ubuntu/jammy64"
  
  # VM Configuration
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096  # 4GB RAM
    vb.cpus = 4       # 4 CPU cores
  end

  # Hostname and network configuration
  config.vm.hostname = "bigtop-hadoop-node"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 50070, host: 50070  # NameNode Web UI
  config.vm.network "forwarded_port", guest: 8088, host: 8088    # YARN ResourceManager Web UI
  config.vm.network "forwarded_port", guest: 19888, host: 19888  # JobHistoryServer Web UI

  # Provisioning script
  config.vm.provision "shell", path: "provision_bigtop.sh", privileged: true

  # Post-installation test script
  config.vm.provision "shell", path: "bigtop_test_script.sh", privileged: false
  
end
