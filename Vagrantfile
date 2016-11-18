# encoding: utf-8
# vim: ft=ruby expandtab shiftwidth=2 tabstop=2

require 'yaml'

Vagrant.configure("2") do |config|
  # load config
  _conf = YAML.load(
    File.open(
      File.join(File.dirname(__FILE__), '/ansible/group_vars/vagrant.yml'),
      File::RDONLY
    ).read
  )

  config.vm.box = "centos7"
  config.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box"

  config.vm.hostname = _conf['hostname']

  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=755', 'fmode=644']
  config.vm.synced_folder _conf['sync_folder'], _conf['document_root'], :create => "true", :mount_options => ['dmode=755', 'fmode=644']

  config.vm.network :private_network, ip: _conf['ip']

  # ansible_localの安定するのがvagrant1.8.2からっぽいのでシェルで対応
  config.vm.provision :shell, :path => "ansible.sh"
end
