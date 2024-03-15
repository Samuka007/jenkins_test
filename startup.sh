#!/bin/bash

# Check the Linux distribution
if [ -f /etc/os-release ]; then
    # Debian-based distributions (e.g., Ubuntu)
    if grep -q "ID=ubuntu" /etc/os-release; then
        sudo apt update
        sudo apt install -y git build-essential
    fi

    # Red Hat-based distributions (e.g., CentOS)
    if grep -q "ID=centos" /etc/os-release; then
        sudo yum update
        sudo yum install -y git make
    fi

    # Arch Linux
    if grep -q "ID=arch" /etc/os-release; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm git base-devel
    fi

    # Add support for other distributions here...

else
    echo "Unsupported Linux distribution"
    exit 1
fi
