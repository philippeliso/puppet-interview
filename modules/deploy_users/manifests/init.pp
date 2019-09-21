class deploy_users {

    case $hostname {
        '/br-sp1-a-devops-sv01/': {

           exec { 'ssh-keygen':
             path => "/usr/bin:/bin",
             command  => 'ssh-keygen -t rsa -b 2048 -f /home/administrator/.ssh/id_rsa -q -P ""',
             returns  => [0, 1, 14],
             timeout  => 3600,
             logoutput   => true,
             creates   => '/home/administrator/.ssh/id_rsa',
             user => 'administrator',
             cwd  => '/home/administrator/',
             environment => ["HOME=/home/administrator", "PWD=/home/administrator"]
          }
        }

        default: {

            user {'mark':
                ensure  => 'present',
                shell   => '/bin/bash',
                uid     => '6201',
                groups  => ['wheel', 'adm', 'systemd-journal'],
                home    => '/home/mark',
                managehome  => true
            }

            file { '/home/mark/.ssh':
                source   => "puppet:///modules/deploy_users/.ssh",
                ensure   => 'directory',
                recurse  => true,
                owner    => 'mark',
                group    => 'mark',
                mode     => 0600,
                require  => User['mark']
            }

            file { '/home/mark/nestor.tar.gz':
                source   => "puppet:///modules/deploy_users/nestor.tar.gz",
                owner    => 'mark',
                group    => 'mark',
                mode     => 0644,
                require  => User['mark']
            }
        }
    }
}
