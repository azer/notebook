# Blockchain

Index of Contents:

* [Building Blockchain in Go](#building-blockchain-in-go)
  * [Block](#block)
  * [Blockchain](#blockchain)
  * [Proof of Work](#proof-of-work)
  * [Database](#database)
    * [Serialization](#serialization)
    * [Persistence](#persistence)
    * [CLI](#cli)
  * [Transactions](#transactions)
    * [Coinbase](#coinbase)
    * [Transactions](#transactions)
    * [Proof of Work](#proof-of-work)
    * [Unspent Transaction Outputs](#unspent-transaction-outputs)
    * [Sending Coins](#sending-coins)
  * [Addresses](#addresses)


## Building Blockchain in Go

I went through [Building Blockchain in Go](https://jeiwan.cc/posts/building-blockchain-in-go-part-1/) and
took some notes. This is like a simplified rewrote with my own words.

### Block

Every block stores the valuable information such as transactions, its version, timestamp, etc.


```go
type Block struct {
	Timestamp     int64
	Data          []byte
	PrevBlockHash []byte
	Hash          []byte
}
```

* `Timestamp`: Current timestamp
* `Data`: Valuable information stored in the block
* `Hash`: Hash of the block
* `PrevBlockHash`: Hash of the previous block

**Hash**

Calculating hashes are computationally difficult so make adding blocks difficult.

In this example, we'll keep things simple and just calculate sha256 hash on the concatenated combination.

```go
func (block *Block) SetHash() {
	timestamp := []byte(strconv.FormatInt(b.Timestamp, 10))
	headers := bytes.Join([][]byte{b.PrevBlockHash, b.Data, timestamp}, []byte{})
	hash := sha256.Sum256(headers)
	b.Hash = hash[:]
}
```

### Blockchain

A blockchain is an ordered back-linked list. Blocks are stored in the insertion order,
each block is linked to the previous one.

```go
type Blockchain struct {
	Blocks []*Block
}

func (bc *Blockchain) AddBlock(data strins initially published by Satoshi Nakamoto and which is currently a reference implementation of Bitcoin, uses LevelDB (although it was introduced to the cg) {
	prevBlock := bc.blocks[len(bc.blocks)-1]
	newBlock := NewBlock(data, prevBlock.Hash)
	bc.blocks = append(bc.blocks, newBlock)
}
```

### Proof-of-work

Requirement of performing hard work to put data makes the blockchain
more secure and consistent. A reward is paid for this hard work,
so people get paid for it (a.k.a mining). This mechanism is called
"proof-of-work" and it relies on hard & slow work, fast & easy proof verification.

#### Hashing

A hash is a unique representation of the data it was calculated on.

* Original data can not be restored from a hash.
* Certain data can have only one hash and the hash is unique.
* Changing even one byte in the input data will result in a completely different hash.

[Hashcash](https://en.wikipedia.org/wiki/Hashcash) -the proof-of-work algorithm Bitcoin uses- works
as explained in following steps;

* Take block headers
* Add counter
* Get combination of data and counter
* Check if the hash meets certain requirements;
  * If it does, done
  * If it doesn't, increase the counter and repeat steps 3 and 4


##### Implementation

`TargetBits` is the block header that stores the difficulty level at which block was mined.
For now, we'll skip implementing a target adjusting algorithm and just define the difficulty
as a global constant;

```go
const TargetBits = 24

func NewProofOfWork(block *Block) *ProofOfWork {
	target := big.NewInt(1)
	target.Lsh(target, uint(256-TargetBits))

	pow := &ProofOfWork{block, target}

	return pow
}
```

We initialize `big.Int` with the value of 1 and shift it left by `256 - TargetBits`.
256 is the length of a SHA-256 hash in bits, and we'll convert a hash to big integer
check if it's less than the target.

Hexadecimal representation of the target we defined:

```go
0x10000000000000000000000000000000000000000000000000000000000
```

Comparing the hashes of `I like donuts` and `I like donutsca07ca`
gives us more clear idea about how this method works; if a hash is lower
than the boudnery it's valid. Lowering the boundary makes the work more difficult.

```go
0fac49161af82ed938add1d8725835cc123a1a87b1b196488360e58d4bfb51e3
0000010000000000000000000000000000000000000000000000000000000000
0000008b0f41ec78bab747864db66bcb9fb89920ee75f43fdaaeb5544f7f76ca
```

Now we create a `Data` method that returns merge of block fields with the `target`
and `nonce`. Nonce is the counter explained before. It's a cryptographic term.

```go
func (pow *ProofOfWork) Data(nonce int) []byte {
	return bytes.Join([][]byte{
		pow.Block.PrevBlockHash,
		pow.Block.Data,
		IntToHex(pow.Block.Timestamp),
		IntToHex(int64(TargetBits)),
		IntToHex(int64(nonce)),
	}, []byte{})
}
```

Now we're ready for mining by;
* Generating data via `Data` method
* Hashing the data with SHA-256
* Converting has to a big integer
* Comparing the integer with the target.

```go
func (pow *ProofOfWork) Run(int, []byte) {
	var (
		hashInt big.Int
		hash    [32]byte
	)

	fmt.Println("Mining the block containing '%s'", pow.Block.Data)

	nonce := 0
	for nonce < MaxNonce {
		data := pow.Data(nonce)
		hash = sha256.Sum256(data)
		fmt.Printf("\r%x", hash)
		hashInt.SetBytes(hash[:])

		if hashInt.Cmp(pow.Target) == -1 {
			break
		} else {
			nonce++
		}
	}

	fmt.Printf("\n\n")
	return nonce, hash[:]
}
```

Finally, add a `Validate` method so we can validate the work in the future;

```go
func (pow *ProofOfWork) Validate() bool {
	var hashInt big.Int

	data := pow.Data(pow.Block.Nonce)
	hash := sha256.Sum256(data)
	hashInt.SetBytes(hash[:])

	return hashInt.Cmp(pow.target) == -1
}
```

Now we can remove the `SetHash` method of the block and make it require mining;

```go
func NewBlock(data string, prevBlockHash []byte) *Block {
    block := &Block{
		Timestamp:     time.Now().UnixNano(),
		Data:          []byte(data),
		PrevBlockHash: prevBlockHash,
		Hash:          []byte{},
		Nonce:         0,
	}

	pow := NewProofOfWork(block)
	nonce, hash := pow.Run()

	block.Hash = hash[:]
	block.Nonce = nonce

    return block
}
```

Finally, add these two lines into the main program so we can check if each block is valid;

```go
for _, block := range bc.Blocks {
  // ...
  pow := NewProofOfWork(block)
  fmt.Printf("PoW: %s\n", strconv.FormatBool(pow.Validate()))
}
```

Each time we run the program, now we'll mine blocks and add them to the blockchain.
It won't be persistent though, because we haven't used a database yet.

## Database

We'll use [BoltDB](https://github.com/boltdb/bolt) for storage. Original Bitcoin uses two `buckets` to store data:

* `blocks`: metadata describing the blocks in a chain.
* `chainstate`: state of a chain, all currently unspent transaction outputs and some metadata.

`blocks` bucket structure:

| Prefix | Key                                        | Value                                                 |
| ---    | ---                                        | ---                                                   |
| b      | 32-byte block hash                         | block index record                                    |
| f      | 4-byte file number                         | file information record                               |
| l      | 4-byte file number                         | the last block file number                            |
| R      | 1-byte boolean                             | whether we're reindexing                              |
| F      | 1-byte flag name length + flag name string | 1 byte boolean that sets if the flag can be on or off |
| t      | 32-byte transaction hash                   | transaction index record                              |

The `chainstate` bucket structure:

| Prefix | Key                      | Value                             |
| ---    | ---                      | ---                               |
| c      | 32-byte transaction hash | unspent transaction output record |
| B      | 32-byte block hash       | the block hash up to which the database represents the unspent transaction outputs |

We'll start with only `blocks` budget as we haven't implemented transactions yet. We won't also need file numbers because the database will be
a single file. Here is how our `blocks` bucket structure looks like;

| Prefix | Key                | Value                          |
| ---    | ---                | ---                            |
|        | 32-byte block hash | Serialized block structure     |
|        | l                  | the hash of the last block in a chain |

### Serialization

We'll add `Serialize` and `Deserialize` methods the block as they'll be stored as `[]byte` in the database;

```go
func (block *Block) Serialize() ([]byte, error) {
	var result bytes.Buffer

	encoder := gob.NewEncoder(&result)
	if err := encoder.Encode(block); err != nil {
		return nil, err
	}

	return result.Bytes(), nil
}

func DeserializeBlock(raw []byte) (*Block, error) {
	var block Block

	decoder := gob.NewDecoder(bytes.NewReader(raw))
	if err := decoder.Decode(&block); err != nil {
		return nil, err
	}

	return &block, nil
}
```

### Persistence

We'll start by modifying `NewBlockchain` to;

* Open the database
* Check if there is blocks already
* If there is, set the `tip` as the hash of the last block
* If there isn't, create a genesis block and set the `tip` as the hash of the genesis block.

```go
func NewBlockchain() *Blockchain {
	var tip []byte
	db, err := bolt.Open(dbFile, 0600, nil)

	err = db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(blocksBucket))

		if b == nil {
			genesis := NewGenesisBlock()
			b, err := tx.CreateBucket([]byte(blocksBucket))
			err = b.Put(genesis.Hash, genesis.Serialize())
			err = b.Put([]byte("l"), genesis.Hash)
			tip = genesis.Hash
		} else {
			tip = b.Get([]byte("l"))
		}

		return nil
	})

	bc := Blockchain{tip, db}

	return &bc
}
```

As we store the blocks in database now, `Blockchain` struct looks like this;

```go
type Blockchain struct {
	tip []byte
	db  *bolt.DB
}
```

So, now we're adding blocks to database, not an array. Let's modify `AddBlock` method;

```go
func (bc *Blockchain) AddBlock(data string) {
	var lastHash []byte

	err := bc.db.View(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(blocksBucket))
		lastHash = b.Get([]byte("l"))

		return nil
	})

	newBlock := NewBlock(data, lastHash)

	err = bc.db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(blocksBucket))
		err := b.Put(newBlock.Hash, newBlock.Serialize())
		err = b.Put([]byte("l"), newBlock.Hash)
		bc.tip = newBlock.Hash

		return nil
	})
}
```

How we'll iterate the blockchain though? Using `BlockchainIterator`:

```go
type BlockchainIterator struct {
	currentHash []byte
	db          *bolt.DB
}

// Make it easier to create iterators from Blockchain objects
func (bc *Blockchain) Iterator() *BlockchainIterator {
	bci := &BlockchainIterator{bc.tip, bc.db}

	return bci
}

func (i *BlockchainIterator) Next() *Block {
	var block *Block

	err := i.db.View(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(blocksBucket))
		encodedBlock := b.Get(i.currentHash)
		block = DeserializeBlock(encodedBlock)

		return nil
	})

	i.currentHash = block.PrevBlockHash

	return block
}
```

### CLI

So far we don't have an interface users can interact. Let's make one for command-line, with two available commands good enough for beginning;

* addblock
* printchain

```go
type CLI struct {
	bc *Blockchain
}

func (cli *CLI) Run() {
	cli.validateArgs()

	addBlockCmd := flag.NewFlagSet("addblock", flag.ExitOnError)
	printChainCmd := flag.NewFlagSet("printchain", flag.ExitOnError)

	addBlockData := addBlockCmd.String("data", "", "Block data")

	switch os.Args[1] {
	case "addblock":
		err := addBlockCmd.Parse(os.Args[2:])
	case "printchain":
		err := printChainCmd.Parse(os.Args[2:])
	default:
		cli.printUsage()
		os.Exit(1)
	}

	if addBlockCmd.Parsed() {
		if *addBlockData == "" {
			addBlockCmd.Usage()
			os.Exit(1)
		}
		cli.addBlock(*addBlockData)
	}

	if printChainCmd.Parsed() {
		cli.printChain()
	}
}

func (cli *CLI) addBlock(data string) {
	cli.bc.AddBlock(data)
	fmt.Println("Success!")
}

func (cli *CLI) printChain() {
	bci := cli.bc.Iterator()

	for {
		block := bci.Next()

		fmt.Printf("Prev. hash: %x\n", block.PrevBlockHash)
		fmt.Printf("Data: %s\n", block.Data)
		fmt.Printf("Hash: %x\n", block.Hash)
		pow := NewProofOfWork(block)
		fmt.Printf("PoW: %s\n", strconv.FormatBool(pow.Validate()))
		fmt.Println()

		if len(block.PrevBlockHash) == 0 {
			break
		}
	}
}
```

Now let's modify the main program to use CLI interface;

```go
func main() {
	bc := NewBlockchain()
	defer bc.db.Close()

	cli := CLI{bc}
	cli.Run()
}
```

## Transactions

### Implementation

A transaction is combination of inputs and outputs. They lock values with a script,
which can be onlucked by only by the one who locked them.

```go
type Transaction struct {
	ID   []byte
	Vin  []TXInput
	Vout []TXOutput
}
```

Outputs store the Satoshis in their `Value` field, locking them with a puzzle stored in `ScriptPubKey`.
Internally Bitcoin uses the `Script` language to define outputs locking and unlocking logic.
`ScriptPubKey` stores the wallet address defined by user.

```go
type TXOutput struct {
	Value        int
	ScriptPubKey string
}
```

Every output is *indivisible*, we can't reference a part of its value.
Transactions spent the whole in output. If the value is greater than required,
a change is generated and sent back to the sender.

```go
type TXInput struct {
	TxId      []byte
	Vout      int
	ScriptSig string
}
```

Input stores transaction id in the `TxId` field, output index in the `Vout` field.
`ScriptSig` provides data to be used in an output's `ScriptPubKey`. If the data is correct,
the output can be unlocked. This is how we guarantee a user can not spend other people's belongings.

Every new transaction must have at least one input and output. Output stores the "coins",
input refrences an output from previous transaction and provides data for unlocking and creating
new outputs.

### Coinbase

Coinbase is a special transaction type which creates outputs ("coins") without requiring previous outputs.

```go
func NewCoinbaseTX(to, data string) *Transaction {
	if data == "" {
		data = fmt.Sprintf("Reward to '%s'", to)
	}

	txin := TXInput{[]byte{}, -1, data}
	txout := TXOutput{subsidy, to}
	tx := Transaction{nil, []TXInput{txin}, []TXOutput{txout}}
	tx.SetID()

	return &tx
}
```

### Transactions

Every block must store at least one transaction;

```go
type Block struct {
	Timestamp     int64
	Transactions  []*Transaction
	PrevBlockHash []byte
	Hash          []byte
	Nonce         int
}
```

`NewBlock` and `NewGenesisBlock` should be also changed accordingly. Now `CreateBlockchain` takes an address
and reward it for mining genesis block.

```go
func NewBlock(transactions []*Transaction, prevBlockHash []byte) *Block {
	block := &Block{time.Now().Unix(), transactions, prevBlockHash, []byte{}, 0}
	...
}

func NewGenesisBlock(coinbase *Transaction) *Block {
	return NewBlock([]*Transaction{coinbase}, []byte{})
}

func CreateBlockchain(address string) *Blockchain {
	...
	err = db.Update(func(tx *bolt.Tx) error {
		cbtx := NewCoinbaseTX(address, genesisCoinbaseData)
		genesis := NewGenesisBlock(cbtx)

		b, err := tx.CreateBucket([]byte(blocksBucket))
		err = b.Put(genesis.Hash, genesis.Serialize())
		...
	})
	...
}
```

### Proof of Work

As we replaced `Data` field with `Transactions`, we'll first add a method to create a hash of
all transactions, then change the `prepareData` method to include the transactions hash;

```go
func (b *Block) HashTransactions() []byte {
	var txHashes [][]byte
	var txHash [32]byte

	for _, tx := range b.Transactions {
		txHashes = append(txHashes, tx.ID)
	}
	txHash = sha256.Sum256(bytes.Join(txHashes, []byte{}))

	return txHash[:]
}

func (b *Block) HashTransactions() []byte {
	var txHashes [][]byte
	var txHash [32]byte

	for _, tx := range b.Transactions {
		txHashes = append(txHashes, tx.ID)
	}
	txHash = sha256.Sum256(bytes.Join(txHashes, []byte{}))

	return txHash[:]
}
```

Bitcoin uses a more elaborate technique: it represents all transactions containing in a block as a Merkle tree and uses the root hash of the tree in the Proof-of-Work system. This approach allows to quickly check if a block contains certain transaction, having only just the root hash and without downloading all the transactions.

### Unspent Transaction Outputs

The balance for a wallet is all unspent transaction outputs. *Unspent* means that these outputs
weren't referened in any inputs.

In the diagram below;

* tx0, output 1;
* tx1, output 0;
* tx3, output 0;
* tx4, output 0.

![](https://jeiwan.cc/images/transactions-diagram.png)

To find all unspent transactions, we need to;

* Iterate all the blocks
* Iterate all transactions in the block
* Collect all transaction inputs in `spentTXOs`
* Iterate all outputs in the transaction
* Check if the output was spent
* If it wasn't, add the output to `unspentTXs`

```go
func (bc *Blockchain) FindUnspentTransactions(address string) []Transaction {
  var unspentTXs []Transaction
  spentTXOs := make(map[string][]int)
  bci := bc.Iterator()

  for {
    block := bci.Next()

    for _, tx := range block.Transactions {
      txID := hex.EncodeToString(tx.ID)

    Outputs:
      for outIdx, out := range tx.Vout {
        // Was the output spent?
        if spentTXOs[txID] != nil {
          for _, spentOut := range spentTXOs[txID] {
            if spentOut == outIdx {
              continue Outputs
            }
          }
        }

        if out.CanBeUnlockedWith(address) {
          unspentTXs = append(unspentTXs, *tx)
        }
      }

      if tx.IsCoinbase() == false {
        for _, in := range tx.Vin {
          if in.CanUnlockOutputWith(address) {
            inTxID := hex.EncodeToString(in.Txid)
            spentTXOs[inTxID] = append(spentTXOs[inTxID], in.Vout)
          }
        }
      }
    }

    if len(block.PrevBlockHash) == 0 {
      break
    }
  }

  return unspentTXs
}

func (bc *Blockchain) FindUTXO(address string) []TXOutput {
       var UTXOs []TXOutput
       unspentTransactions := bc.FindUnspentTransactions(address)

       for _, tx := range unspentTransactions {
               for _, out := range tx.Vout {
                       if out.CanBeUnlockedWith(address) {
                               UTXOs = append(UTXOs, out)
                       }
               }
       }

       return UTXOs
}
```

Now we create the balance method that sums values of all unspent outputs locked by the account address;

```go
func (bc *Blockchain) FindUTXO(address string) []TXOutput {
       var UTXOs []TXOutput
       unspentTransactions := bc.FindUnspentTransactions(address)

       for _, tx := range unspentTransactions {
               for _, out := range tx.Vout {
                       if out.CanBeUnlockedWith(address) {
                               UTXOs = append(UTXOs, out)
                       }
               }
       }

       return UTXOs
}
```

### Sending Coins

Steps to send coin to someone else;

* Create a new transaction
* Put the transaction in a block
* Mine the block immediately.

```go
func NewUTXOTransaction(from, to string, amount int, bc *Blockchain) *Transaction {
	var inputs []TXInput
	var outputs []TXOutput

	acc, validOutputs := bc.FindSpendableOutputs(from, amount)

	if acc < amount {
		log.Panic("ERROR: Not enough funds")
	}

	// Build a list of inputs
	for txid, outs := range validOutputs {
		txID, err := hex.DecodeString(txid)

		for _, out := range outs {
			input := TXInput{txID, out, from}
			inputs = append(inputs, input)
		}
	}

	// Build a list of outputs
	outputs = append(outputs, TXOutput{amount, to})
	if acc > amount {
		outputs = append(outputs, TXOutput{acc - amount, from}) // a change
	}

	tx := Transaction{nil, inputs, outputs}
	tx.SetID()

	return &tx
}

func (cli *CLI) send(from, to string, amount int) {
	bc := NewBlockchain(from)
	defer bc.db.Close()

	tx := NewUTXOTransaction(from, to, amount, bc)
	bc.MineBlock([]*Transaction{tx})
	fmt.Println("Success!")
}
```

In Bitcoin, blocks are not mined immediately though. Instead;
* Transactions are put into a memory pool
* Miners take all transactions from the mempool and creates a candidate block
* Transactions become confirmed when a block containing them is mined and added to the blockchain.

## Addresses
