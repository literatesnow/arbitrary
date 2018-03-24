Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/xenial64'
  config.vm.hostname = 'arbitrary'

  config.vm.network 'private_network', ip: '192.168.100.100'

  config.vm.provider 'virtualbox' do |vb|
    vb.name   = 'arbitrary'
    vb.memory = 512
    vb.cpus   = 1
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update
    apt-get install -y ruby ruby-dev build-essential

    echo 'gem: --no-document --no-rdoc --no-ri' > /etc/gemrc
    gem install bundler
  SHELL
end
