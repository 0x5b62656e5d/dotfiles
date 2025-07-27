# Ubuntu server configs

## Crontab

- `*/5 * * * * bash ~/cloudflare-ddns.sh > /dev/null 2>&1`
- `*/5 * * * * bash ~/coolify-ip-update.sh > /dev/null 2>&1`

## Docker `daemon.json`

Location: `/etc/docker/daemon.json`

```json
{
    "metrics-addr": "0.0.0.0:9323",
    "experimental": true
}
```

Make sure to allow 9323 on UFW!