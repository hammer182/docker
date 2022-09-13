$script_docker = <<-SCRIPT
apt-get update && \
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
mkdir -p /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
apt-get update && \
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y && \
apt-get install docker-compose-plugin
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  #Synced Folders
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "./configs", "/configs"
  config.vm.synced_folder "./images", "/images"

  #Docker
  config.vm.define "docker" do |docker|
      #Configuration
      docker.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 2
        vb.name = "docker"
      end
      #Public Network manually assigned
      docker.vm.network "private_network", ip: "192.168.182.11" 
      #Provisioning
      docker.vm.provision "shell", 
        inline: "cp /configs/docker_key /home/vagrant && \ 
                chmod 600 /home/vagrant/docker_key && \
                chown vagrant:vagrant /home/vagrant/docker_key "
      docker.vm.provision "shell", inline: $script_docker
  end

end