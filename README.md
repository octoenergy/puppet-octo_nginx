# octo_nginx

Puppet module for managing Nginx for Kraken Technologies machines.

## Changelog

### v1.15

- Start logging `$http_x_forwarded_for` 

### v1.14

- Stop logging `$remote_user` in logs by default

### v1.13

- Use puppet-lint to fixup module

### v1.12

- Use systemd override instead of replacing whole nginx.service file, allowing
  us to benefit from upstream service changes

### v1.11

- Increase limits for number of open files to prevent running out during a DDoS.

### v1.10

- Enable logging of `$remote_user` in logs

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
