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
PASSWORD_FILE_PATH='$DATADIR/pass.txt'
BOOTNODE_ENODE='enode://012de7b075bed5bbe2aa83f51a288862795bd835b9c6a3e3ae4ff405a5f3007a782a8d7099d20e20db190091b62fa3981bfe61c5a3293e46602a6c0b7350d564@144.32.196.130:0?discport=30301'

$GETH --datadir "$DATADIR" init "$DATADIR/genesis.json"
$GETH --datadir "$DATADIR" --miner.etherbase "$ACCOUNT" --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --mine --port $PORT --bootnodes '$BOOTNODE_ENODE' --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full" --http --allow-insecure-unlock --miner.gastarget '10000000000'