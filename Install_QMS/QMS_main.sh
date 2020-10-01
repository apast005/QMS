#####################################################################
#####################################################################
# 32bit installations for Quartus
# Quartus-lite
# 20.1.0.711
#####################################################################
#####################################################################

## Quartus Variables
Quartus_HTTP_Address="https://drive.google.com/file/d/1MPneVcHZWHRd8dqTe-YS5HYSYVt1y6tD/view?usp=sharing"
Quartus_dir_name="Quartus-lite-20"
Quartus_file_name="QuartusLiteSetup-20.1.0.711-linux.run"
Quartus_version="Quartus-lite-20.1.0.711-linux"
Quartus_settings_location="/etc/profile.d/quartus_settings.sh"

# Input is fed from QMS_dep_input file
sudo apt-get install -y < QMS_dep_input
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
