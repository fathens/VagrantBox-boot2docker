set -x

# ssh authorized_keys
mkdir ~/.ssh
wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub > ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
ls -la ~/.ssh

# Add to sudoers
echo 'vagrant' | sudo -S sh -c "echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant && chmod 0440 /etc/sudoers.d/vagrant"

# Fix apt lists
sudo rm -rfv /var/lib/apt/lists/*
sudo apt-get update -y

# Instal Docker
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo su -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-precise main' >  /etc/apt/sources.list.d/docker.list"
sudo apt-get update -y

sudo apt-get install -y docker-engine
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker vagrant

# Install VirtualBox Guest Additions
sudo apt-get install -y linux-headers-$(uname -r) build-essential dkms
sudo mount -o loop,ro VBoxGuestAdditions.iso /mnt
sudo /mnt/VBoxLinuxAdditions.run
sudo umount /mnt
