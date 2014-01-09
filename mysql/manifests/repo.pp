class repo {
	package {
	['Percona-Server-server-56']:
	ensure => installed,
	name => 'http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm',
  }
}
