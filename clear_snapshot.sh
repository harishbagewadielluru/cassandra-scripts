#!/bin/bash

inventory=`cat $1`

for file in $inventory; do
    echo " ******************************* "
    echo "Working on file : $file "
    echo " "
    nodetool clearsnapshot $2 -t $file
done

