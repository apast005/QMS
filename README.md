# QMS

:::Tasks for UNIX FIUSCIS-CDA Hardware Assembler Project:::
Stories for project

Tldr::  Overall, usage of a component requires users to manually check for dependencies in the QSF/QDF and then be sure to install those dependencies in the correct location.  Tasks are all done manually and documentation is not easily accessible.

(1)Increase Usability      
1.1:  Download the appropriate components from Github and produce useful messages and/or log files for users as appropriate.  
1.2:  Outputs of these testbenches also should be displayed in the terminal or into log files in ways that make sense
1.3:  A user should be able to turn interactive mode on or off (for
Example:  Windows users executing these testbenches over PuTTY

(2)Automate component integration/testing
2.1:  Automate this process through scripts that could process these dependency files and check if dependencies have been installed
2.2:  Testbenches for components should be automatically executed upon installation to validate a working component.

(3)Documentation is in PDF table that specifies the module name, dependencies, inputs, outputs, and an English description of the component.  
3.1:  Alternative environment for documentation like Unix “man” pages.



############################################################
##########                                        ##########
########## Quartus ModelSim required dependencies ##########
##########                                        ##########
############################################################

#Quar_dir_name=Quartus-lite-20
#Q_version="20.1.0.711"
#Q_OS="linux"
#Q_file_type=".tar"
# Use 'sudo apt-get install -y' to install required dependencies (libs)
1.) libxft2:i386
2.) libxext6:i386
3.) libncurses5:i386
4.) lib32ncurses5-dev
5.) libzmq3-dev
6.) libc6:i386
7.) libstdc++6:i386
8.) unixodbc-dev

expat fontconfig xorg-dev glibc-source
libxft-dev libxrender-dev libxt-dev libxtst-dev
lib32-expat lib32-fontconfig lib32-freetype2
lib32-libpng12 lib32-libice lib32-libsm
util-linux ncurses-base tcl-dev tcllib zlib1g-dev
lib32-util-linux lib32-ncurses lib32-zlib lib32-libx11
lib32-libxrender lib32-libxt lib32-libxtst libcanberra-dev  
lib32-glibc lib32-gtk2 lib32-libcanberra lib32-libpng
lib32-libxau lib32-libxdmcp lib32-libxext lib32-libxft
libpng12-dev libpng12-dev libice-dev libsm-dev
libx11-dev libxau-dev libxdmcp-dev libxext-dev
