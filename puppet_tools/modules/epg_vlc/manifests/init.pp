class epg_vlc {
  exec {"cloneEPGCode":
    command => "git clone https://github.com/supersonic13/vlc_dvbtsanalyser /vagrant/puppet_tools/modules/epg_vlc/files/source/",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin',],
    user => "vagrant",
    creates => "/vagrant/puppet_tools/modules/epg_vlc/files/source/.git/config",
  }
  
  exec {"gitPullEPGCode":
    command => "git pull",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin',],
    user => "vagrant",
    cwd => "/vagrant/puppet_tools/modules/epg_vlc/files/source/",
    require => Exec["cloneEPGCode"], 
  }
  
}