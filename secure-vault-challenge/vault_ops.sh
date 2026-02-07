#!/bin/bash

VAULT_DIR="$HOME/secure_vault"
SECRETS_FILE="$VAULT_DIR/secrets.txt"
LOGS_FILE="$VAULT_DIR/logs.txt"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "❌ Secure vault not found."
    exit 1
fi

while true; do
    echo
    echo "🔐 Secure Vault Menu"
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    read -p "Choose an option: " choice

    case "$choice" in
        1)
            read -p "Enter new secret: " secret
            echo "$secret" >> "$SECRETS_FILE"
            echo "✅ Secret added."
            ;;
        2)
            read -p "Enter secret to replace: " old_secret
            read -p "Enter new secret: " new_secret

            if grep -q "$old_secret" "$SECRETS_FILE"; then
                sed -i "s/$old_secret/$new_secret/" "$SECRETS_FILE"
                echo "🔄 Secret updated."
            else
                echo "No match found."
            fi
            ;;
        3)
            read -p "Enter log message: " log_msg
            echo "$(date '+%Y-%m-%d %H:%M:%S') - $log_msg" >> "$LOGS_FILE"
            echo "📝 Log entry added."
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "👋 Exiting Secure Vault."
            break
            ;;
        *)
            echo "❗ Invalid option. Try again."
            ;;
    esac
done

