

#Quartus ModelSim remote server HTTP_Address
Quartus_HTTP_Address=http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_tar/Quartus-lite-20.1.0.711-linux.tar
Quartus_dir_name=Quartus-lite-20
Quartus_file_name=Quartus-lite-20.1.0.711-linux.tar
Quartus_version=Quartus-lite-20.1.0.711-linux
Quartus_settings_location=/etc/profile.d/quartus_settings.sh

# Required items to be present in OS for install
AGet_FILE=/usr/bin/apt-get
WGet_FILE=/usr/bin/wget
curl_FILE=/usr/bin/curl

######################################
#### OS /bin checks and downloads ####
######################################

#####################################################################
# Update/Upgrade/BuildEssentials Prep
#####################################################################
sudo apt update -y; sudo apt upgrade -y; sudo apt-get install build-essentials -y

### Not sure if necessary
# apt-get
#if [ -f "$AGet_FILE" ]; then
#    echo "$AGet_FILE is ready to go!"
#else
#    echo "$AGet_FILE will be downloaded."
    # apt-get install
#    echo -e "\e[33mInstalling curl	...\e[0m"
#    sudo apt install apt-get -y
#    echo -e "\e[32m[OK]  curl	 ...  \e[0m"
#fi

# wget check
if [ -f "$WGet_FILE" ]; then
    echo "$WGet_FILE is ready to go!"
else
    echo "$WGet_FILE will be downloaded."
    # wget install
    echo -e "\e[33mInstalling wget	...\e[0m"
    sudo apt-get install wget -y
    echo -e "\e[32m[OK]  wget	 ...  \e[0m"
fi

# curl check
if [ -f "$curl_FILE" ]; then
    echo "$curl_FILE is ready to go!"
else
    echo "$curl_FILE will be downloaded."
    # curl install
    echo -e "\e[33mInstalling curl	...\e[0m"
    sudo apt-get install curl -y
    echo -e "\e[32m[OK]  curl	 ...  \e[0m"
fi
#####################################################################


#####################################################################
# 32bit installations for Quartus
# Quartus-lite
# 20.1.0.711
#####################################################################

# Input is fed from libs32_list file
sudo apt-get install -y <libs32_list
mkdir "$Quar_dir_name"

# Download/Extract Quartus
echo -e "\e[33mInstalling Downloading/Extracting Quartus	...\e[0m"
curl "$Quartus_HTTP_Address" | tar -xz "$Quartus_file_name "-C "$Quar_dir_name"
echo -e "\e[32m[OK]  Quartus Extracted to $Quartus_dir_name	 ...  \e[0m"

cd "$Quartus_dir_name"
echo -e  "\n Set installation directory to /opt/altera/20.1 \n"
echo '[Press any key to continue]'
read -n 1 keypress
sudo ./setup.sh

# Clean
cd ..; sudo rm -rf "$Quartus_dir_name"

# Settings for Quartus
sudo touch "$Quartus_settings_location"
echo "# $Quartus_version" | \
sudo tee >> "$Quartus_settings_location"

# Set PATH environments for Quartus/ModelSim
echo -e "\e[33mExporting/Appending PATH	...\e[0m"
echo "export PATH=$PATH:$Quartus_dir_name/embedded/host_tools/altera/preloadergen" |\
sudo tee >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/quartus/bin" |\
sudo tee >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/quartus/sopc_builder/bin" |\
sudo tee >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/modelsim_ase/bin" |\
sudo tee >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/modelsim_ase/linuxaloem" |\
sudo tee >> "$Quartus_settings_location"
echo "export QSYS_ROOTDIR=$Quartus_dir_name/quartus/sopc_builder/bin" | \
sudo tee >> "$Quartus_settings_location"
echo "export QUARTUS_ROOTDIR=$Quartus_dir_name/quartus" | \
sudo tee >> "$Quartus_settings_location"
echo "export SOCEDS_DEST_ROOT=$Quartus_dir_name/embedded" | \
sudo tee >> "$Quartus_settings_location"

# Make Quartus Settings Script Excecutable for following exports
sudo chmod +x "$Quartus_settings_location"

# add/source PATH to bashrc
echo "# $Quartus_version" >> ~/.bashrc
echo "source $Quartus_settings_location" >> ~/.bashrc
echo -e "\e[32m[OK]  Quartus PATH complete ...  \e[0m"
#####################################################################


#####################################################################
# TODO
# ModelSim Installation
# FIXME
#####################################################################
