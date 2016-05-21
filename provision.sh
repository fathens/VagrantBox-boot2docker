
# ssh authorized_keys
mkdir ~/.ssh
curl -L https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub > ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
ls -la ~/.ssh

# Add to sudoers
echo 'vagrant' | sudo -S sh -c "echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant"
echo 'vagrant' | sudo -S chmod 0440 /etc/sudoers.d/vagrant

# Instal Docker
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo su -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-precise main' >  /etc/apt/sources.list.d/docker.list"
sudo apt-get update -y
apt-cache policy docker-engine

# sudo apt-get install -y linux-image-generic-lts-trusty
sudo apt-get install -y docker-engine
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker vagrant
