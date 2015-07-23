#!/bin/bash

inventory=`cat $1`

for node in $inventory; do
    echo " ******************************* "
    echo "Working on Server : $node "
    echo " "
    scp $2 $node:$3
done
