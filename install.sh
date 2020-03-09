# Enable sources, add PPAs and update sources: 
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl -y
sudo apt-get install wget ca-certificates

sudo add-apt-repository ppa:tiheum/equinox
sudo add-apt-repository ppa:am-monkeyd/nautilus-elementary-ppa
sudo add-apt-repository ppa:linuxuprising/java
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get upgrade

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i $PWD/discord.deb

# Adding software:
sudo apt-get install -y htop vlc spotify-client oracle-java13-installer nodejs openvpn network-manager-openvpn-gnome apt-transport-https ca-certificates curl gnupg-agent software-properties-common zsh git gconf2 gconftool-2
sudo snap install intellij-idea-ultimate --classic
snap install postman


# needs git from apt
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# restart nautilus (req. to activate elementary):
nautilus -q

# remove lock screen
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Altering settings power management (OLD method):
gconftool-2 --set --type string /apps/gnome-power-manager/critical_battery       shutdown 
gconftool-2 --set --type bool   /apps/gnome-power-manager/battery_reduce         false
gconftool-2 --set --type bool   /apps/gnome-power-manager/idle_dim_battery       false
gconftool-2 --set --type string /apps/gnome-power-manager/sleep_computer_ac      0
gconftool-2 --set --type string /apps/gnome-power-manager/sleep_computer_battery 0
gconftool-2 --set --type string /apps/gnome-power-manager/power  


# Postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
