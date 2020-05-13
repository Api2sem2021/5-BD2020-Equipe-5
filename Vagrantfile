## Configuring the Vagrant Minikube Development Box.
Vagrant.configure("2") do |config|

    # A VM with name 'minikube-dev-env' will be created.
    config.vm.define 'minikube-dev-env' do |devenv|
        ## The Ubuntu base Box.
        devenv.vm.box = "hashicorp/bionic64"
        devenv.vm.box_version = "1.0.282"

        # Create a private network, which allows host-only access to the machine
        # using a specific IP.
        devenv.vm.network "private_network", ip: "192.168.30.5"

        # Create a forwarded port mapping which allows access to a specific port
        # within the machine from a port on the host machine.
        devenv.vm.network "forwarded_port", guest: 8080, host: 8082
        devenv.vm.network "forwarded_port", guest: 8081, host: 8083

        ## VIRTUAL_MACHINE_PARAMETERS ##
        #
        # Vagrant runs over a VM. The next session is configuring the VM that this
        # Box will run over. Look at https://www.vagrantup.com/docs/providers/
        #
        devenv.vm.provider "virtualbox" do |vb|
            # Customize the amount of memory and cpu on the VM:
            vb.memory = "10240"
            vb.cpus = "5"
        end

        #devenv.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get -y upgrade"
        devenv.vm.provision "shell", inline: "sudo apt-get update"
        devenv.vm.provision "shell", inline: "sudo apt-get install -y mongodb-org"
        devenv.vm.provision "shell", inline: "sudo systemctl start mongod"

        config.vm.provision "file", source: "~/build/libs/antena-integracao-master.jar", destination: "/home"
        devenv.vm.provision "shell", inline: "sudo java -jar antena-integracao-master.jar"

    end
end