# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
if (defined?(VAGRANTFILE_API_VERSION)).nil?
  VAGRANTFILE_API_VERSION = "2"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "vagrant-windows-81"
  config.vm.box = "chincorp/windows-8.1"
  config.vm.boot_timeout = 400
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  # this will require a restart:
  config.vm.hostname = "VM-DEV14"

  # forward RDP and WINRS ports
  config.vm.network "public_network", bridge: "en1"
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

  config.windows.set_work_network = true
  config.winrm.max_tries = 10
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"

  # Share an additional folder to the guest VM.
  # The first argument is the path on the host to the actual folder.
  # The second argument is the path on the guest to mount the folder.
  # And the optional third argument is a set of non-required options.
  config.vm.synced_folder "./data", "/vagrant_data"
  config.vm.synced_folder "~/data", "/Data"

  config.vm.provider "parallels" do |v|
    v.name = "VM-DEV14"
    v.update_guest_tools = true
    v.optimize_power_consumption = true
    v.memory = 8192
    v.cpus = 2
  end

  # Restart to register Windows Firewall & registry settings
  config.vm.provision :shell, inline: 'Restart-Computer -Force'

  config.vm.provision :shell, path: "./data/ConfigureRemotingForAnsible.ps1"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "./ansible/playbook.yml"

    ansible.extra_vars = {
      ansible_ssh_user: 'vagrant',
      ansible_ssh_pass: "vagrant",
      ansible_ssh_port: 5986,
      ansible_connection: "winrm"
    }
    #ansible.verbose = "vvvv"
  end


end
