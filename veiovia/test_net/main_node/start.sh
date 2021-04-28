#!/bin/bash
set -e

GETH='./../../../build/bin/geth'
BOOTNODE='./../../../build/bin/bootnode'
DATADIR='./datadir'

#Chain setup
NETWORKID=3
BOOT_NODE_KEY_NAME='test-veiovia'
GASPRICE=1

#Miner setup
PORT=6758
ACCOUNT='0xB335672F896e1a933948800c0DFEe3ECFceF550E'
PASSWORD_FILE_PATH="$DATADIR/pass.txt"

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH --datadir "$DATADIR" --nodiscover --miner.etherbase "$ACCOUNT" --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --mine --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full" --miner.gastarget '10000000000'