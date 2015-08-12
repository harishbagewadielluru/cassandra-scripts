#!/bin/bash

sudo cp /etc/dse/cassandra/cassandra-env.sh /etc/dse/cassandra/cassandra-env.sh.old
sudo sed -i "s/jmxremote.authenticate=false/jmxremote.authenticate=true/" /etc/dse/cassandra/cassandra-env.sh
sudo sed -i "/jmxremote.password.file/d" /etc/dse/cassandra/cassandra-env.sh
sudo sed -i '285 a JVM_OPTS="$JVM_OPTS -Dcom.sun.management.jmxremote.password.file=/etc/dse/cassandra/jmxremote.password"' /etc/dse/cassandra/cassandra-env.sh
sudo cp `sudo find / -name jmxremote.password.template | grep "/usr/java"` /etc/dse/cassandra/jmxremote.password
sudo chmod a+w /etc/dse/cassandra/jmxremote.password
sudo echo "cassandra $1" >> /etc/dse/cassandra/jmxremote.password
sudo chown cassandra:cassandra /etc/dse/cassandra/jmxremote.password
sudo chmod 400 /etc/dse/cassandra/jmxremote.password
sudo sed -i '/cassandra/d' `sudo find / -name jmxremote.access | grep "/usr/java"`
sudo sed -i '76 a cassandra readwrite' `sudo find / -name jmxremote.access | grep "/usr/java"`
nodetool flush
sudo service dse restart; tail -f /var/log/cassandra/system.log
