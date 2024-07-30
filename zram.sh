#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

cd "$SCRIPT_DIR"

RAM_TOTAL=$(./ram-total.sh)

echo "RAM_TOTAL: $RAM_TOTAL";

reserved_ram_10pct=$(echo "scale=0; $RAM_TOTAL * 0.10 / 1" | bc)

RESERVED_RAM=$(echo "$reserved_ram_10pct" | awk '{print ($1 >= 100) ? $1 : 100}')

echo "RESERVED_RAM: $RESERVED_RAM";

ZRAM_SIZE=$(echo "$RAM_TOTAL - $RESERVED_RAM" | bc)

echo "ZRAM_SIZE: $ZRAM_SIZE";

echo "================================================"

if [[ $EUID -ne 0 ]]; then
   echo "** This script must be run as root!" 1>&2
   exit 1
fi

swapoff -a

zramctl --reset /dev/zram0
zramctl --reset /dev/zram1

modprobe zram num_devices=1

zramctl --find --size ${ZRAM_SIZE}M --algorithm lz4

mkswap /dev/zram0
swapon -p 1000 /dev/zram0

dd if=/dev/zero of=/swap bs=1M count=300
mkswap /swap
chmod 0600 /swap
swapon -p 100 /swap

echo "================================================"

free -h
echo
zramctl
echo
swapon -s
