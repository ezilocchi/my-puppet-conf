cd $HOME

rm -fr my-puppet-conf.log

echo "*** Installing ruby 1.9.3 ***"
apt-get -y install ruby1.9.3 >> my-puppet-conf.log
apt-get -y install ruby1.9.1-dev >> my-puppet-conf.log

echo "*** Installing facter ***"
apt-get -y install facter >> my-puppet-conf.log

#Set puppet 3 repo for the current ubuntu version
#TODO set a script to automatically set the current Linux distribution and version
echo "*** Getting the puppet installer ***"
wget http://apt.puppetlabs.com//puppetlabs-release-saucy.deb #Ubuntu 13.10
dpkg -i puppetlabs-release-saucy.deb #Ubuntu 13.10
rm puppetlabs-release-saucy.deb

echo "*** Installing puppet ***"
apt-get update >> my-puppet-conf.log
apt-get -y install puppet >> my-puppet-conf.log

echo "*** Running puppet ***"
puppet apply --verbose --modulepath=./modules manifests/site.pp || tee -a my-puppet-conf.log
