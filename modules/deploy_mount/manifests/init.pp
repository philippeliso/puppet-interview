class deploy_mount {

	package { 'nfs-utils':
		ensure => installed
	}

	file { '/export':
		ensure => directory
	}

	mount { 'export-directory':
	    ensure                  => mounted,
	    name 					=> '/export',
	    device                  => '192.168.199.12:/dados',
	    target                  => '/etc/fstab',
	    fstype                  => 'nfs',
	    options                 => 'lookupcache=pos,noatime,_netdev,rw,bg,soft,nfsvers=3,tcp,intr,noacl,nocto,rsize=8192,wsize=8192',
	    dump                    => '0',
	    pass                    => '0',
	    require                 => [ Package ['nfs-utils'], File['/export'] ]
	}

}
