class octo_nginx (
  $default_site_source = undef,
  $default_site_content = undef,
) {
  if $facts['os']['distro']['release']['full'] == '18.04' {
    # Use custom PPA to get version v1.18 Nginx on Xenial.
    include apt
    apt::ppa { 'ppa:nginx/stable': }
    $update_require = Apt::Ppa['ppa:nginx/stable']
  } else {
    $update_require = undef
  }

  exec { 'update package lists for nginx':
    command => '/usr/bin/apt-get update',
    require => $update_require,
  }

  package { 'nginx':
    ensure  => 'present',
    require => Exec['update package lists for nginx'],
  }

  file { 'nginx config':
    ensure  => 'file',
    path    => '/etc/nginx/nginx.conf',
    source  => 'puppet:///modules/octo_nginx/nginx.conf',
    require => Package['nginx'],
  }

  file { 'nginx systemd override dir':
    ensure  => 'directory',
    path    => '/etc/systemd/system/nginx.service.d',
    require => Package['nginx'],
  }

  file { 'nginx systemd config':
    ensure  => 'file',
    path    => '/etc/systemd/system/nginx.service.d/LimitNOFILE.conf',
    source  => 'puppet:///modules/octo_nginx/nginx.service',
    require => File['nginx systemd override dir'],
  }

  if $default_site_source {
    file { 'nginx default site':
      ensure  => 'file',
      path    => '/etc/nginx/sites-enabled/default',
      source  => $default_site_source,
      require => Package['nginx'],
    }
    service { 'nginx':
      ensure    => running,
      enable    => true,
      subscribe => [
        File['nginx config'],
        File['nginx default site'],
      ],
    }
  } elsif $default_site_content {
    file { 'nginx default site':
      ensure  => 'file',
      path    => '/etc/nginx/sites-enabled/default',
      content => $default_site_content,
      require => Package['nginx'],
    }
    service { 'nginx':
      ensure    => running,
      enable    => true,
      subscribe => [
        File['nginx config'],
        File['nginx default site'],
      ],
    }
  } else {
    service { 'nginx':
      ensure    => running,
      enable    => true,
      subscribe => [
        File['nginx config'],
      ],
    }
  }
}
