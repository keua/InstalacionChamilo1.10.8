# Instalacion de Chamilo 1.10.8
# Saesap Guatemala 2016
# Debian 8 (Squeeze)
# Referencia https://docs.vagrantup.com

Vagrant.configure("2") do |config|

#------------------------- Configuracion maquina virtual -------------------------#
 config.vm.define 'chamilo' do |chamilo|
 chamilo.vm.box = "Debian_8_Chamilo"
 chamilo.vm.box_version = "Debian_8_Chamilo"

# configuracion de red y foward de puertos
  chamilo.vm.network "public_network",
  use_dhcp_assigned_default_route: true

  # caracteristicas de hardware
   chamilo.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
     vb.cpus = "2"
   end

  # instalacion de prerrequisitos de chamilo 
  chamilo.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y puppet
     puppet module install puppetlabs-stdlib
   SHELL

   chamilo.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.manifest_file  = 'config.pp'
        puppet.options        = '--verbose'
   end

  end

end