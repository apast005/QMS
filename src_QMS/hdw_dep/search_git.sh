#!/bin/bash

# <Brainstorm portion>
#REPOSITORIES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# REPOSITORIES=`pwd`
#
# IFS=$'\n'
#
# for REPO in `ls "$REPOSITORIES/"`
# do
#   if [ -d "$REPOSITORIES/$REPO" ]
#   then
#     echo "Updating $REPOSITORIES/$REPO at `date`"
#     if [ -d "$REPOSITORIES/$REPO/.git" ]
#     then
#       cd "$REPOSITORIES/$REPO"
#       git status
#       echo "Fetching"
#       git fetch
#       echo "Pulling"
#       git pull
#     else
#       echo "Skipping because it doesn't look like it has a .git folder."
#     fi
#     echo "Done at `date`"
#     echo
#   fi
# done
# <END Brainstorm portion/>


#####################################################################
#####################################################################
# Hardware & Dependency Fetch
# GitHub: https://github.com/FIUSCIS-CDA?tab=repositories
# Script_Version 0.01
# Author: apast005
#####################################################################
#####################################################################



# Verify git installed
echo -e "\aChecking if git is installed."
echo -e "\aWill install git if not detected."

# Confirm to proceed
if whiptail --yesno "Begin check and install of git?" 20 60 ; then
# Prepare Basics
sudo apt update -y
sudo apt upgrade -y
  # Check if git command exists
  if ! command -v git &> /dev/null; then
  echo "COMMAND could not be found"
  # git command not found-->Installing git
  sudo apt install git -y
  elif  command -v git &> /dev/null; then
  # git command found-->Continue to fetch
  echo "COMMAND found!"
  fi
else
echo "Process declined, now exiting.."
exit 1
fi


# Main Fetch Zone
# Scan GitHub: FIUSCIS-CDA for hardware / dependencies
