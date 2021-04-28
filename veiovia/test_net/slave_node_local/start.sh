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
BOOTNODE_ENODE='enode://3967835cb2089e139cc1093b43c6c1effca93571483a74aba290c90648f09d4b7a51fe1154464c8166a52b9a699da8cb665545340bdbee3fbe22fdc5e50e22b1@3.10.116.247:30303'

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH  --verbosity 6 --datadir "$DATADIR" --bootnodes $BOOTNODE_ENODE --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full" --http --allow-insecure-unlock