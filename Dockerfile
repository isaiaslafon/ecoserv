FROM ghcr.io/requarks/wiki:2

# Instalar openssl (usa apk porque la imagen base es Alpine)
USER root
RUN apk add --no-cache openssl

COPY generate-certs.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN rm -f /wiki/config.yml

ENTRYPOINT ["/entrypoint.sh"]

