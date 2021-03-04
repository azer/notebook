# Cassandra

## Setup

Pull and run as a Docker instance:

```bash
$ docker pull cassandra
$ docker run --name cassandra -p 127.0.0.1:9042:9042 -p 127.0.0.1:9160:9160  -d cassandra:latest
```

Run commands inside the container:

```bash
$ docker exec -it cassandra bash
```

Logs

```bash
$ docker logs some-cassandra
```

## First Steps

```bash
$ docker exec -it cassandra bash
root@:/# cqlsh
cqlsh >
```

Create a namespace that will store the tables;

```cql
> CREATE KEYSPACE mydb WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
> use mydb;
```

Create a table;
```cql
mydb> CREATE TABLE books (id int PRIMARY KEY, title text, year text);
```

Describe a table;

```cql
mydb> DESC books;

CREATE TABLE mydb.books (
    id int PRIMARY KEY,
    title text,
    year text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

mydb>
```

## Primary Keys

There are two parts to a PRIMARY KEY in Cassandra:

* partition key(s)
* clustering key(s)

```cql
PRIMARY KEY (partitionKey1,clusteringKey1,clusteringKey2)
```

or

```cql
PRIMARY KEY ((partitionKey1,partitionKey2),clusteringKey1,clusteringKey2)
```

Some notes on this:

* The partition key determines which node(s) your data is stored on. The clustering key determines the order of the data within your partition key.
* The recommended maximum size of rows inside of a partition is 200k.
* Cassandra achieves performance by using the clustering keys to sort your data on-disk, thereby only returning ordered rows in a single read (no random reads).
* `ORDER BY` is only supported when the partition key is restricted by an `EQ` or an `IN`.

## Example Go Program

Bootstrap a new Go Project:

```bash
$ mkdir example-cassandra-project
$ cd example-cassandra-project
$ go mod init github.com/username/example-cassandra-project
```

Setup a new database:

```bash
$ cqlsh
> create keyspace example with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
> use example
example> create table example.tweet(timeline text, id UUID, text text, PRIMARY KEY(id));
example> create index on example.tweet(timeline);
```

Create `main.go` file:

```go
package main

import (
	"fmt"
	"github.com/gocql/gocql"
	"log"
)

func main() {
	// connect to the cluster
	cluster := gocql.NewCluster("127.0.0.1")
	cluster.Keyspace = "example"
	cluster.Consistency = gocql.Quorum
	session, err := cluster.CreateSession()
	if err != nil {
		panic(err)
	}

	defer session.Close()

	// insert a tweet
	if err := session.Query(`INSERT INTO tweet (timeline, id, text) VALUES (?, ?, ?)`, "me", gocql.TimeUUID(), "hello world").Exec(); err != nil {
		log.Fatal(err)
	}

	var id gocql.UUID
	var text string

	/* Search for a specific set of records whose 'timeline' column matches
	 * the value 'me'. The secondary index that we created earlier will be
	 * used for optimizing the search */
	if err := session.Query(`SELECT id, text FROM tweet WHERE timeline = ? LIMIT 1`,
		"me").Consistency(gocql.One).Scan(&id, &text); err != nil {
		log.Fatal(err)
	}
	fmt.Println("Tweet:", id, text)

	// list all tweets
	iter := session.Query(`SELECT id, text FROM tweet WHERE timeline = ?`, "me").Iter()
	for iter.Scan(&id, &text) {
		fmt.Println("Tweet:", id, text)
	}
	if err := iter.Close(); err != nil {
		log.Fatal(err)
	}
}
```
