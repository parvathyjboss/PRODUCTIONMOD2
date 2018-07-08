class apache::install
{
package { "httpd" :
ensure => 'present',
before => Service['httpd'],
}
service { "httpd" :
ensure => 'running',
subscribe => File["/etc/httpd/conf/httpd.conf"]
}
file { "/etc/httpd/conf/httpd.conf" :
content => template('apache/httpd.conf.erb'),
}
file { "/var/www/html/index.html" :
content => template('apache/index.html.erb'),
}
}
