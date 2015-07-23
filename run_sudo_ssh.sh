#!/bin/bash

inventory=`cat $1`

for node in $inventory; do
    echo " ******************************* "
    echo "Working on Server : $node "
    echo " "
    ssh -tt -o ConnectTimeout=30 -o BatchMode=yes -o StrictHostKeyChecking=no $node sudo $2 $3 $4 $5 $6 $7 $8 $9
done
