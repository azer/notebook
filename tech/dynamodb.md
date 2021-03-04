# DynamoDB

### Run local daemon

```bash
$ docker run -p 8000:8000 -d amazon/dynamodb-local
```

## CLI

Create a table:

```bash
$ aws dynamodb create-table --table-name books --attribute-definitions AttributeName=id,AttributeType=S AttributeName=author_id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH AttributeName=author_id,KeyType=RANGE --billing-mode PAY_PER_REQUEST --endpoint-url http://localhost:8000
```

List tables:

```bash
$ aws dynamodb list-tables --endpoint-url http://localhost:8000
```

Create a new record:

```bash
$ aws dynamodb put-item --table-name books --item '{"isbn": {"S": "978-0486298238"}, "Title": {"S": "Meditations"},  "author_id":  {"S": "1"}}'  --endpoint-url http://localhost:8000
```

List all records:

```bash
$ aws dynamodb scan --table-name orders_table --endpoint-url http://localhost:8000
```

Get single record:

```bash
$ aws dynamodb get-item --table-name orders_table --key '{"orderId": {"S": "978-0486298238"}}' --endpoint-url http://localhost:8000
```

Filter by a field:

```bash
aws dynamodb scan --table-name books --endpoint-url http://localhost:8000 --filter-expression "author_id = :num" --expression-attribute-values '{ ":num" : { "S": "1" }}'
```
