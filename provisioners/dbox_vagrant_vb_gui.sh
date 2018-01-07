# dbox_vagrant_vb_gui.sh - Do a local dbox setup via shell provisioner for vagrant desktop virtualbox
#
# R.Thatcher @2017 - @robtthatcher
############################################################################
# Check to see if we already ran needed
#
# Package management : remove, add, autoremove stuff, pip installs and gem update.
sudo apt-get remove -y firefox thunderbird lightdm
sudo apt-get install -y ansible awscli chromium-browser direnv gcc git lxdm python3 python-pip ruby ruby-dev screen virtualenv virtualenvwrapper 
sudo apt-get autoremove -y
pip install virtualenv virtualenvwrapper
sudo gem update --system
sudo gem update
# Create a local user
sudo useradd -m dbox -c "dbox provisioner created userid - dbox "
sudo /usr/bin/passwd dbox <<EOF
12345678
12345678
EOF
# Create screen config file from common source copied into tmp by vagrant
cp /tmp/screenrc ~dbox/.screenrc
echo -e "\n# Devopsenv Setup Script Additions ********\n" >> ~dbox/.bashrc
echo -e "# Alias xdg-open to create a macOS like open command" >> ~dbox/.bashrc
echo -e "alias open='xdg-open'\n" >> ~dbox/.bashrc
echo -e "# Create a space for virtualenvs" >> ~dbox/.bashrc
echo -e "mkdir -p ~/Documents/Envs\n" >> ~dbox/.bashrc
# Set location for virutalenv file store
echo -e "# Export virtual env home dir" >> ~dbox/.bashrc
echo -e "export WORKON_HOME=~/Documents/Envs\n" >> ~dbox/.bashrc
# Install direnv and add login reminders
echo -e "# Use direnv for per directory env var setting" >> ~dbox/.bashrc
echo -e "echo -e \"Reminders - direnv and virtualenv for dir and isolated shell variables\"\n" >> ~dbox/.bashrc
echo -e "eval \"\$(direnv hook bash);date\"" >> ~dbox/.bashrc
echo -e "\n*** Devbox No Gui provisioner completed***\n\n Use 'vagrant ssh' to login - dont forget about screen\n \n LOGIN on the desktop using - dbox:12345678 \n"
#Make this touch a reboot-lock file under /var/dbox/provision-state/something.lck
# If exists - skip reboot
sudo reboot
