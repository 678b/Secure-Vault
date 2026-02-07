#!/bin/bash

VAULT_DIR="$HOME/secure_vault"
REPORT_FILE="$VAULT_DIR/vault_report.txt"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "❌ Secure vault not found."
    exit 1
fi

# Clear or create report file
> "$REPORT_FILE"

# Monitor each file in the vault
for file in "$VAULT_DIR"/*; do
    FILE_NAME=$(basename "$file")
    FILE_SIZE=$(stat -c %s "$file")
    LAST_MODIFIED=$(stat -c %y "$file")
    PERMISSIONS=$(stat -c %a "$file")

    {
        echo "File: $FILE_NAME"
        echo "Size: $FILE_SIZE bytes"
        echo "Last Modified: $LAST_MODIFIED"
        echo "Permissions: $PERMISSIONS"

        if [ "$PERMISSIONS" -gt 644 ]; then
            echo "⚠️ SECURITY RISK DETECTED"
        fi

        echo "-----------------------------"
    } >> "$REPORT_FILE"
done

echo "📄 Vault security report created successfully at:"
echo "$REPORT_FILE"

