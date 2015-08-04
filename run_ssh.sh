#!/bin/bash

# ------------------------------------------------------------------
# Author        : Harish Bagewadi Elluru
# Title         : SSH
# Description   : Running SSH commands in a cluster
# ------------------------------------------------------------------

USAGE="Usage: run_ssh.sh nodes.list <command to execute>"

if [ $# -lt 2 ] ; then
    echo $USAGE
    exit 1;
fi

nodes=`cat $1`

for node in $nodes; do
    echo " ******************************* "
    echo "Working on Server : $node "
    echo " "
    ssh $node $2 $3 $4 $5
done
