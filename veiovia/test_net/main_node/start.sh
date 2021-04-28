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
PORT=6758
ACCOUNT='0xB335672F896e1a933948800c0DFEe3ECFceF550E'
PASSWORD_FILE_PATH="$DATADIR/pass.txt"
BOOTNODE_ENODE='enode://3967835cb2089e139cc1093b43c6c1effca93571483a74aba290c90648f09d4b7a51fe1154464c8166a52b9a699da8cb665545340bdbee3fbe22fdc5e50e22b1@18.132.98.185:30303'

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH --datadir "$DATADIR" --bootnodes $BOOTNODE_ENODE --miner.etherbase "$ACCOUNT" --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --mine --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full" --miner.gastarget '10000000000'