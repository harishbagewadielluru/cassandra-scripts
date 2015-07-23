#!/bin/bash

inventory=`cat $1`

for node in $inventory; do
    echo " ******************************* "
    echo "Working on Server : $node "
    echo " "
    nodetool -h $node $2 $3 $4 $5
done
