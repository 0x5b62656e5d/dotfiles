#!/bin/bash

# Config
ZONE_ID="ZONE_ID"
RECORD_NAMES=("DOMAIN_NAME_1" "DOMAIN_NAME_")
DOMAIN=".pepper.fyi"
API_TOKEN="API_TOKEN"

# Get current IP
IP=$(curl -4 -s https://ifconfig.me)

if [[ ! "$IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid IPv4 address: $IP"
  exit 1
fi

for RECORD_NAME in "${RECORD_NAMES[@]}"; do
  echo "Processing record: $RECORD_NAME"

  # Try to get the record ID
  RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$RECORD_NAME" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" | jq -r '.result[0].id')

  if [[ -z "$RECORD_ID" || "$RECORD_ID" == "null" ]]; then
    echo "Record not found. Creating a new one..."

    # Create new DNS A record
    SUBDOMAIN=$(echo "$RECORD_NAME" | sed -E 's~https?://~~' | sed "s~$DOMAIN~~")

    curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
      -H "Authorization: Bearer $API_TOKEN" \
      -H "Content-Type: application/json" \
      --data "{\"type\":\"A\",\"name\":\"$SUBDOMAIN\",\"content\":\"$IP\",\"ttl\":1,\"proxied\":true}"

    echo "Created new record $RECORD_NAME with IP $IP"
  else
    # Update existing record
    curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
      -H "Authorization: Bearer $API_TOKEN" \
      -H "Content-Type: application/json" \
      --data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$IP\",\"ttl\":1,\"proxied\":true}"

    echo "Updated $RECORD_NAME to IP $IP"
  fi
done
