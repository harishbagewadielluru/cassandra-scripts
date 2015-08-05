#!/usr/bin/env bash

sudo cp /etc/dse/cassandra/cassandra.yaml .
LISTEN_ADDR=`hostname -i`
RPC_ADDR=`hostname -i`
CLUSTER_NAME=$1
DATA_FILE_DIRECTORIES="\/mnt\/cassandra\/data"
COMMIT_LOG="\/mnt\/cassandra\/commitlog"
SAVED_CACHE="\/mnt\/cassandra\/saved_caches"
SEEDS=$2
ENDPOINT_SNITCH=Ec2Snitch
INTERNODE_ENCRYPTION=all
ENABLED=true
KEYSTORE="\/etc\/dse\/cassandra\/keystore.jks"
KEYSTORE_PASSWORD=$3
PROTOCOL=TLSv1.2
sudo sed -i "s/cluster_name:.*/cluster_name: '$CLUSTER_NAME'/" cassandra.yaml
sudo sed -i "s/data_file_directories:.*/data_file_directories: $DATA_FILE_DIRECTORIES/" cassandra.yaml
sudo sed -i "s/commitlog_directory:.*/commitlog_directory: $COMMIT_LOG/" cassandra.yaml
sudo sed -i "s/saved_caches_directory:.*/saved_caches_directory: $SAVED_CACHE/" cassandra.yaml
sudo sed -i "s/seeds:.*/seeds: '$SEEDS'/" cassandra.yaml
sudo sed -i "s/listen_address:.*/listen_address: $LISTEN_ADDR/" cassandra.yaml
sudo sed -i "s/rpc_address:.*/rpc_address: $RPC_ADDR/" cassandra.yaml
sudo sed -i "s/endpoint_snitch:.*/endpoint_snitch: $ENDPOINT_SNITCH/" cassandra.yaml
sudo sed -i "s/internode_encryption:.*/internode_encryption: $INTERNODE_ENCRYPTION/" cassandra.yaml
sudo sed -i "s/keystore:.*/keystore: $KEYSTORE/" cassandra.yaml
sudo sed -i "s/keystore_password:.*/keystore_password: $KEYSTORE_PASSWORD/" cassandra.yaml
sudo sed -i "s/# protocol:.*/protocol: $PROTOCOL/" cassandra.yaml
sudo sed -i "s/enabled:.*/enabled: $ENABLED/" cassandra.yaml
sudo sed -i "s/# num_tokens: 256/num_tokens: 256/" cassandra.yaml
sudo sed -i "s/initial_token:/#initial_token:/" cassandra.yaml
