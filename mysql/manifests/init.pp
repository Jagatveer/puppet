#include repo.pp
class mysql {
#import 'repo'
$mysql_password = "8090pure100"
package {
    ['Percona-Server-server-56']:
      ensure => present,
  }
 service {
    'mysql':
      enable => true,
      ensure => running,
      require => Package['Percona-Server-server-56']
  }

  exec {
   "set-root-password":
      subscribe => [Package['Percona-Server-server-56']],
      unless => "/usr/bin/mysqladmin -uroot -p$mysql_password status",
      command => "/usr/bin/mysqladmin -uroot password $mysql_password",
  }

  file {'my.cnf':
path =>  '/etc/my.cnf',
      content => template('mysql/my.cnf'),
      require => Package['Percona-Server-server-56'],
      notify => Service['mysql'],
  }
}
