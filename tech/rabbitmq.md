# RabbitMQ

## Configuration

Remove `@username` from `NODENAME` if connection fails.

Config path: `/etc/rabbitmq/rabbitmq-env.conf`

```
NODENAME=rabbit
NODE_IP_ADDRESS=0.0.0.0
NODE_PORT=5672
```

## Debugging

List connections:

```bash
$ rabbitmqctl list_connections
```

List queues and message counts:

```bash
 $ rabbitmqctl list_queues
```

List consumers:

```bash
 $ rabbitmqctl list_consumers
```

List exchanges:

```bash
 $ rabbitmqctl list_exchanges
```
