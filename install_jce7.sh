#!/bin/bash

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip
unzip UnlimitedJCEPolicyJDK7.zip
sudo cp UnlimitedJCEPolicy/*.jar /usr/java/jdk1.7.0_51/jre/lib/security/
