# Author Jagatveer Singh
# Rough class needs revision
#

class nginx {
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
file { "/tmp/nginx-1.4.4.tar.gz":
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/nginx/nginx-1.4.4.tar.gz',

    }

        exec { 'build_ready':
    cwd     => '/tmp',
    command => '/bin/tar -xvzf /tmp/nginx-1.4.4.tar.gz',
    path => ['/bin']
} 

        exec { "./configure in /tmp/nginx-1.4.4":
        command => "/tmp/nginx-1.4.4/configure --without-mail_pop3_module --user='nobody' --sbin-path=/usr/local/nginx --conf-path=/usr/local/cluster/nginx/nginx.conf --group='nobody' --with-http_ssl_module --without-mail_imap_module --without-mail_smtp_module --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --with-http_stub_status_module --with-pcre",
cwd => '/tmp/nginx-1.4.4',
require => Exec['build_ready'],
                } ->

               exec { "make in /tmp/nginx-1.4.4":
                command => 'make',
cwd => '/tmp/nginx-1.4.4',
               } ->

                exec { "make install in /tmp/nginx-1.4.4":
                command => 'make install',
cwd => '/tmp/nginx-1.4.4',
 }

file  { "/etc/init.d/nginx":
        mode => "0755",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/nginx/nginx',
	require => Exec['make install in /tmp/nginx-1.4.4'],
    }


file  { '/usr/local/nginx/conf':
        owner => 'root',
        group => 'root',
	recurse => true,       
	source => 'puppet:///modules/nginx/nginx-1.4.4/conf',
        require => File['/etc/init.d/nginx'],

}

file  { "/usr/local/nginx/conf/nginx.conf":
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/nginx/nginx.conf',
}


service {
    'nginx':
      enable => true,
      ensure => running,
      require => File['/usr/local/nginx/conf/nginx.conf'],
  }
} 
