cat checkpoint-connector.json | curl -X POST -H 'Content-Type: application/json' localhost:8083/connectors --data-binary @-
