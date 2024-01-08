#!/bin/bash

# Ask for FILENAME and FID
read -p "Enter FILENAME: " FILENAME
read -p "Enter FID: " FID

# Download file using wget with progress bar
wget --load-cookies /tmp/cookies.txt --show-progress "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$FID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FID" -O "$FILENAME" && rm -rf /tmp/cookies.txt

echo "Download complete!"