#!/bin/bash

# === Reset Admin Password for massapp Database ===

DB_USER="massapp"
DB_NAME="massappdb"

echo "=== Reset Admin Password ==="
read -p "Masukkan email admin: " ADMIN_EMAIL
read -p "Masukkan password baru admin: " ADMIN_PASS

# Generate SHA-256 hash
HASHED_PASS=$(echo -n "$ADMIN_PASS" | sha256sum | awk '{print $1}')

echo "Password Hash: $HASHED_PASS"

# Update password via psql
sudo -u postgres psql -d "$DB_NAME" <<EOF
UPDATE users
SET password = '$HASHED_PASS'
WHERE email = '$ADMIN_EMAIL';
EOF

echo "=== ✅ Password admin berhasil di-reset ==="
