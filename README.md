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
4-consume-from-bufstream.sh
```


TODO:
1. Configure Checkpoint connector to mirror consumer group offsets from source to destination

