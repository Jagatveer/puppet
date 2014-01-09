class deps{

package {"gcc":
ensure => 'present',
}
package {"gcc-c++":
ensure => 'present',
}
package {"make":
ensure => 'present',
}
package {"zlib-devel":
ensure => 'present',
}
package {"pcre-devel":
ensure => 'present',
}
package {"openssl-devel":
ensure => 'present',
}
#package {"libjpeg-devel":
#ensure => 'present',
#}
#package {"curl-devel":
#ensure => 'present',
#}
package {"libpng-devel":
ensure => 'present',
}
package {"libXpm-devel":
ensure => 'present',
}
package {"freetype":
ensure => 'present',
}
package {"freetype-devel":
ensure => 'present',
}
package {"libc-client-devel":
ensure => 'present',
}
package {"libmcrypt-devel":
ensure => 'present',
}
}
