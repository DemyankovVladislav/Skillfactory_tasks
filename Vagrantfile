Vagrant.configure("2") do |config|
 
  config.vm.box = "centos/7"
#  config.ssh.username = 'vagrant'
#  config.ssh.password = 'vagrant'    
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
   end
   config.vm.synced_folder ".", "/vagrant", disabled: true
   config.vm.define "test" do |test|
   end
   config.vm.provision "shell", inline: <<-SHELL
    sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    ping -c 4 8.8.8.8
    sudo yum install epel-release gcc make readline-devel zlib-devel systemd-devel -y
    sudo useradd -M -d /var/lib/postgresql postgres
    sudo mkdir /var/log/postgresql
    sudo chown -R postgres:postgres /var/log/postgresql
    cd /tmp/ && curl -O https://ftp.postgresql.org/pub/source/v8.4.22/postgresql-8.4.22.tar.gz
    tar xzf postgresql-8.4.22.tar.gz && cd postgresql-8.4.22/
    sudo ./configure --with-systemd --prefix=/opt/postgresql/8.4
    sudo make && sudo make install
    sudo mkdir -p /var/lib/postgresql/8.4/main
    sudo chown -R postgres:postgres /var/lib/postgresql
    sudo su - postgres -c "/opt/postgresql/8.4/bin/initdb -D /var/lib/postgresql/8.4/main"
    sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /var/lib/postgresql/8.4/main/postgresql.conf
    sudo sed -i "s/#port = 5432/port = 5432/g" /var/lib/postgresql/8.4/main/postgresql.conf
    sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
    echo '[Unit]
    Description=PostgreSQL database server
    Documentation=man:postgres(1)

    After=syslog.target

    [Service]
    ExecStart=/bin/sh -c "/opt/postgresql/8.4/bin/pg_ctl -D /var/lib/postgresql/8.4/main/ start"
    ExecStop=/bin/kill -HUP $MAINPID
    Type=forking
    User=postgres
    Group=postgres

    [Install]
    WantedBy=multi-user.target' > postgresql.service
    sudo chown root:root postgresql.service && sudo chmod 751 postgresql.service
    sudo cp postgresql.service /etc/systemd/system/postgresql.service
    sudo cp /opt/postgresql/8.4/bin/psql /usr/bin/psql
    sudo systemctl daemon-reload
    sudo systemctl enable --now postgresql
    sudo systemctl restart sshd
   SHELL
end
