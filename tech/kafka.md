# Kafka 

Sources: 

* [Quickstart](https://kafka.apache.org/quickstart)
* [MSK Developer Guide](https://docs.aws.amazon.com/msk/latest/developerguide/create-topic.html)

## Download

```
$ wget https://archive.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz
$ tar -xzf kafka_2.12-2.2.1.tgz
```

## Server:

Start Zookeeper

```
$ bin/zookeeper-server-start.sh config/zookeeper.properties
```

Start server:

```
$ bin/kafka-server-start.sh config/server.properties
```

## Topics

Create a topic:

```
$ bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test
```

Or pointing to Zookeeper on AWS:

```
$ bin/kafka-topics.sh --^Ceate --zookeeper z-1.kafka-prod.jra9w9.c4.kafka.eu-central-1.amazonaws.com:2181 --replication-factor 3 --partitions 1 --topic
 AWSKafkaTutorialTopic
```

List Topics:

```
$ bin/kafka-topics.sh --list --zookeeper z-1.kafka-prod.jra9w9.c4.kafka.eu-central-1.amazonaws.com:2181
```

# Go Example w/ TLS

producer.go
```go
package main

import (
	"context"
	"crypto/tls"
	"fmt"
	"github.com/segmentio/kafka-go"
	"time"
)

// producer
func main() {
	go reader()

	dialer := &kafka.Dialer{
		Timeout:   10 * time.Second,
		DualStack: true,
		TLS:       &tls.Config{},
	}

	w := kafka.NewWriter(kafka.WriterConfig{
		Brokers: []string{
			"b-1.*****.kafka.eu-central-1.amazonaws.com:9094",
			"b-2.*****.kafka.eu-central-1.amazonaws.com:9094",
			"b-3.*****.kafka.eu-central-1.amazonaws.com:9094",
		},
		Topic:        "Webhooks",
		Balancer:     &kafka.LeastBytes{},
		RequiredAcks: 0,
		Dialer:       dialer,
	})

	fmt.Println("writing...")
	err := w.WriteMessages(context.Background(),
		kafka.Message{
			Key:   []byte("Key-A"),
			Value: []byte("Hello World!"),
		},
		kafka.Message{
			Key:   []byte("Key-B"),
			Value: []byte("One!"),
		},
		kafka.Message{
			Key:   []byte("Key-C"),
			Value: []byte("Two!"),
		},
	)

	if err != nil {
		panic(err)
	}

	fmt.Println("Done!")

	w.Close()
}
```

consumer.go
```go
package main

import (
	"context"
	"crypto/tls"
	"fmt"
	"github.com/segmentio/kafka-go"
	"time"
)


func main() {
	dialer := &kafka.Dialer{
		Timeout:   10 * time.Second,
		DualStack: true,
		TLS:       &tls.Config{},
	}

	r := kafka.NewReader(kafka.ReaderConfig{
		Brokers: []string{
			"b-1.*****.kafka.eu-central-1.amazonaws.com:9094",
			"b-2.*****.kafka.eu-central-1.amazonaws.com:9094",
			"b-3.*****.kafka.eu-central-1.amazonaws.com:9094",
		},
		Topic:  "Webhooks",
		Dialer: dialer,
	})

	fmt.Println("reading")

	for {
		m, err := r.ReadMessage(context.Background())
		if err != nil {
			break
		}
		fmt.Printf("message at offset %d: %s = %s\n", m.Offset, string(m.Key), string(m.Value))
	}

	fmt.Println("reading closed")

	r.Close()

}
```
