Vagrant.configure("2") do |config|
  # The box is optional in newer versions of Vagrant
  # config.vm.box = "dummy"
  config.vm.provision "shell", path: "ansible_bootstrap_with_lamp.sh"
  #config.vm.provision :ansibleLocal, :playbook => "site.yml", :raw_arguments => "-i /tmp/vagrant-ansible-local/hosts"
  config.ssh.username = "root"
  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.pty = true
  config.ssh.proxy_command = 'ssh -aY bastion "nc -w 900 %h %p"'
  config.ssh.forward_agent = "true"

  config.vm.define :tbr0_server do |tbr0_server|
    tbr0_server.vm.provider :rackspace do |rs|
      rs.username = ENV['RAX_USERNAME'] 
      rs.api_key  = ENV['RAX_KEY']
      rs.flavor   = /1 GB Performance/
      #rs.image    = /^CentOS/ # Don't match OnMetal - CentOS
      rs.image    = "e5575e1a-a519-4e21-9a6b-41207833bd39" # Centos6
      #rs.image    = "6455fff1-1f0e-46e3-a795-6c88738d7280" # Centos7
      #rs.image    = "93168d07-a754-4c16-84f7-911c4781f4bd" # Ubuntu1204
      rs.rackspace_region = :iad
      rs.public_key_path = "~/.ssh/id_rsa.pub"
      rs.init_script = 'sed -i\'.bk\' -e \'s/^\(Defaults\s\+requiretty\)/# \1/\' /etc/sudoers'
    end
  end
end
