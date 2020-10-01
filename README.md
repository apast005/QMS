############################################################
##########              FIUSCIS-CDA               ##########
##########     QMS_Installer_UNIX_Project_2020    ##########
##########    Quartus_Version_20.1_Ubuntu_20.04   ##########
############################################################

:::Tasks for UNIX FIUSCIS-CDA Hardware Assembler Project:::

Tldr::  Overall, usage of a component requires users to manually check for dependencies in the QSF/QDF and then be sure to install those dependencies in the correct location.  Tasks are all done manually and documentation is not easily accessible.

(1)Increase Usability      
1.1:  Download the appropriate components from GitHub and produce useful messages and/or log files for users as appropriate.  
1.2:  Outputs of these test benches also should be displayed in the terminal or into log files in ways that make sense
1.3:  A user should be able to turn interactive mode on or off (for
Example:  Windows users executing these test benches over Putty

(2)Automate component integration/testing
2.1:  Automate this process through scripts that could process these dependency files and check if dependencies have been installed
2.2:  Test benches for components should be automatically executed upon installation to validate a working component.

(3)Documentation is in PDF table that specifies the module name, dependencies, inputs, outputs, and an English description of the component.  
3.1:  Alternative environment for documentation like Unix “man” pages.

Installation Guides from Intel:
https://fpgasoftware.intel.com/static/quick_start_guide/quick_start_guide_20.1_en.pdf
https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/quartus_install.pdf
https://www.intel.com/content/www/us/en/programmable/downloads/software/faq/installation-faq.html?erpm_id=8905536_ts1601556901225#_Toc361418227

############################################################
##########                                        ##########
########## Quartus ModelSim required dependencies ##########
##########                                        ##########
############################################################
<<Beginnings of Installation Guide>>
0/10 Installation Guide Rating: Needs Improvement =D

1.) Click me first::: https://fpgasoftware.intel.com/20.1/?edition=lite
- Selections to make at the top of the web page
    --Edition: 'Lite'
    --Release: '20.1'
    --OS:      'Linux'
##Testing remote download link to streamline process through terminal##
- Choose 'Individual Files' tab and download
    --Quartus Prime (includes Nios II EDS)
    --ModelSim-Intel FPGA Edition (includes Starter Edition)





# Use 'sudo apt-get install -y' to install required dependencies (libs)
libxft2:i386
libxext6:i386
libncurses5:i386
lib32ncurses5-dev
libzmq3-dev
libc6:i386
libstdc++6:i386
unixodbc-dev
expat fontconfig
xorg-dev
glibc-source
libxft-dev
libxrender-dev
libxt-dev
libxtst-dev
lib32-expat
lib32-fontconfig
lib32-freetype2
lib32-libpng12
lib32-libice
lib32-libsm
util-linux
ncurses-base
tcl-dev tcllib
zlib1g-dev
lib32-util-linux
lib32-ncurses
lib32-zlib
lib32-libx11
lib32-libxrender
lib32-libxt
lib32-libxtst
libcanberra-dev
lib32-glibc
lib32-gtk2
lib32-libcanberra
lib32-libpng
lib32-libxau
lib32-libxdmcp
lib32-libxext
lib32-libxft
libpng12-dev
libpng12-dev
libice-dev
libsm-dev
libx11-dev
libxau-dev
libxdmcp-dev
libxext-dev
