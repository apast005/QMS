#####################################################################
#####################################################################
# 32bit installations for Quartus
# Quartus-lite
# 20.1.0.711
#####################################################################
#####################################################################

## Quartus Variables
Quartus_HTTP_Address="https://drive.google.com/file/d/1MPneVcHZWHRd8dqTe-YS5HYSYVt1y6tD/view?usp=sharing"
Quartus_dir_name="Quartus-lite-20.1"
Quartus_file_name="QuartusLiteSetup-20.1.0.711-linux.run"
Quartus_version="Quartus-lite-20.1.0.711-linux"
Quartus_settings_location="/etc/profile.d/quartus_settings.sh"

# echo warning that GUI installer will occur after download
    echo -e "\a GUI Installer will assist after accept.\n"
if whiptail --yesno "Begin Quartus Install?" 20 60 ;then

    # Installing Quartus dependencies
    sudo apt-get install -y < Quar_input
    mkdir "$Quar_dir_name"

    # Download Quartus .run file
    echo -e "\e[33mDownloading Quartus	...\e[0m"
    wget "$Quartus_HTTP_Address" --progress=dot
    echo -e "\e[32m[OK] Quartus Installer Starting	 ...  \e[0m"

    # Quartus Installer GUI
    sudo ./setup.sh

else
    echo Exiting Terminal...
    exit 1
fi



# Settings for Quartus
sudo touch "$Quartus_settings_location"
echo "# $Quartus_version" | \
sudo tee path_off >> "$Quartus_settings_location"

# Set PATH environments for Quartus/ModelSim
echo -e "\e[33mExporting/Appending PATH	...\e[0m"
echo "export PATH=$PATH:$Quartus_dir_name/embedded/host_tools/altera/preloadergen" |\
sudo tee path_off >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/quartus/bin" |\
sudo tee path_off >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/quartus/sopc_builder/bin" |\
sudo tee path_off >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/modelsim_ase/bin" |\
sudo tee path_off >> "$Quartus_settings_location"
echo "export PATH=$PATH:$Quartus_dir_name/modelsim_ase/linuxaloem" |\
sudo tee path_off >> "$Quartus_settings_location"
echo "export QSYS_ROOTDIR=$Quartus_dir_name/quartus/sopc_builder/bin" | \
sudo tee path_off >> "$Quartus_settings_location"
echo "export QUARTUS_ROOTDIR=$Quartus_dir_name/quartus" | \
sudo tee path_off >> "$Quartus_settings_location"
echo "export SOCEDS_DEST_ROOT=$Quartus_dir_name/embedded" | \
sudo tee path_off >> "$Quartus_settings_location"

# Make Quartus Settings Script Excecutable for following exports
sudo chmod +x "$Quartus_settings_location"

# add/source PATH to bashrc
echo "# $Quartus_version" >> ~/.bashrc
echo "source $Quartus_settings_location" >> ~/.bashrc
echo -e "\e[32m[OK]  Quartus PATH complete ...  \e[0m"
#####################################################################
