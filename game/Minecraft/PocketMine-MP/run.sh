#!/bin/bash
cd /home/hostibu

# Functions
get_updates() {
    remove_old_files()
    {
        rm -rf bin
        rm -rf PocketMine-MP.phar
        rm -rf start.sh
    }

    download_php_binary()
    {
        curl -sL https://hostibu.tr/files/pterodactly/nests/minecraft/pocketmine-mp/php-version.json -o php-version.json

        if [[ "${PHP_VERSION}" == *"latest"* ]]; then
            IFS='-' read -ra PARTS <<< "$PHP_VERSION"
            if [[ "${PARTS[1]}" == "PM4" ]]; then
                php_version=$(jq -r '.php["latest"].pm4' php-version.json)
            elif [[ "${PARTS[1]}" == "PM5" ]]; then
                php_version=$(jq -r '.php["latest"].pm5' php-version.json)
            fi
        else
            IFS='-' read -ra PARTS <<< "$PHP_VERSION"
            if [[ "${PARTS[0]}" == "8.0" ]]; then
                if [[ "${PARTS[1]}" == "PM4" ]]; then
                    php_version=$(jq -r '.php["8.0"].pm4' php-version.json)
                elif [[ "${PARTS[1]}" == "PM5" ]]; then
                    php_version=$(jq -r '.php["8.0"].pm5' php-version.json)
                fi
            elif [[ "${PARTS[0]}" == "8.1" ]]; then
                if [[ "${PARTS[1]}" == "PM4" ]]; then
                    php_version=$(jq -r '.php["8.1"].pm4' php-version.json)
                elif [[ "${PARTS[1]}" == "PM5" ]]; then
                    php_version=$(jq -r '.php["8.1"].pm5' php-version.json)
                fi
            elif [[ "${PARTS[0]}" == "8.2" ]]; then
                if [[ "${PARTS[1]}" == "PM4" ]]; then
                    php_version=$(jq -r '.php["8.2"].pm4' php-version.json)
                elif [[ "${PARTS[1]}" == "PM5" ]]; then
                    php_version=$(jq -r '.php["8.2"].pm5' php-version.json)
                fi
            elif [[ "${PARTS[0]}" == "8.3" ]]; then
                php_version=$(jq -r '.php["8.3"].pm5' php-version.json)
            fi

        curl -sL $php_version -o "php.tar.gz"
        tar -xzf php.tar.gz
        rm -rf php.tar.gz
        rm -rf php-version.json
    }

    set_php_extension_dir()
    {
        extension_dir=$(find "$(pwd)/bin" -name "*debug-zts*")
        grep -q '^extension_dir' bin/php7/bin/php.ini && sed -i'bak' "s{^extension_dir=.*{extension_dir=\"$extension_dir\"{" bin/php7/bin/php.ini || echo "extension_dir=\"$extension_dir\"" >> bin/php7/bin/php.ini
    }

    download_pmmp()
    {
        if [[ "${SERVER_VERSION}" == "latest" ]]; then
            curl -sL "https://update.pmmp.io/api" -o pocketmine-version.json
            phar_url=$(jq -r '.download_url' pocketmine-version.json)
            base_url=${phar_url%/*}
            start_url="${base_url}/start.sh"
            rm -rf pocketmine-version.json
        else
            phar_url="https://github.com/pmmp/PocketMine-MP/releases/download/${SERVER_VERSION}/PocketMine-MP.phar"
            start_url="https://github.com/pmmp/PocketMine-MP/releases/download/${SERVER_VERSION}/start.sh"
        fi

        curl -sL "$phar_url" -o "PocketMine-MP.phar"
        curl -sL "$start_url" -o "start.sh"
    }

    remove_old_files
    download_php_binary
    set_php_extension_dir
    download_pmmp
}

set_permission() {
    chmod +x bin/php7/bin/php
    chmod +x PocketMine-MP.phar
    chmod +x start.sh
}

# Check updates
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu güncellemeleri denetleniyor..."
echo "-------------------------------------------------------------------------------------------------------------"
get_updates
set_permission

# Startup message
echo "-------------------------------------------------------------------------------------------------------------"
echo "Hostibu | Sunucu başlatılıyor..."
echo "-------------------------------------------------------------------------------------------------------------"

# Run the server
eval ${STARTUP}