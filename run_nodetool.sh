#!/bin/bash

nodes=`nodetool status | grep UN  | awk '{print $2}'`

for node in $nodes; do
    echo " ******************************* "
    echo "Server : $node "
    echo " "
    nodetool -h $node $1 $2 $3 $4 $5
done
