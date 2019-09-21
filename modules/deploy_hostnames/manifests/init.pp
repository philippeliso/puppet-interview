class deploy_hostnames {

	file {"/etc/hosts":
		ensure => file,
		content => template("deploy_hostnames/hosts.erb"),
	}
}
