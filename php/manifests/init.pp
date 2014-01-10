#
#Author Jagatveer Singh
#

class php{
file {'/tmp/php-5.4.23.tar.gz':
	mode => '644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/php/php-5.4.23.tar.gz',
    }
	exec { "extract file in /tmp":
	cwd => '/tmp',
   	command => '/bin/tar -xzvf /tmp/php-5.4.23.tar.gz',
    	path => ['/bin'],
    } ->
file {'/tmp/php-5.4.23/buildprocess':
mode => '755',
owner => 'root',
        group => 'root',
        source => 'puppet:///modules/php/buildprocess',
}

	exec { "configure in /tmp/php-5.4.23":
#        command => "'/tmp/php-5.4.23/configure' '--enable-fpm' '--with-mcrypt' '--with-libdir=lib64' '--with-zlib' '--with-config-file-path=/etc' '--enable-mbstring' '--with-openssl' '--with-mysql' '--with-mysql-sock' '--with-curl' '--with-kerberos' '--with-pdo-mysql' '--with-gd' '--with-jpeg-dir=/usr/lib64' '--enable-gd-native-ttf' '--with-imap' '--with-imap-ssl' '--with-freetype-dir=/usr/lib64'",
#	cwd => '/tmp/php-5.4.23/',
	command => '/bin/sh buildprocess',
	cwd => '/tmp/php-5.4.23',
	timeout => 0,
	path => ['/bin'],
#	path => ['/tmp/php-5.4.23/'],
#	require => Exec['configure in /tmp/php-5.4.23'],
   }
	exec { "make in /tmp/php-5.4.23":
        command => 'make',
	cwd => '/tmp/php-5.4.23',
	timeout => 0,
	path => ['/usr/bin'], 
   } 

        exec { "make install in /tmp/php-5.4.23":
        command => 'make install',
	cwd => '/tmp/php-5.4.23',
	timeout => 0,
	path => ['/usr/bin'], 
    }

} 
