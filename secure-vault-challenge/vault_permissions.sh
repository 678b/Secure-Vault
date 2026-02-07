#!/bin/bash

VAULT_DIR="$HOME/secure_vault"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "❌ Error: secure_vault does not exist."
    exit 1
fi

# Function to update permissions
update_permission() {
    FILE="$1"
    DEFAULT_PERM="$2"

    echo
    echo "File: $(basename "$FILE")"
    echo "Current permission:"
    ls -l "$FILE"

    read -p "Do you want to update permissions? (y/n): " choice

    if [ "$choice" = "y" ]; then
        read -p "Enter new permission (e.g. 600): " new_perm
        chmod "$new_perm" "$FILE"
        echo "Permission updated."
    elif [ -z "$choice" ]; then
        chmod "$DEFAULT_PERM" "$FILE"
        echo "Default permission $DEFAULT_PERM applied."
    else
        echo "Permission unchanged."
    fi
}

# Apply permissions to each file
update_permission "$VAULT_DIR/keys.txt" 600
update_permission "$VAULT_DIR/secrets.txt" 640
update_permission "$VAULT_DIR/logs.txt" 644

# Display final permissions
echo
echo "🔐 Final vault permissions:"
ls -l "$VAULT_DIR"

