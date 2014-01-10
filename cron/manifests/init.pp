#
#Author Jagatveer Singh
#

class cron {


                    $minute = generate('/usr/bin/env', 'sh', '-c', 'printf $((RANDOM%60+0))')


                    cron { "manual-puppet":
                        command => "/usr/bin/puppet agent --server=puppetmaster.standalonehosted.dallas.softlayer.kayako.net --no-daemonize --verbose --onetime --logdest syslog > /dev/null 2>&1",
                        user => "root",
                        hour => "*",
                        minute => $minute,
                        ensure => present,
                    }


                }
