#!/bin/bash

for i in `cat $1` ; do nc -vz "$i" 22 ; done
for i in `cat $1` ; do nc -vz "$i" 7001 ; done
for i in `cat $1` ; do nc -vz "$i" 7199 ; done
for i in `cat $1` ; do nc -vz "$i" 9042 ; done
for i in `cat $1` ; do nc -vz "$i" 9160 ; done
for i in `cat $1` ; do nc -vz "$i" 61621 ; done
