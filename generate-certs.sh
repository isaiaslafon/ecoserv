#!/bin/sh
set -e

CERT_DIR=/wiki/ssl
DOMAIN=${DOMAIN:-wiki.local}

mkdir -p $CERT_DIR

if [ ! -f "$CERT_DIR/cert.pem" ] || [ ! -f "$CERT_DIR/key.pem" ]; then
    echo "🔐 Generating self-signed certificate for $DOMAIN..."
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout $CERT_DIR/key.pem \
        -out $CERT_DIR/cert.pem \
        -subj "/CN=$DOMAIN"
fi

exec node server

