#!/bin/bash

reponame=datastax
url=http://username:password@rpm.datastax.com/enterprise
version=$1
echo "Creating Datastax Repo..."
sudo touch /etc/yum.repos.d/$reponame.repo
sudo chmod a+w /etc/yum.repos.d/$reponame.repo
sudo echo -e "[$reponame]\nbaseurl=${url}\nenabled=1\ngpgcheck=0" > /etc/yum.repos.d/$reponame.repo
sudo chmod 644 /etc/yum.repos.d/$reponame.repo
echo "Installing Datastax Enterprise $version"
sudo yum clean all
sudo yum -y install dse-full-$version
sudo mkdir -p /mnt/cassandra/data
sudo mkdir -p /mnt/cassandra/commitlog
sudo mkdir -p /mnt/cassandra/saved_caches
sudo chown -R cassandra:cassandra /mnt/cassandra/
