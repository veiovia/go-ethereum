Variables explanations:

$DATA_DIR :  where all chain data is stored
$BOOT_NODE_KEY_NAME : filepath name of a file (should not exist when generated) with a code needed to identification of a session between nodes
$ACCOUNT : Eth account(Necessary for mining, make sure that this account is allowed to sign)
$PASSWORD_FILE_PATH : filepath to a file with password with which the current eth account was created
$NETWORKID : should be the same across all nodes in the same chain
$GASPRICE : usually should be '1' for testing
$BOOTNODE_ENODE : enode url to a currently running bootnode, should be the same across all nodes (can be found in output of the bootnode, first or second line, looks like this: "enode://1b62bb7d3da20efeb59c91ab200c9c0894eaca3b34417a32692e1b3910117d54aaeb7e54b66011bd1ed185b66109f92bb745f0f24d0e7d0ac9c47e3a767b3225@127.0.0.1:0?discport=8000")
$PORT : a port of node, should be different across all nodes on the same machine


Commands explanation:

geth - Main tool to communicate with BC.
bootnode - a tool, made for easier sync across nodes
puppeth - wizard


Useful Geth & Co commands:

Create Account: geth --datadir "$DATADIR" account new
Init: geth --datadir "$DATADIR" init "$DATADIR/genesis.json"
Create bootnode key: bootnode --genkey "$BOOT_NODE_KEY_NAME"
Start bootnode: bootnode --nodekey "$BOOT_NODE_KEY_NAME"
Run: geth --datadir "$DATADIR" --miner.etherbase "$ACCOUNT" --unlock "$ACCOUNT" --password "$PASSWORD_FILE_PATH" --mine --port $PORT --bootnodes '$BOOTNODE_ENODE' --networkid $NETWORKID --gasprice "$GASPRICE" --syncmode "full"
Attach console to a node: geth attach "$DATADIR/geth.ipc"


Sample flow to run a multinode chain:
N = amount of nodes in the chain.

1) Create a N data dirs
2) Run 'create account' N times for any of data dirs.
3) Copy 'keystore' folder from the data dir and paste it to the rest of the folders (it is needed fo simplicity, even only one different account is enough for each data dir)
4) Run puppeth and enter admin name (actually just a key for you configuration)
5) Select "configure new genesis" and follow question
6) When all done select export genesis
7) After exporting, copy genesis.json to each of the data dirs
8) Run 'init' for each of the data dirs
9) Run 'create bootnode key' to create the key.
10) Run 'start bootnode' with the same key
11) Start the chain execute 'run' command with correct params (Accounts should be different for all nodes)

