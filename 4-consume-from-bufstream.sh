docker exec connect sh -c "kafka-console-consumer --from-beginning --topic source.replicate_me --bootstrap-server bufstream:9093"
