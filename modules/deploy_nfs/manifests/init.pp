class deploy_nfs {
	# resources
	package { 'nfs-utils':
		ensure => installed,
	}

	service { 'nfs-server':
		enable      => true,
		ensure      => running,
		#hasrestart => true,
		#hasstatus  => true,
		#require    => Class["config"],
	}
	file { '/etc/exposts':
		ensure => file,
		owner    => 'root',
		group    => 'root',
		mode     => 0644,
		
	}
}
