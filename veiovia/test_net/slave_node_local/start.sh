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
BOOTNODE_ENODE='enode://5b668de7caf270fa4e38ab05936deef2bdc4825cd6bf572dd4b3c3fdc14bc617265238e21178cc72f6d774ea508cb0d239ce8571694f770da9ceb60e44439b76@18.132.98.185:6758'

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH --datadir "$DATADIR" --bootnodes "$BOOTNODE_ENODE" --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full" --http --allow-insecure-unlock