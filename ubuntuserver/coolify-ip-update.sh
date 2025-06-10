#!/bin/bash

# Fetch public IPs
IPV4=$(curl -4 -s https://ifconfig.me)
IPV6=$(curl -6 -s https://ifconfig.me)

# Verify they are valid
if [[ ! "$IPV4" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid IPv4: $IPV4"
  exit 1
fi

if [[ -z "$IPV6" ]]; then
  echo "IPv6 unavailable"
  IPV6=""
fi

# Get container ID dynamically
CONTAINER_ID=$(docker ps --filter "name=coolify-db" --format "{{.ID}}")

if [[ -z "$CONTAINER_ID" ]]; then
  echo "coolify-db container not found"
  exit 1
fi

# Construct SQL command
SQL="UPDATE instance_settings SET public_ipv4 = '$IPV4', public_ipv6 = '$IPV6' WHERE id = 0;"

# Run the SQL command inside the container as user 'coolify'
docker exec -i "$CONTAINER_ID" psql -U coolify -d coolify -c "$SQL"
