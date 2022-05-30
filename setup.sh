#!/bin/bash

# Fedora Setup Script For Daily Use

# Change DNF Parameters

        sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak &&
        echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf &&
        echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf &&

# Setup Flathub Repo

        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
        flatpak update -y &&

# Setup RPM Fusion Repo

        sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarc>
        sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora)>
        sudo dnf update -y &&

# Setup VSCode Repo

        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
        sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' &&
        sudo dnf update -y &&

# Remove Apps
        
        sudo dnf autoremove dnfdragora geany claws-mail transmission asunder xfburn pragha pidgin -y &&

# Install Apps

        sudo dnf install sassc fzf gtk-murrine-engine gtk2-engines picom ulauncher code transmission-cli code xfce4-docklike-plugin openssl mpv lightdm-gtk-greeter-settings materia-gtk-theme arc-theme docker -y &&
        flatpak install io.github.hmlendea.geforcenow-electron -y &&

# Setup Ani-CLI

        wget https://github.com/pystardust/ani-cli/archive/refs/heads/master.zip -P $HOME/Downloads &&
        unzip $HOME/Downloads/master.zip &&
        sudo cp $HOME/Downloads/ani-cli-master/ani-cli /usr/local/bin &&
        rm $HOME/Downloads/ani-cli-master master.zip &&
        rm -r $HOME/Downloads/ani-cli-master &&
 
 # Setup Mov-CLI

        wget https://github.com/mov-cli/mov-cli/archive/refs/heads/master.zip -P $HOME/Downloads &&
        unzip $HOME/Downloads/master.zip &&
        sudo cp $HOME/Downloads/mov-cli-master/mov-cli /usr/local/bin &&
        rm $HOME/Downloads/master.zip &&
        rm -r $HOME/Downloads/mov-cli-master &&

# Setup Qogir Theme

        wget https://github.com/vinceliuice/Qogir-theme/archive/refs/heads/master.zip -P $HOME/Downloads &&
        unzip master.zip &&
        sudo sh $HOME/fedora-xfce-setup/Qogir-theme-master/install.sh -d /usr/share/themes -c standard light dark &&
        rm $HOME/Downloads/master.zip &&
        rm -r $HOME/Downloads/Qogir-theme-master

# Setup Qogir Icons

        wget https://github.com/vinceliuice/Qogir-icon-theme/archive/refs/heads/master.zip -P $HOME/Downloads &&
        unzip $HOME/Downloads/master.zip &&
        sudo sh $HOME/fedora-xfce-setup/Qogir-icon-theme-master/install.sh -d /usr/share/icons &&
        rm $HOME/Downloads/master.zip &&
        rm -r $HOME/Downloads/Qogir-icon-theme-master &&
        
# Setup Wallpapers

        wget https://github.com/TimCrickett/wallpapers/archive/refs/heads/main.zip -P $HOME/Pictures &&
        unzip $HOME/Pictures/main.zip &&
        mv $HOME/Pictures/wallpapers-main $HOME/Pictures/wallpapers &&
        rm $HOME/Pictures/main.zip &&

# EOF

        echo "Script Has Finished Running"
