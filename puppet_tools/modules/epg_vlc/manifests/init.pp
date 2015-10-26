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
  
  exec {"bootStrapCode":
    command => "/vagrant/puppet_tools/modules/epg_vlc/files/source/bootstrap",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin',],
    user => "vagrant",
    cwd => "/vagrant/puppet_tools/modules/epg_vlc/files/source/",
    require => Exec["gitPullEPGCode"], 
  }
  
  exec {"configureCode":
    command => "/vagrant/puppet_tools/modules/epg_vlc/files/source/configure --disable-lua --disable-avcodec --disable-swscale --disable-a52 --enable-debug",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin',],
    user => "vagrant",
    cwd => "/vagrant/puppet_tools/modules/epg_vlc/files/source/",
    require => Exec["bootStrapCode"],   
  }
  
  exec {"makeCode":
    command => "make",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin',],
    user => "vagrant",
    cwd => "/vagrant/puppet_tools/modules/epg_vlc/files/source/",
    require => Exec["configureCode"],  
    timeout => 0,
  }
  
}