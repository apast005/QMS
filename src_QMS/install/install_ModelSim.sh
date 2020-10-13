#!/bin/bash

#####################################################################
#####################################################################
# Dependencies/Install ModelSim
# ModelSim
# 20.1.0.711
#####################################################################
#####################################################################

## ModelSim Variables
ModelSim_HTTP_Address="https://drive.google.com/file/d/1OfVe6VRaOwnobr5J6FU_TkvMHYKCybYt/view?usp=sharing"
ModelSim_File_Name="ModelSimSetup-20.1.0.711-linux.run"


# echo warning that GUI installer will occur after download
    echo -e "\a GUI Installer will assist after accept.\n\n"

if whiptail --yesno "Begin ModelSim Download?" 20 60 ;then
    # Prepare Basics
    sudo dpkg --add-architecture i386
    sudo apt update -y
    sudo apt upgrade -y

    # Input is fed from ModSim_input file
    sudo apt-get install -y < ModSim_input

    # Download ModelSim
    echo -e "\e[33mDownloading ModelSim	...\e[0m"
    wget "$ModelSim_HTTP_Address" --progress=dot
    echo -e "\e[32m[OK]ModelSim Installer Starting	 ...  \e[0m"

    # Run the installer
    ./ModelSimSetup-*-linux.run

else
    echo Exiting Terminal...
    exit 1
fi

    # Make VCO script writable
    chmod u+w ~/intelFPGA/*.*/modelsim_ase/vco

    # Make a backup of the VCO script
    (cd ~/intelFPGA/*.*/modelsim_ase/ && cp vco vco_original)

    # Stream edit ModelSim vco files
    sed -i 's/linux\_rh[[:digit:]]\+/linux/g' \
        ~/intelFPGA/*.*/modelsim_ase/vco
    sed -i 's/MTI_VCO_MODE:-""/MTI_VCO_MODE:-"32"/g' \
        ~/intelFPGA/*.*/modelsim_ase/vco
    sed -i '/dir=`dirname "$arg0"`/a export LD_LIBRARY_PATH=${dir}/lib32' \
        ~/intelFPGA/*.*/modelsim_ase/vco

    # Download the old 32bit FreetypeLib
    wget download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2
    tar xjf freetype-2.4.12.tar.bz2

    # Compile 32bit FreetypeLib
    cd freetype-2.4.12/
    ./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" \
        "CXXFLAGS=-m32" "LDFLAGS=-m32"
    make clean
    make

    cd ~/intelFPGA/*.*/modelsim_ase/
    mkdir lib32
    cp ~/freetype-2.4.12/objs/.libs/libfreetype.so* lib32/

    # Test command vsim to start ModelSim
    cd
    ~/intelFPGA/*.*/modelsim_ase/bin/vsim
