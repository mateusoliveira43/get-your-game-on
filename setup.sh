#!/bin/bash

BOLD="\033[1m"
END="\033[0m"

# GREEN="\033[92m"
# INSTALLED_APPS=0
# CONFIGURED_APPS=0
# check_installation() {
#     if $1 --version &>/dev/null; then
#         printf "\n$GREEN$1$END is already installed, skipping it's installation\n"
#     else
#         install $1
#     fi
# }
# install() {
#     printf "\n$GREEN$1$END is not installed\nInstalling $GREEN$1$END...\n\n"
#     # check if istallation was successfull : return 0 or 1
#     printf "\nSuccessfully installed $GREEN$1$END\n"
#     INSTALLED_APPS+=1
# }
# printf "\nInstalled $INSTALLED_APPS apps!\n" # format message

printf "\n${BOLD}Get your game on!$END\n\n"

if [ $# -eq 0 ]; then
    echo "So let's duel!"

    sudo passwd root
    sudo apt update -y
    sudo apt upgrade -y

    # Mint
    sudo rm /etc/apt/preferences.d/nosnap.pref

    sudo apt install snapd

    sudo apt install zsh -y
    chsh -s $(which zsh)

    sudo apt install curl

    sudo apt remove docker docker-engine docker.io containerd runc
    sudo apt install apt-transport-https ca-certificates gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" # change on update
    sudo apt update -y
    sudo apt install docker-ce docker-ce-cli containerd.io
    # sudo docker run hello-world
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

    reboot
fi

echo "Actually I wasn't done yet..."

sudo apt update -y
sudo apt upgrade -y

# Mint : setup colors

# Firefox : setup colors, favorites, ... https://support.mozilla.org/en-US/kb/recovering-important-data-from-an-old-profile

sudo apt install git -y
git config --global user.name "Mateus Oliveira"
git config --global user.email "matews1943@gmail.com"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sudo apt install fonts-powerline
sed -i '0,/ZSH_THEME="robbyrussell"/s//ZSH_THEME="powerlevel9k/powerlevel9k"\nPOWERLEVEL9K_SHORTEN_DIR_LENGTH=2\nPOWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vcs)\nPOWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)/' ~/.zshrc
sed -i '0,/plugins=(git)/s//plugins=(\ngit\nzsh-syntax-highlighting\nzsh-autosuggestions\n)/' ~/.zshrc
source ~/.zshrc
sed -i '0,/CURRENT_BG=''/s//CURRENT_BG=''\n\techo "\\n ➜ ";/' ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme
source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

sudo snap install --classic code
git clone https://gist.github.com/e3a65de07c679daf4c83569a2087e276.git ~/vscode-setup-folder
while read extension; do
  code --install-extension $extension
done <~/vscode-setup-folder/extensions.txt
mv ~/vscode-setup-folder/settings.json ~/.config/Code/User/settings.json
mv ~/vscode-setup-folder/keybinds.json ~/.config/Code/User/keybinds.json
rm -rf ~/vscode-setup-folder

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# docker-compose --version

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash - # change on update
sudo apt install nodejs

sudo apt install python3-pip
pip install -U pip

printf "\n${BOLD}That's game!$END\n"
