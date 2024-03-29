class deploy_nestor_fixed {

	package { 'httpd':
		ensure => 'present',
	}

	service { 'httpd':
		enable      => true,
		ensure      => running,
		require		=> Package["httpd"]
	}

	file { '/etc/httpd/conf.d/userdir.conf':
		ensure => absent,
		require => Package['httpd'],
		notify  => Service['httpd']
	}

	file { '/etc/httpd/conf.d/welcome.conf':
		ensure => absent,
		require => Package['httpd'],
		notify  => Service['httpd']
	}

	file { '/etc/httpd/conf.d/autoindex.conf':
		ensure => absent,
		require => Package['httpd'],
		notify  => Service['httpd']
	}

	file { '/etc/httpd/conf/httpd.conf':
		source   => "puppet:///modules/deploy_nestor_fixed/etc/httpd/conf/httpd.conf",
		owner => "root",
		group => "root",
		mode => '0644',
		require => Package['httpd'],
		notify  => Service['httpd']
	}

	file { '/etc/httpd/conf.d/nestor.conf':
		source   => "puppet:///modules/deploy_nestor_fixed/etc/httpd/conf.d/nestor.conf",
		owner => "root",
		group => "root",
		mode => '0644',
		require => Package['httpd'],
		notify  => Service['httpd']
	}
}
