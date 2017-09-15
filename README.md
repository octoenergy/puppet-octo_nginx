# octo_nginx

Puppet module for managing Nginx for Octopus Energy machines.

## Changelog

### v1.1

- Use PPA to get Nginx 1.12
- Use `escape=json` in `log_format`
- Log `upstream_response_time` as a string to avoid invalid JSON issues

### v1.0

Initial version.
