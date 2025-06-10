# Bufstream and Mirror Maker 2

This directory contains example code for configuring MirrorMaker 2 to copy data from an Confluent Kafka broker (using Kraft) to Bufstream.
It walks through the key tasks for creating a local topic on a source Kafka cluster, creating the MM2 connector, and testing produce to
the source cluster and reading data from the destination cluster. All bufstream data enforcement features are turned off

Take the following steps:

1. Startup docker-compose environment:
```
docker-compose  up -d
```

2. Create source topic called "replicate_me" on broker:9092
```
./1-create-source-topic.sh
```
3. Create MM2 connector to mirror the topic called replicate_me to bufstream:9093
```
./2-submit-connector.sh
```
4. Produce a record to the source topic "replicate_me"
```
./3-produce-data.sh
```
5. Consume all records from the destination topic "source.replicate_me"
```
./4-consume-from-bufstream.sh
```
6. Start checkpoint connector to sync offsets from source to destination cluster (note the group refresh and sync interval is set to 20s here)
```
./5-submit-checkpoint-connector.sh
```
7. Test reading some messages with a test consumer group on the source cluster
```
docker exec connect sh -c "kafka-console-consumer --from-beginning --topic replicate_me --bootstrap-server broker:29092 --group test-group-6 --max-messages 1
```
8. Wait 20s and check that the consumer group is carried over to the destination cluster
```
./list-dest-consumer-groups.sh
```
9. Describe consumer group from step 7
```
docker exec connect sh -c "kafka-consumer-groups --describe --group test-group-6  --bootstrap-server bufstream:9093"
```

