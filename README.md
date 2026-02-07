# Secure Vault Challenge

## Project Overview
This project implements a Secure Vault System in Linux designed to safely store secrets, control file access, allow secure updates, and monitor security risks. It demonstrates key cybersecurity concepts, including Linux file permissions, secure file handling, audit logging, and controlled access to sensitive data.

---

## Project Structure

secure-vault-challenge/
├── vault_setup.sh # Sets up the vault directory and files
├── vault_permissions.sh # Manages secure file permissions
├── vault_ops.sh # Menu-driven secret and log operations
├── vault_monitor.sh # Monitors files and generates security report
├── README.md # Project documentation
└── secure_vault/
└── vault_report.txt # Security report generated after monitoring


---

## How to Use

### Step 1: Setup Vault
```bash
./vault_setup.sh
Creates ~/secure_vault directory

Initializes keys.txt, secrets.txt, and logs.txt with welcome messages

Step 2: Set Permissions
./vault_permissions.sh
Displays current file permissions

Allows user to update permissions or apply secure defaults:

keys.txt → 600

secrets.txt → 640

logs.txt → 644

Step 3: Vault Operations
./vault_ops.sh
Menu-driven operations:

Add Secret → append new secrets

Update Secret → modify existing secrets

Add Log Entry → timestamped logs

Access Keys → always denied

Exit

Step 4: Monitor Vault
./vault_monitor.sh
Generates vault_report.txt with:

File name

File size

Last modified date

Permissions

Security warning if permissions are too open

Security Features
keys.txt is never exposed; access is always denied in vault_ops.sh

Secure default permissions prevent unauthorized access

Audit logging records all activity in logs.txt

Vault monitoring detects over-permissive file permissions

Notes
All scripts are written in Bash and run on Linux

vault_report.txt is included in the repository
