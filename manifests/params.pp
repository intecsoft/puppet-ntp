class ntp::params {
  # Common
  $package = 'ntp'
  $config_file = '/etc/ntp.conf'

  case $::operatingsystem {
    'debian', 'ubuntu': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
    }
    'centos', 'redhat', 'fedora', 'scientific', 'oel', 'oraclelinux': {
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
    }
    'suse': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/drift/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'ntp'
      $config_file_mode  = '0640'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
