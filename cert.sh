#!/bin/bash
set -e

# === Settings ===
DOMAIN=${1:-localhost}
CERT_DIR="./certs"

# === Step 1: Ensure mkcert is installed ===
if ! command -v mkcert &> /dev/null; then
  echo "🚫 mkcert not found. Installing..."
  sudo apt update
  sudo apt install -y mkcert libnss3-tools
fi

# === Step 2: Ensure local CA exists ===
if [ ! -f "$(mkcert -CAROOT)/rootCA.pem" ]; then
  echo "🔑 Creating local CA..."
  mkcert -install
else
  echo "✅ Local CA already exists."
fi

# === Step 3: Create cert directory ===
mkdir -p "$CERT_DIR"

# === Step 4: Generate certificate ===
CERT_PATH="$CERT_DIR/$DOMAIN.pem"
KEY_PATH="$CERT_DIR/$DOMAIN-key.pem"

echo "📜 Generating certificate for $DOMAIN..."
mkcert -cert-file "$CERT_PATH" -key-file "$KEY_PATH" "$DOMAIN"

echo "✅ Certificate created:"
echo "  - Cert: $CERT_PATH"
echo "  - Key:  $KEY_PATH"
