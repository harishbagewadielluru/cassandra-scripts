#!/bin/bash

mkdir ~/`hostname -i`.diagnostics
mkdir ~/`hostname -i`.diagnostics/conf
mkdir ~/`hostname -i`.diagnostics/cqlsh
mkdir ~/`hostname -i`.diagnostics/dsetool
mkdir ~/`hostname -i`.diagnostics/logs
mkdir ~/`hostname -i`.diagnostics/nodetool
mkdir ~/`hostname -i`.diagnostics/ntp

cp /etc/dse/cassandra/cassandra.yaml ~/`hostname -i`.diagnostics/conf
cp /etc/dse/cassandra/cassandra-env.sh ~/`hostname -i`.diagnostics/conf
cp /etc/dse/dse.yaml ~/`hostname -i`.diagnostics/conf
cp /etc/rc.d/init.d/dse ~/`hostname -i`.diagnostics/conf

cqlsh -e "describe cluster" > ~/`hostname -i`.diagnostics/cqlsh/describe.cluster
cqlsh -e "describe schema" > ~/`hostname -i`.diagnostics/cqlsh/describe.schema

dsetool ring > ~/`hostname -i`.diagnostics/dsetool/ring

cp /var/log/cassandra/system.log mkdir ~/`hostname -i`.diagnostics/logs
cp /var/log/datastax-agent/agent.log mkdir ~/`hostname -i`.diagnostics/logs

nodetool cfstats > ~/`hostname -i`.diagnostics/nodetool/cfstats
nodetool compactionhistory > ~/`hostname -i`.diagnostics/nodetool/compactionhistory
nodetool compactionstats > ~/`hostname -i`.diagnostics/nodetool/compactionstats
nodetool describecluster > ~/`hostname -i`.diagnostics/nodetool/describecluster
nodetool getcompactionthroughput > ~/`hostname -i`.diagnostics/nodetool/getcompactionthroughput
nodetool getstreamthroughput > ~/`hostname -i`.diagnostics/nodetool/getstreamthroughput
nodetool gossipinfo > ~/`hostname -i`.diagnostics/nodetool/gossipinfo
nodetool info > ~/`hostname -i`.diagnostics/nodetool/info
nodetool netstats > ~/`hostname -i`.diagnostics/nodetool/netstats
nodetool proxyhistograms > ~/`hostname -i`.diagnostics/nodetool/proxyhistograms
nodetool ring > ~/`hostname -i`.diagnostics/nodetool/ring
nodetool status > ~/`hostname -i`.diagnostics/nodetool/status
nodetool statusbinary > ~/`hostname -i`.diagnostics/nodetool/statusbinary
nodetool statusthrift > ~/`hostname -i`.diagnostics/nodetool/statusthrift
nodetool tpstats > ~/`hostname -i`.diagnostics/nodetool/tpstats
nodetool version > ~/`hostname -i`.diagnostics/nodetool/version

ntpstat > ~/`hostname -i`.diagnostics/ntp/ntpstat
ntptime > ~/`hostname -i`.diagnostics/ntp/ntptime

tar -zcvf ~/`hostname -i`.tar.gz ~/`hostname -i`.diagnostics
