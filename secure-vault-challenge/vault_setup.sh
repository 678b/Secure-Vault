#!/bin/bash

# Define vault directory
VAULT_DIR="$HOME/secure_vault"

# Create vault directory
mkdir -p "$VAULT_DIR"

# Create files with welcome messages
echo "Welcome to the Keys Vault" > "$VAULT_DIR/keys.txt"
echo "Welcome to the Secrets Vault" > "$VAULT_DIR/secrets.txt"
echo "Vault log initialized" > "$VAULT_DIR/logs.txt"

# Success message
echo "✅ Secure Vault setup completed successfully!"

# List files in long format
ls -l "$VAULT_DIR"

