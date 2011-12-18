Vagrant::Config.run do |config|
  config.vm.define :pennyworth do |pennyworth|
    pennyworth.vm.customize do |vm|
      vm.memory_size = 4096
      # vm.cpu_count = 8
    end
    pennyworth.vm.box = "natty64"
    pennyworth.vm.box_url = "https://s3.amazonaws.com/hw-vagrant/natty64.box"
    pennyworth.vm.forward_port "web", 80, 8000, :auto => true
    pennyworth.vm.forward_port "jenkins", 8080, 8080, :auto => true
    pennyworth.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = [ "cookbooks", "cookbooks-overrides" ]
      chef.roles_path = "roles"
      chef.add_role "pennyworth"
      chef.add_recipe "vim"
      chef.json = {
        :mysql => {
          :server_root_password   => 'root',
          :server_repl_password   => 'root',
          :server_debian_password => 'root',
          :bind_address           => '127.0.0.1'
        }
      }
    end
  end
end
