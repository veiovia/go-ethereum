#!/bin/bash
set -e

GETH='./../../../build/bin/geth'
BOOTNODE='./../../../build/bin/bootnode'
DATADIR='./datadir'

#Chain setup
NETWORKID=333345
BOOT_NODE_KEY_NAME='test-veiovia'
GASPRICE=1

#Miner setup
ACCOUNT='0xadcc655c25fb90c4afb95a93e1b4ae76325bc7f0'
PASSWORD_FILE_PATH="$DATADIR/pass.txt"

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH --datadir "$DATADIR" --http --nodiscover --nat extip:3.10.116.247 --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full"