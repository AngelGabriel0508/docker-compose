#!/bin/bash

# Iniciar Zookeeper en segundo plano
$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &

# Esperar a que Zookeeper esté listo
echo "Esperando a Zookeeper..."
while ! nc -z localhost 2181; do   
  sleep 1
done

# Iniciar Kafka
echo "Iniciando Kafka..."
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
