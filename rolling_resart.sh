#!/bin/bash

inventory=`cat $1`

for node in $inventory; do
    echo " ******************************* "
    echo "Working on Server : $node "
    echo " "
    ssh $node nodetool flush
    ssh -tt -o ConnectTimeout=30 -o BatchMode=yes -o StrictHostKeyChecking=no $node sudo service dse restart
    sleep 120
done
