#!/bin/bash

# File path
config_file="/etc/containerd/config.toml"

# Line to comment out
line_to_comment="disabled_plugins"

# Check if the line exists in the file
if grep -q "$line_to_comment" "$config_file"; then
    # Comment out the line by adding a '#' at the beginning
    sudo sed -i "s|^$line_to_comment|#$line_to_comment|" "$config_file"
    sudo systemctl restart containerd
    echo "Line '$line_to_comment' commented out in $config_file."
else
    echo "Line '$line_to_comment' not found in $config_file."
fi