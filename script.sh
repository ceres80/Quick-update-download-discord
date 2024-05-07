#!/bin/bash

is_discord_installed() {
    if dpkg -l | grep -q discord; then
        return 0
    else
        return 1
    fi
}

download_discord() {
    echo "Downloading the latest version of Discord..."
    wget -qO discord.deb "https://discord.com/api/download?platform=linux&format=deb"
}

update_discord() {
    echo "Updating Discord..."
    sudo dpkg -i discord.deb
    sudo apt-get install -f   # Fix dependencies
}



if is_discord_installed; then
    echo "Discord is already installed."
    download_discord
    update_discord
    echo "Discord has been updated."
    rm discord.deb
else
    echo "Discord is not installed."
    download_discord
    sudo dpkg -i discord.deb
    echo "Discord has been installed."
    rm discord.deb 
fi
