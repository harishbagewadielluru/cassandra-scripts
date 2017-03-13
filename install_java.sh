#!/bin/bash

sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm
sudo rpm -Uvh jdk-8u112-linux-x64.rpm
sudo alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_112/jre/bin/java 20000
sudo alternatives --set java /usr/java/jdk1.8.0_112/jre/bin/java
