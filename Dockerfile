FROM openjdk:17-slim

ENV KAFKA_VERSION=3.6.0 \
    SCALA_VERSION=2.13 \
    KAFKA_HOME=/opt/kafka

# Instalar dependencias + descargar Kafka desde archive.apache.org
RUN apt-get update && apt-get install -y curl net-tools dnsutils jq && \
    curl -sL "https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" | tar -xzf - -C /opt && \
    mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka

WORKDIR $KAFKA_HOME

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 9092 2181
ENTRYPOINT ["/start.sh"]
