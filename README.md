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
>> https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/quartus_install.pdf#page=12&zoom=auto,-207,693
    -- Contains details on setting PATH environments and other useful bits of info

https://fpgasoftware.intel.com/static/quick_start_guide/quick_start_guide_20.1_en.pdf
https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/quartus_install.pdf
https://www.intel.com/content/www/us/en/programmable/downloads/software/faq/installation-faq.html?erpm_id=8905536_ts1601556901225#_Toc361418227

#########################################
##<<Beginnings of Installation Guide>> ##
#########################################
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
## FIXME: Include information about installation process/options ##
