#!/bin/sh
docker exec broker sh -c "kafka-topics --create --topic replicate_me --partitions 1 --replication-factor 1 --bootstrap-server localhost:9092"
