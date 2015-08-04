#!/bin/bash

# ------------------------------------------------------------------
# Author        : Harish Bagewadi Elluru
# Title         : SUDO SSH
# Description   : Running SUDO SSH commands in a cluster
# ------------------------------------------------------------------

USAGE="Usage: run_sudo_ssh.sh nodes.list <command to execute>"

if [ $# -lt 2 ] ; then
    echo $USAGE
    exit 1;
fi

nodes=`cat $1`

for node in $nodes; do
    echo " ******************************* "
    echo "Working on Server : $node "
    echo " "
    ssh -tt -o ConnectTimeout=30 -o BatchMode=yes -o StrictHostKeyChecking=no $node sudo $2 $3 $4 $5 $6 $7 $8 $9
done
