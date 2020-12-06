#!/bin/bash

## ModelSim Variables
ModelSim_HTTP_Address="https://drive.google.com/file/d/1OfVe6VRaOwnobr5J6FU_TkvMHYKCybYt/view?usp=sharing"
ModelSim_File_Name="ModelSimSetup-20.1.0.711-linux.run"




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
