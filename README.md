# octo_nginx

Puppet module for managing Nginx for Kraken Technologies machines.

## Changelog

### v1.4
- Log `$upstream_response_time` as a float.

### v1.3
- Stop logging `remote_user`

### v1.2
- Allow no default conf to be set.

### v1.1.2
- Use unique string for update resource

### v1.1.1
- Fix typo in init.pp

### v1.1
- Use PPA to get Nginx 1.12
- Use `escape=json` in `log_format`
- Log `upstream_response_time` as a string to avoid invalid JSON issues

### v1.0
Initial version.
