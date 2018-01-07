#!/bin/bash +x
############################################################################
# dbox - An environment provisioner script
# name: dbox.sh --- usage: ./dbox.sh <-option>
# R.Thatcher @2017 - @robtthatcher
############################################################################
#
# read cmdline options and execute or exit printing usage
#
# -local : special case on local machine only run setup scripts
# -vgui : vagrant desktop
# -vnogui : vagrant headless

# Set the first commandline option to a variable
COPTION=$1

# Check current directory contains the expected files
if [[ ! -f README.md ]]; then
        echo -e "\n\tERROR: Could not find LICENCE file in current directory, cannot continue..."
        exit 1
fi
# Check number of parameters passed to script
if [ "$#" -ne 1 ]; then
        echo -e "\n\tERROR: Wrong number of parameters ($# instead of 1) : run ./dbox.sh -h for help\n"
	    exit 1
fi
# Check we have valid parameter, it must match one of the strings in the case 
case $COPTION in
	-h|--help)
		echo -e "\n\tUsage : dbox.sh <option>\n\t"
	    echo -e "\t-h       --help for this help"
	    echo -e "\t-local   --for local install"
	    echo -e "\t-vgui    --for vagrant and virtualbox desktop (with gui)"
        echo -e "\t-vnogui  --for vagrant and virtualbox desktop (no gui)\n"
		exit 0
        ;;
    -local)
        echo -e "\n\t *** Local install.. ***\n"
        echo -e "\n\t *** Please be patient, perhaps a coffee?.. ***\n"

        source provisioners/dbox_local.sh > local_install_`date +%s`.log 2>&1
        ;;
    -vgui)
        echo -e "\n\t *** Vagrant GUI desktop install.. ***"
        echo -e "\n\t *** Username : dbox -- Password 12345678 to log in *** "
        echo -e "\n\t *** Please be patient, perhaps a coffee?.. ***\n"
        ;;
    -vnogui)
        echo -e "\n\t *** Vagrant headless NOGUI install.. ***"
        echo -e "\n\t *** Use vagrant ssh to log in ***\n"
        echo -e "\n\t *** Please be patient, perhaps a coffee?.. ***\n"
        ;;
	*)
        echo -e "\n\tERROR: Illegal option ($COPTION not valid).. run ./dbox.sh -h for help\n"
        exit 1
        ;;
	esac
