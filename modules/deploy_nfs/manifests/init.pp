class deploy_nfs {
	package { 'nfs-utils':
		ensure => installed
	}

	service { 'nfs-server':
		enable      => true,
		ensure      => running
	}

	service { 'nfs-idmap':
		enable      => true,
		ensure      => running
	}

	service { 'nfs-lock':
		enable      => true,
		ensure      => running
	}

	service { 'rpcbind':
		enable      => true,
		ensure      => running
	}

	file { '/etc/exports':
		source   => "puppet:///modules/deploy_nfs/etc/exports",
		owner    => 'root',
		group    => 'root',
		mode     => 0644,
		require  => Package ["nfs-utils"],
		notify	 => Service ["nfs-server", "nfs-lock", "rpcbind", "nfs-idmap"]
	}

	file { '/dados':
		ensure => directory,
	}

}
