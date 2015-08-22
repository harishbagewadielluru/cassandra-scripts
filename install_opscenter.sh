#!/bin/bash

USAGE="Usage: install_opscenter.sh username password version"
if [ $# -lt 3 ] ; then
echo $USAGE
exit 1;
fi

username=$1
password=$2
reponame=datastax
url=http://$username:$password@rpm.datastax.com/enterprise
version=$3
echo "Creating Datastax Repo..."
sudo touch /etc/yum.repos.d/$reponame.repo
sudo chmod a+w /etc/yum.repos.d/$reponame.repo
sudo echo -e "[$reponame]\nbaseurl=${url}\nenabled=1\ngpgcheck=0" > /etc/yum.repos.d/$reponame.repo
sudo chmod 644 /etc/yum.repos.d/$reponame.repo
echo "Installing Opscenter"
sudo yum clean all
sudo yum -y install opscenter-$version
