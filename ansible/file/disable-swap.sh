#!/bin/bash

# File path
fstab_file="/etc/fstab"

# Line to comment out
line_to_comment="/dev/mapper/vgvagrant-swap_1"

# Check if the line exists in the file
if grep -q "$line_to_comment" "$fstab_file"; then
    # Comment out the line by adding a '#' at the beginning
    sudo sed -i "s|^$line_to_comment|#$line_to_comment|" "$fstab_file"
    echo "Line '$line_to_comment' commented out in $fstab_file."
else
    echo "Line '$line_to_comment' not found in $fstab_file."
fi

# temporary disable
sudo swapoff -a
