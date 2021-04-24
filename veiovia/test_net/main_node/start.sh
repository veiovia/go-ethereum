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
BOOTNODE_ENODE='enode://78e07bee752acc24002d3bd70cc398a369ef845fba7b17955a79b34fb7dfce42c1f09f459d11fa97a35a7f6e25fbb10bb754143755e9ad659c03ad310b824791@3.9.175.11:0?discport=30301'

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH --datadir "$DATADIR" --nat extip:18.133.157.49 --miner.etherbase "$ACCOUNT" --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --mine --bootnodes "$BOOTNODE_ENODE" --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full" --miner.gastarget '10000000000'