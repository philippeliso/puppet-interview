class az-ubt-qa-influxdb {

  file { '/etc/influxdb.conf':
    source   => "puppet:///modules/az-ubt-qa-influxdb/conf/influxdb-14.conf",
    owner    => 'root',
    group    => 'root',
    mode     => 0644,
  }
}

