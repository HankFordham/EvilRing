#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl jq python3

# Install ngrok
NGROK_VERSION=$(curl -s https://api.github.com/repos/inconshreveable/ngrok/releases/latest | jq -r '.tag_name')
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xzvf ngrok-v3-stable-linux-amd64.tgz
chmod +x ngrok
sudo mv ngrok /usr/local/bin/ngrok
rm ngrok-v3-stable-linux-amd64.tgz
ngrok config add-authtoken YOUR-AUTH-TOKEN-HERE

# Print ngrok version
ngrok version

# Print jq version
echo "Installed jq version: $(jq --version)"

# Print Python version
echo "Installed Python version: $(python3 --version)"
