cd $HOME

apt-get install ruby1.9.3
apt-get install ruby1.9.1-dev
apt-get install facter

#Set puppet 3 repo for the current ubuntu version
#TODO set a script to automatically set the current Linux distribution and version
wget http://apt.puppetlabs.com//puppetlabs-release-saucy.deb #Ubuntu 13.10
dpkg -i puppetlabs-release-saucy.deb #Ubuntu 13.10
apt-get update

apt-get install puppet

puppet apply --verbose --modulepath=./modules manifests/site.pp
