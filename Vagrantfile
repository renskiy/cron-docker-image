Vagrant.configure("2") do |config|

    config.vm.define "docker", primary: true do |app|

        app.vm.box = "ubuntu/trusty64"

        app.vm.box_check_update = false

        app.vm.provider "virtualbox" do |vm|
            vm.memory = 256
            vm.cpus = 1
            vm.name = "pins"
        end

        # build Docker images
        app.vm.provision "docker" do |docker|
            docker.build_image "/vagrant", args: "--tag=renskiy/cron"
        end

        # remove obsolete Docker images
        app.vm.provision "shell",
           inline: "docker images | sed 1d | grep '<none>' | awk '{print($3)}' | uniq | xargs docker rmi 2>/dev/null || true"

        app.vm.provision "shell", inline: "echo 'Done!'"

    end

end
