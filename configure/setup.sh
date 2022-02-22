#!/bin/bash
# Add localhost to /etc/hosts for sudo usage
echo "127.0.0.1 localhost" > /etc/hosts
# Install java with apt
apt update && DEBIAN_FRONTEND=noninteractive apt install default-jre default-jdk curl -y
# Download app.jar
curl -Lo /app.jar https://github.com/fteychene/prometheus-app-sample/releases/download/0.1.0/prometheus_metric_generator.jar
# Move service file into systemd services
mv /tmp/app.service /etc/systemd/system/app.service
# Enable service at reboot
systemctl daemon-reload
systemctl enable app.service
