# Author Jagatveer Singh
# Revised Dependancy Class
# Iteration in pipeline
#Do not change create a duplicate class if needed
class dependency{
if ! defined(Package['autoconf']) {
    package { 'autoconf':        ensure => installed, }
    }else {package { 'autoconf':        ensure => latest, }
}

}
