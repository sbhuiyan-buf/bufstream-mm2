cat connectors.json | curl -X POST -H 'Content-Type: application/json' localhost:8083/connectors --data-binary @-
