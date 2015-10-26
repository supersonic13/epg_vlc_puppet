class environment {
  
  #Prep for compile, etc;
  package { 'build-essential': ensure => present, }
  package { 'git': ensure => present, }
  package { 'libtool': ensure => present, }
  package { 'pkg-config': ensure => present, }
  package { 'autoconf': ensure => present, }
  package { 'checkinstall': ensure => present, }
  package { 'automake': ensure => present, }
  package { 'gcc': ensure => present, }
  
  #For XCB
  package { 'libx11-dev': ensure => present, }
  package { 'libx11-xcb-dev': ensure => present, }
  package { 'libxcb-composite0-dev': ensure => present, }
  package { 'libxcb-keysyms1-dev': ensure => present, }
  package { 'libxcb-randr0-dev': ensure => present, }  
  package { 'libxcb-shm0-dev': ensure => present, }
  package { 'libxcb-xv0-dev': ensure => present, }
  package { 'libxcb-xvmc0-dev': ensure => present, }
  package { 'libxcb1-dev': ensure => present, }
  
  #Lua
  package { 'lua5.1': ensure => present, }
  package { 'liblua5.1-0-dev': ensure => present, }
  
  #The DVB SI library
  package { 'libdvbpsi-dev': ensure => present, }
    
  # Other VLC dependencies
  package { 'liba52-0.7.4-dev': ensure => present, }  
  package { 'libaa1-dev': ensure => present, }
  package { 'libasound2-dev': ensure => present, }
  package { 'libass-dev': ensure => present, }
  package { 'libavahi-client-dev': ensure => present, }
  package { 'libcaca-dev': ensure => present, }
  package { 'libcairo2-dev': ensure => present, }
  package { 'libcddb2-dev': ensure => present, }
  package { 'libcdio-dev': ensure => present, }
  package { 'libdca-dev': ensure => present, }
  package { 'libdirac-dev': ensure => present, }

  package { 'libdvdnav-dev': ensure => present, }
  package { 'libdvdread-dev': ensure => present, }
  package { 'libebml-dev': ensure => present, }
  package { 'libfaad-dev': ensure => present, }
  package { 'libflac-dev': ensure => present, }
  package { 'libfluidsynth-dev': ensure => present, }  
  package { 'libfreetype6-dev': ensure => present, }
  package { 'libfribidi-dev': ensure => present, }
  package { 'libgcrypt11-dev': ensure => present, }
  package { 'libid3tag0-dev': ensure => present, }
  package { 'libjack-jackd2-dev': ensure => present, }
  package { 'libkate-dev': ensure => present, }
  package { 'liblircclient-dev': ensure => present, }
  package { 'libmad0-dev': ensure => present, }  
  package { 'libmatroska-dev': ensure => present, }
  package { 'libmodplug-dev': ensure => present, }
  package { 'libmpcdec-dev': ensure => present, }
  package { 'libmpeg2-4-dev': ensure => present, }
  package { 'libmtp-dev': ensure => present, }
  package { 'libncursesw5-dev': ensure => present, }
  #package { 'libnotify-dev': ensure => present, }
  package { 'libogg-dev': ensure => present, }
  package { 'liboggkate-dev': ensure => present, }  
  package { 'libpango1.0-dev': ensure => present, }
  package { 'libpng12-dev': ensure => present, }
  package { 'libprojectm-dev': ensure => present, }
  #package { 'libprojectm-qt-dev': ensure => present, }
  package { 'libproxy-dev': ensure => present, }
  package { 'libpulse-dev': ensure => present, }
  #package { 'libqt4-dev': ensure => present, }
  package { 'libraw1394-dev': ensure => present, }
  #package { 'librsvg2-dev': ensure => present, }  
  package { 'libschroedinger-dev': ensure => present, }
  #package { 'libsdl-image1.2-dev': ensure => present, }
  #package { 'libsdl1.2-dev': ensure => present, }
  package { 'libshout3-dev': ensure => present, }
  package { 'libsmbclient-dev': ensure => present, }
  package { 'libspeex-dev': ensure => present, }
  package { 'libsqlite3-dev': ensure => present, }
  package { 'libsvga1-dev': ensure => present, }
  package { 'libsysfs-dev': ensure => present, }
  package { 'libtag1-dev': ensure => present, }
  package { 'libtar-dev': ensure => present, }
  package { 'libgme-dev': ensure => present, }
  package { 'libtheora-dev': ensure => present, }
  package { 'libtwolame-dev': ensure => present, }
  #package { 'libudev-dev': ensure => present, }
  package { 'libupnp-dev': ensure => present, }
  package { 'libv4l-dev': ensure => present, }  
  package { 'libva-dev': ensure => present, }
  package { 'libvcdinfo-dev': ensure => present, }
  package { 'libvorbis-dev': ensure => present, }
  package { 'libvpx-dev': ensure => present, }
  package { 'libxext-dev': ensure => present, }
  package { 'libxml2-dev': ensure => present, }
  package { 'libxpm-dev': ensure => present, }
  package { 'libxt-dev': ensure => present, }
  package { 'libxv-dev': ensure => present, }
  package { 'libzvbi-dev': ensure => present, }  
  package { 'qt4-qtconfig': ensure => present, }
  package { 'libspeexdsp-dev': ensure => present, }
  package { 'libsamplerate0-dev': ensure => present, }


#  package { '': ensure => present, }

  # create a directory      
  file { "/mnt/abduct":
    ensure => "directory",
    mode => "755",
    owner => "vagrant",
  }

  exec { 'mountAbductNFS':
    command => "mount -t cifs //192.168.105.149/share/ /mnt/abduct/ -o username=laurenm -o password=fred1234",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin',],
    user => "root",
    require => File["/mnt/abduct"],
  }
    
}
