Vagrant::configure("2") do |config|

  config.vm.define :packaging do |p_config|

    p_config.vm.box = "easybib-ubuntu-14.04.1_vbox-4.3.12_chef-11.10.4_0.1"

    p_config.vm.hostname = "packaging"
    p_config.vm.network :private_network, ip: "33.33.33.126"

    p_config.vm.provider :virtualbox do |vb|
      vb.gui = :gui
      vb.customize [
        "modifyvm", :id,
        "--name", "Packaging",
        "--memory", "256"
      ]
    end

    #config.vm.provision :shell, :inline => "sudo apt-spy2 fix --launchpad --country=de --commit"
    p_config.vm.provision :shell, :inline => "sudo apt-get update -y"
    p_config.vm.provision :shell, :inline => "sudo gem install --no-ri --no-rdoc fpm"
    p_config.vm.provision :shell, :inline => "sudo apt-get install -y rpm"

  end
end
