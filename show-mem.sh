#!/bin/bash

echo "--------------------------------------------------"

echo "FREE:"

free -h

echo "--------------------------------------------------"

echo "ZRAM:"

sudo zramctl

echo "--------------------------------------------------"

echo "SWAP:"

sudo swapon --show

echo "--------------------------------------------------"

