# dbox_local.sh - Do a local dbox setup
#
# R.Thatcher @2017 - @robtthatcher
############################################################################
# Check to see if we already ran needed
#
# Package management : remove, add, autoremove stuff, pip installs and gem update.
sudo apt-get remove -y firefox thunderbird
sudo apt-get install -y ansible awscli chromium-browser direnv gcc git python3 python-pip ruby ruby-dev virtualenv virtualenvwrapper 
sudo apt-get autoremove -y
pip install virtualenv virtualenvwrapper
sudo gem update --system
sudo gem update
# Env Var Setup
echo -e "\n# dbox Setup Script Additions ********\n" >> ~/.bashrc
echo -e "# Alias xdg-open to create a macOS like open command" >> ~/.bashrc
echo -e "alias open='xdg-open'\n" >> ~/.bashrc
echo -e "# Create a space for virtualenvs" >> ~/.bashrc
echo -e "mkdir -p ~/Documents/Envs\n" >> ~/.bashrc
# Create Aliases
echo -e "# Export virtual env home dir" >> ~/.bashrc
echo -e "export WORKON_HOME=~/Documents/Envs\n" >> ~/.bashrc
# Install direnv and add login reminders
echo -e "# Use direnv for per directory env var setting" >> ~/.bashrc
echo -e "echo -e \"Reminders - direnv and virtualenv for dir and isolated shell variables\"\n" >> ~/.bashrc
echo -e "eval \"\$(direnv hook bash);date\"\n" >> ~/.bashrc
