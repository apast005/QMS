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

