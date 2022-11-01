Vagrant.configure("2") do |config|
 
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20181222.0.0"
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
   end

   config.vm.synced_folder ".", "/vagrant", type: "rsync"
   
   config.vm.define "test" do |test|
   end
   config.vm.provision "shell", inline: <<-SHELL
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa -y && sudo apt update
    sudo apt install python3.8 python3-pip python3-dev libpq-dev -y
    sudo pip3 install Django psycopg2-binary      
   SHELL
end
