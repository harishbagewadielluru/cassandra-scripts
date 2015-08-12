#!/bin/bash

USAGE="Usage: restore.sh keyspace_name snapshot_name"

if [ $# -lt 2 ] ; then
    echo $USAGE
    exit 1;
fi

keyspace=$1
snapshot=$2
file=`ls -l /mnt/cassandra/data/$keyspace/ | awk '{print $9}' | sed '/^$/d'`

echo "Flushing data to disk..."
nodetool flush

echo "Stopping datastax service..."
sudo service dse stop

echo "Deleting commitlog files..."
sudo rm -rf /mnt/cassandra/commitlog/*

echo "Deleting saved_caches files..."
sudo rm -rf /mnt/cassandra/saved_files/*

echo "Deleting data files..."
echo "Total: `ls -l /mnt/cassandra/data/$keyspace/*/*-jb-* | wc -l`"
for cf in $file; do
    echo " ******************************* "
    echo "Working on $cf "
    echo " "
    sudo rm -rf /mnt/cassandra/data/$keyspace/$cf/*-jb-*
done

echo "restoring snapshot files..."
echo "Total: `ls -l /mnt/cassandra/data/$keyspace/*/snapshots/$snapshot/*-jb-* | wc -l`"
for cf in $file; do
    echo " ******************************* "
    echo "Working on $cf "
    echo " "
    sudo cp /mnt/cassandra/data/$keyspace/$cf/snapshots/$snapshot/*-jb-* /mnt/cassandra/data/$keyspace/$cf/
done

echo "Restore complete!"
echo "Total: `ls -l /mnt/cassandra/data/$keyspace/*/*-jb-* | wc -l`"
