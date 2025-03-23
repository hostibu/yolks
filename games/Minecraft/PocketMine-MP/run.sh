#!/bin/bash
cd /home/hostibu

# Check for updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"

rm -f PocketMine-MP.phar

# Check version
if [[ "${SERVER_VERSION}" == "latest" ]]; then
    curl -s "https://update.pmmp.io/api" -o api.json
    link=$(jq -r '.download_url' api.json)
    rm -f api.json
else
    link="https://github.com/pmmp/PocketMine-MP/releases/download/${SERVER_VERSION}/PocketMine-MP.phar"
fi

# Download server files
curl -sL $link -o "PocketMine-MP.phar"

# File permissions
chmod +x bin/php7/bin/php
chmod +x PocketMine-MP.phar

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}