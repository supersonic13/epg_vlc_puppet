# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.host_name = "epg-vlc-extractor"

  #INTERFACE SETUP
  # Make VM use bridged network adapter
  config.vm.network "public_network"
  # Setup static ip address (only one network adapter)
  #config.vm.network "public_network", ip: "192.168.1.99"
 
  # See https://stefanwrobel.com/how-to-make-vagrant-performance-not-suck
  # If using windows, uncomment the following and use NFS for shared folders for better performance
#  config.vm.synced_folder '../streams', '/vagrant/streams'

  #VM HOST RESOURCES;
  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      #cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      #mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
      cpus = 2
      mem = 1024
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    #v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
    # For debug of the vm uncomment the following line:
    #v.gui = true
  end
end

