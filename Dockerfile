# Используем официальный образ Alpine
FROM alpine:latest

# Устанавливаем необходимые пакеты
RUN apk add --no-cache curl

# Задаем переменные для версии Node Exporter
ENV NODE_EXPORTER_VERSION=1.6.1

# Скачиваем и устанавливаем Node Exporter
RUN curl -LO https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz && \
    tar xvfz node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz && \
    mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/ && \
    rm -rf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64* 

# Открываем порт 9101
EXPOSE 9101

# Запускаем Node Exporter на порту 9101
CMD ["node_exporter", "--web.listen-address=:9101"]
