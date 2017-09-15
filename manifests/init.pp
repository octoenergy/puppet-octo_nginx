class octo_nginx (
    $default_site_source = undef,
) {
    # Use custom PPA to get modern version of Nginx
    include apt
    apt:ppa { "ppa:nginx/stable": }
    exec { "update package lists": 
        command => "/usr/bin/apt-get update",
        require => Apt::Ppa["ppa:nginx/stable"]
    }
    package { "nginx":
        ensure => "present",
        require => Exec["update package lists"],
    }

    file { "nginx config": 
        path => "/etc/nginx/nginx.conf",
        ensure => "file",
        source => "puppet:///modules/octo_nginx/nginx.conf",
        require => Package["nginx"],
    }

    file { "nginx default site": 
        path => "/etc/nginx/sites-enabled/default",
        ensure => "file",
        source => $default_site_source,
        require => Package["nginx"],
    }

    service { "nginx":
        ensure => running,
        subscribe => [
            File["nginx config"],
            File["nginx default site"],
        ],
    }

}
