#!/bin/bash

# Define the path to the tools list file
TOOLS_LIST="~/QuickStart/lib/tool_list.txt"

# Check if the tools list file exists
if [ ! -f "$TOOLS_LIST" ]; then
    echo "Error: tools.list file not found at $TOOLS_LIST"
    exit 1
fi

# Update package list
echo "Updating package list..."
sudo apt update

# Loop through each tool in the tools.list file
while IFS= read -r tool; do
    # Ignore empty lines and comments
    if [[ -z "$tool" || "$tool" =~ ^# ]]; then
        continue
    fi

    # Install the tool
    echo "Installing $tool..."
    sudo apt install -y "$tool"

    # Check if installation was successful
    if [ $? -eq 0 ]; then
        echo "$tool installed successfully!"
    else
        echo "Error installing $tool"
    fi
done < "$TOOLS_LIST"

echo "All tools installed."
