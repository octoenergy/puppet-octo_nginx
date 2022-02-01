# octo_nginx

Puppet module for managing Nginx for Kraken Technologies machines.

## Changelog

### v1.9.2

- Change nginx log directory owner to fix log rotation.

### v1.9.1

- Fix bug in handling Ubuntu 20.04.

### v1.9

- Add support for Ubuntu 20.04.

### v1.8

- Add Amazon Load Balancer Trace ID to access logs.

### v1.7

- Update requirement on puppetlabs-apt dependency from "2.2.1" to ">= 2.2.1"

### v1.6

- Allow config content to be passed in.

### v1.5

- Increase keepalive timeout.

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
