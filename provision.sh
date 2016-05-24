set -x

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
