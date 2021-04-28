#!/bin/bash
set -e

GETH='./../../../build/bin/geth'
BOOTNODE='./../../../build/bin/bootnode'
DATADIR='./datadir'

#Chain setup
BOOT_NODE_KEY_NAME='test-veiovia'

#$BOOTNODE --nodekey "$BOOT_NODE_KEY_NAME" --verbosity 6 --addr '172.31.19.209:30301'
$BOOTNODE --nodekey "$BOOT_NODE_KEY_NAME" --verbosity 9
