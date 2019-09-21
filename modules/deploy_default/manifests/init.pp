class deploy_default {

	file { '/etc/sudoers':
		source   => "puppet:///modules/deploy_default/etc/sudoers",
		owner    => 'root',
		group    => 'root',
		mode     => 0440
	}
}