#!/bin/bash

KEYSPACES=$1
sudo cp /etc/dse/dse.yaml /etc/dse/dse.yaml.old
sudo sed -i '283s/false/true/' /etc/dse/dse.yaml
sudo sed -i "304s/# included_keyspaces:/included_keyspaces: $KEYSPACES/" /etc/dse/dse.yaml
