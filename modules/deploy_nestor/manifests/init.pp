class deploy_nestor {

	package { 'httpd':
		ensure => 'present',
	}

	# file { '/etc/httpd/conf':
	# 	ensure => directory,
	# 	owner => "root",
	# 	group => "root",
	# 	recurse => true,
	# 	mode => '0644',
	# 	source => "${puppet_common_base}/etc/httpd/conf",
	# 	require => Package['httpd']
	# }

	# file { '/etc/httpd/vhosts.d/010-stash.intranet.conf':
	# 	ensure => directory,
	# 	owner => "root",
	# 	group => "root",
	# 	recurse => true,
	# 	mode => '0644',
	# 	source => "${puppet_common_base}/etc/httpd/vhosts.d/010-stash.intranet.conf",
	# 	require => Package['httpd']
	# }
}
