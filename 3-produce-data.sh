
docker exec broker sh -c "echo "$RANDOM" |  kafka-console-producer --topic replicate_me --bootstrap-server broker:29092"
