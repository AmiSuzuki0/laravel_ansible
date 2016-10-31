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

  config.vm.box = "centos66_64"
  config.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box"

  config.vm.hostname = _conf['hostname']

  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=755', 'fmode=644']
  config.vm.synced_folder _conf['sync_folder'], _conf['document_root'], :create => "true", :mount_options => ['dmode=755', 'fmode=644']

  if  Dir.exist?(_conf['sync_folder'] + "/" + _conf['laravel_app_name'] + "/storage") then
    config.vm.synced_folder _conf['sync_folder'] + "/" + _conf['laravel_app_name'] + "/storage", _conf['document_root']+"/"+_conf['laravel_app_name'] +"/storage", :mount_options => ['dmode=777', 'fmode=777']
  end

  if Vagrant.has_plugin?('vagrant-hostsupdater')
    config.hostsupdater.remove_on_suspend = true
  end

  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.network :private_network, ip: _conf['ip']

  # ansible_localの安定するのがvagrant1.8.2からっぽいのでシェルで対応
  config.vm.provision :shell, :path => "ansible.sh"

  #config.vm.provision "ansible_local" do |ansible|
  #  ansible.playbook = _conf['ansible_file_path']
  #end
end
