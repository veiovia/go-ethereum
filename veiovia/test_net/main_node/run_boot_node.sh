#!/bin/bash
set -e

GETH='./../../../build/bin/geth'
BOOTNODE='./../../../build/bin/bootnode'
DATADIR='./datadir'

#Chain setup
BOOT_NODE_KEY_NAME='test-veiovia'

$BOOTNODE --nodekey "$BOOT_NODE_KEY_NAME" --addr '144.32.196.130:30301'
