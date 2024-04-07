#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new_hostname>"
    exit 1
fi

# Get the new hostname from the argument
new_hostname="$1"

# Update the /etc/hostname file
echo "$new_hostname" | sudo tee /etc/hostname > /dev/null

# Update the current hostname
sudo hostnamectl set-hostname "$new_hostname"

# Display the updated hostname
echo "Hostname updated to: $new_hostname"
