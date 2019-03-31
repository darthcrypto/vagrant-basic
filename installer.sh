#install docker
#yum install wget -y
#wget https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-18.06.0.ce-3.el7.x86_64.rpm --no-check-certificate -O /tmp/docker-ce-18.06.0.ce-3.el7.x86_64.rpm
#yum install /tmp/docker-ce-18.06.0.ce-3.el7.x86_64.rpm -y
#rm -rf /tmp/docker-ce-18.06.0.ce-3.el7.x86_64.rpm
#systemctl enable docker
#systemctl start docker
 
 
#nexus authentication for docker registry
#cat > /etc/docker/daemon.json <<EOF
#{
#  "insecure-registries": [
#    "10.10.10.10:8888",
#    "10.10.10.10.8888"
#  ]
#}
#EOF
 
#systemctl restart docker
 
#docker login 10.10.10.10:8888 -u developer -p developer
#docker login 10.10.10.10:8888 -u developer -p developer
 
#directory for portainer data
#mkdir -p /opt/portainer/data
 
#install containers
#docker pull portainer/portainer
#docker pull rabbitmq:3-management
#docker run -d --hostname my-rabbit --restart=always --name rabbitmq -p 15672:15672 -p 4369:4369 -p 5671:5671 -p 5672:5672 -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest rabbitmq:3-management
#docker pull postgres
#docker run --name postgres --restart=always -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres
#echo -n password > /tmp/portainer_password
#docker volume create portainer_data
#docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -v /tmp/portainer_password:/tmp/portainer_password portainer/portainer --admin-password-file /tmp/portainer_password
#docker pull sonarqube
#docker run -d --name sonarqube --restart always -p 9001:9000 -p 9092:9092 sonarqube
 
#vagrantkey
useradd vagrant
mkdir -p /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh
 
#setup guest additions
#mount -o loop -t iso9660 /root/VBoxGuestAdditions_5.2.16.iso /mnt
yum install epel-release -y
sed -i 's/https/http/g' /etc/yum.repos.d/epel.repo
#yum install gcc kernel-devel kernel-headers dkms make bzip2 perl kernel-devel-3.10.0-862.el7.x86_64 -y
#KERN_DIR=/usr/src/kernels/3.10.0-862.3.2.el7.x86_64/include/config/build
#export $KERN_DIR
#/mnt/VBoxLinuxAdditions.run
 
#install docker-compose
#sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose --insecure
#sudo chmod +x /usr/bin/docker-compose
 
#install developer tools
#sudo yum install java-1.8.0-openjdk -y
#sudo sh -c "echo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64 >> /etc/environment"
#source /etc/environment
#sudo yum install git -y
#sudo yum install maven -y   
 
#install node
#wget https://nodejs.org/dist/v8.11.3/node-v8.11.3-linux-x64.tar.xz -O /usr/local/bin/node-v8.11.3-linux-x64.tar.xz --no-check-certificate
#tar xvf /usr/local/bin/node-v8.11.3-linux-x64.tar.xz -C /usr/local/bin
#rm -rf /usr/local/bin/node-v8.11.3-linux-x64.tar.xz
 
#remove maven settings, provisioner will replace it
#rm -rf /etc/maven/settings.xml
 
#add maven certs to java keystore
#keytool -v -alias mavensrv -import -file /tmp/repomavenapacheorg.crt -keystore /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre/lib/security/cacerts -storepass changeit -noprompt
 
 
#statically assign ip address
bootproto="none"
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "IPADDR=192.168.56.101" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
echo "PREFIX=24" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sed -i -e "s/BOOTPROTO.*/BOOTPROTO=${bootproto}/g" /etc/sysconfig/network-scripts/ifcfg-enp0s8
systemctl restart network
