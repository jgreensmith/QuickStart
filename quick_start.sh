#!/bin/bash

# Define the directory where the Bash scripts are located
SCRIPTS_DIR="${HOME}/QuickStart"

# Check if the directory exists
if [ ! -d "$SCRIPTS_DIR" ]; then
    echo "Error: Directory $SCRIPTS_DIR does not exist."
    exit 1
fi

# Loop through all files ending with .sh in the directory
for script in "$SCRIPTS_DIR"/*.sh; do
    # Check if there are any .sh files
    if [ ! -f "$script" ]; then
        echo "No Bash scripts found in the directory."
        exit 0
    fi

    # Make the script executable (optional if they are already executable)
    chmod +x "$script"

    # Execute the script
    echo "Executing $script..."
    "$script"

    # Check if the script executed successfully
    if [ $? -eq 0 ]; then
        echo "$script executed successfully!"
    else
        echo "Error executing $script"
    fi

    echo "----------------------------"
done

echo "All scripts executed."