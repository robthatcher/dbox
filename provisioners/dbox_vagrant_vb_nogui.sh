# dbox_vagrant_vb_nogui.sh - Do a local dbox setup via shell provisioner for vagrant on headless virtualbox
#
# R.Thatcher @2017 - @robtthatcher
############################################################################
# Check to see if we already ran needed
#
# Package management : remove, add, autoremove stuff, pip installs and gem update.
sudo apt-get install -y ansible awscli direnv gcc git python3 python-pip ruby ruby-dev screen virtualenv virtualenvwrapper 
sudo apt-get autoremove -y
pip install virtualenv virtualenvwrapper
sudo gem update --system
sudo gem update
# Create screen config file from common source copied into tmp by vagrant
cp /tmp/screenrc ~vagrant/.screenrc
echo -e "\n# Devopsenv Setup Script Additions ********\n" >> ~vagrant/.bashrc
echo -e "# Alias xdg-open to create a macOS like open command" >> ~vagrant/.bashrc
echo -e "alias open='xdg-open'\n" >> ~vagrant/.bashrc
echo -e "# Create a space for virtualenvs" >> ~vagrant/.bashrc
echo -e "mkdir -p ~/Documents/Envs\n" >> ~vagrant/.bashrc
# Set location for virutalenv file store
echo -e "# Export virtual env home dir" >> ~vagrant/.bashrc
echo -e "export WORKON_HOME=~/Documents/Envs\n" >> ~vagrant/.bashrc
# Install direnv and add login reminders
echo -e "# Use direnv for per directory env var setting" >> ~vagrant/.bashrc
echo -e "echo -e \"Reminders - direnv and virtualenv for dir and isolated shell variables\"\n" >> ~vagrant/.bashrc
echo -e "eval \"\$(direnv hook bash);date\"" >> ~vagrant/.bashrc
echo -e "\n*** Devbox No Gui provisioner completed***\n\n Use 'vagrant ssh' to login - dont forget about screen\n \n "
