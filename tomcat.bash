#!/bin/bash
# Purpose           - To Install Apache Tomcat on EC2 server.
# Owner             - Nithin Reddy
# Modification Date - 15/05/2026

set -e

TOMCAT_VERSION="9.0.118"
TOMCAT_DIR="/opt/tomcat"

echo ">>> Updating system packages..."
sudo yum update -y

echo ">>> Installing Java 11..."
sudo yum install java-11-amazon-corretto -y

echo ">>> Downloading Apache Tomcat ${TOMCAT_VERSION}..."
cd /opt
sudo wget "https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
  || { echo "ERROR: Download failed. Check version at https://tomcat.apache.org/download-90.cgi"; exit 1; }

echo ">>> Extracting Tomcat..."
sudo tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz
sudo mv apache-tomcat-${TOMCAT_VERSION} tomcat
sudo rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

echo ">>> Setting permissions..."
sudo chmod +x ${TOMCAT_DIR}/bin/*.sh

echo ">>> Starting Tomcat..."
sudo ${TOMCAT_DIR}/bin/startup.sh

echo ">>> Verifying Tomcat is running..."
sleep 3
if pgrep -f "catalina" > /dev/null; then
    echo "✅ Tomcat ${TOMCAT_VERSION} installed and started successfully!"
    echo "   Access it at: http://<your-ec2-public-ip>:8080"
    echo "   NOTE: Ensure port 8080 is open in your EC2 Security Group."
else
    echo "❌ Tomcat failed to start. Check logs: ${TOMCAT_DIR}/logs/catalina.out"
    exit 1
fi

