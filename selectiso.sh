#!/bin/bash

echo "Select the reference number of the ISO you want to download:"
echo "1) Puppy Linux 64 bits (Debian based)"
echo "2) Tails 64 bits"
echo "3) Linux Mint Cinnamon 64 bits"
echo "4) Linux Mint XFCE 64 bits"
echo "5) AntiX 64 bits"
echo "6) Xubuntu 64 bits"
echo "7) Kali Linux (QEMU)"
read -p "Enter a number from 1 to 7: " option

case $option in
    1)
        wget -P ~/ https://distro.ibiblio.org/puppylinux/puppy-bookwormpup/BookwormPup64/10.0.8/BookwormPup64_10.0.8.iso
        ;;
    2)
        wget -P ~/ https://download.tails.net/tails/stable/tails-amd64-6.9/tails-amd64-6.9.iso
        ;;
    3)
        wget -P ~/ https://mirror.csclub.uwaterloo.ca/linuxmint/stable/22/linuxmint-22-cinnamon-64bit.iso
        ;;
    4)
        wget -P ~/ https://mirror.csclub.uwaterloo.ca/linuxmint/stable/22/linuxmint-22-xfce-64bit.iso
        ;;
    5)
        wget -O ~/antiX-23.2_x64-full.iso https://sourceforge.net/projects/antix-linux/files/Final/antiX-23.2/antiX-23.2_x64-full.iso/download
        ;;
    6)
        wget -P ~/ http://ftp.uni-kl.de/pub/linux/ubuntu-dvd/xubuntu/releases/24.04/release/xubuntu-24.04.1-desktop-amd64.iso
        ;;
    7)
        # Define the URL of the file
        URL="https://cdimage.kali.org/kali-2024.3/kali-linux-2024.3-qemu-amd64.7z"

        # Download the file to the home directory
        wget "$URL" -P ~/

        # Check if p7zip is installed, if not, install it
        if ! command -v 7z &> /dev/null; then
            echo "p7zip is not installed. Installing..."
            sudo apt-get update
            sudo apt-get install p7zip-full -y
        fi

        # Extract the file
        7z x ~/kali-linux-2024.3-qemu-amd64.7z -o~/
        ;;
    *)
        echo "Invalid option. Please enter a number from 1 to 7."
        ;;
esac
