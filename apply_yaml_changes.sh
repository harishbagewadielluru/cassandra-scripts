#!/bin/bash

sudo cp /etc/dse/cassandra/cassandra.yaml /etc/dse/cassandra/cassandra.yaml.old
sudo sed -i "s/compaction_throughput_mb_per_sec:.*/compaction_throughput_mb_per_sec: 0/" /etc/dse/cassandra/cassandra.yaml
sudo sed -i "s/.*memtable_total_space_in_mb:.*/memtable_total_space_in_mb: 4096/" /etc/dse/cassandra/cassandra.yaml
sudo sed -i "s/.*commitlog_total_space_in_mb:.*/commitlog_total_space_in_mb: 3072/" /etc/dse/cassandra/cassandra.yaml
sudo sed -i "s/.*concurrent_compactors:.*/concurrent_compactors: 4/" /etc/dse/cassandra/cassandra.yaml
