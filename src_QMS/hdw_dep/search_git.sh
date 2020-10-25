#!/bin/bash

#####################################################################
#####################################################################
# Hardware & Dependency Fetch
# GitHub: https://github.com/FIUSCIS-CDA?tab=repositories
# Script_Version 0.01
# Author: apast005
#####################################################################
#####################################################################

# Confirm to proceed
if whiptail --yesno "Check/Install git and download repository?" 20 60; then
	# Prepare Basics
	sudo apt update -y
	sudo apt upgrade -y
	# Check if git command exists
	if ! command -v git &>/dev/null; then
		echo "COMMAND could not be found"
		# git command not found-->Installing git
		sudo apt install git -y
	elif command -v git &>/dev/null; then
		# git command found-->Continue to fetch
		echo "COMMAND found!"
	fi
else
	echo "Process declined, now exiting.."
	exit 1
fi

# Main Fetch Zone
# Scan GitHub: FIUSCIS-CDA for hardware / dependencies

# Describe Actions to user
echo "From FIUSCIS-CDA GitHub: Type name of hardware repositories to clone."
echo "Required dependencies for hardware will also be installed."

# Collect names FIXME to multiple varianbles later
read -p "Enter exact name of hardware repository: > " hardware_repo

# Clone desired repository FIXME to multiple repositories later
git clone "https://github.com/FIUSCIS-CDA/$hardware_repo.git"

## Below is a custom solution to extract strings from QSF file to be
## used as variables in git clone command to download required dependencies
## FIXME if a better way is found

# Move to newly downloaded directory
cd "$hardware_repo/"

## FIXME: add traps for signals 1, 2, 15 and clean tmp files used in script
# Initial delimitter to output string in third index when / is encountered
awk -F/ '{print $3}' "$hardware_repo.qsf" > tmp.txt

# Clean tmp.txt of excess newlines and remove strings that don't end in .bdf
grep -e ".*\.bdf" tmp.txt > tmp1.txt

# Final pass through tmp.txt to to trim .bdf extension from lines
sed 's/.bdf//g' tmp1.txt > tmp.txt

## FIXME: add traps for signals 1, 2, 15 and clean tmp files used in script
# Read tmp.txt using each line as a parameter in git clone
while IFS= read -r dependencies; do
	echo -n "Dependency currently cloning: $dependencies"
	 #FIXME add user confirmation to proceed and warning if no
	 #Clone necessary dependencies
	git clone "https://github.com/FIUSCIS-CDA/$dependencies.git"
done < tmp.txt

## TODO: Go over each cloned hardware dependency to download their dependencies
## Thinking of organizing each task into seperate functions to be called recursively
