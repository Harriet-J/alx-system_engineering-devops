# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
} -> exec { 'nginx-restart':  # 👈 Fix: Arrow now correctly links both blocks
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
