TEST_BOXES = [
  {:name => "ubuntu2004", :box => "ubuntu/focal64", :platform => "ubuntu"},
]

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vbox|
    vbox.memory = 8192
    vbox.cpus = 6
  end

  config.vm.synced_folder "data/", "/root/downloads"


  # Loop to define boxes
  TEST_BOXES.each_with_index do |node, idx|
    config.vm.define node[:name] do |nodeconfig|
      nodeconfig.vm.box = node[:box]
      nodeconfig.vm.network :forwarded_port, guest: 22, host: 2220 + idx, id: "ssh", auto_correct: true
      nodeconfig.vm.provision "shell", type: "shell", path: "shell.sh"
    end
  end
end
