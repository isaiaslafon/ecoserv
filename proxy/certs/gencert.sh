#!/bin/bash

# SERVICES=(
#   "adminer.local"
#   "forgejo.local"
#   "netdata.local"
#   "uptimekuma.local"
#   "wiki.local"
# )

# for DOMAIN in "${SERVICES[@]}"; do
#     NAME=$(echo $DOMAIN | cut -d. -f1)

#     if [ ! -d "$NAME" ]; then
#         echo "❌ ERROR: el directorio $NAME no existe. Crealo primero."
#         exit 1
#     fi

#     openssl req -x509 -nodes -days 365 \
#       -newkey rsa:2048 \
#       -keyout $NAME/privkey.pem \
#       -out $NAME/fullchain.pem \
#       -subj "/C=AR/ST=Buenos Aires/L=Buenos Aires/O=Ecoserv/CN=$DOMAIN" \
#       -addext "subjectAltName=DNS:$DOMAIN,DNS:localhost,IP:127.0.0.1"

#     echo "✔ Cert generado para $DOMAIN → carpeta $NAME/"
# done

#!/bin/bash

CERT_BASE_DIR="./certs"
SERVICES=(
  "adminer.local"
  "forgejo.local"
  "netdata.local"
  "uptimekuma.local"
  "wiki.local"
)

for DOMAIN in "${SERVICES[@]}"; do
    NAME=$(echo $DOMAIN | cut -d. -f1)
    SERVICE_DIR="$CERT_BASE_DIR/$NAME"

    # Create the service directory if it doesn't exist
    mkdir -p "$SERVICE_DIR"

    openssl req -x509 -nodes -days 365 \
      -newkey rsa:2048 \
      -keyout "$SERVICE_DIR/privkey.pem" \
      -out "$SERVICE_DIR/fullchain.pem" \
      -subj "/C=AR/ST=Buenos Aires/L=Buenos Aires/O=Ecoserv/CN=$DOMAIN" \
      -addext "subjectAltName=DNS:$DOMAIN,DNS:localhost,IP:127.0.0.1"

    echo "✔ Cert generado para $DOMAIN → $SERVICE_DIR/"
done