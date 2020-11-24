<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/apast005/QMS">
    <img src="https://avatars3.githubusercontent.com/u/69246622?s=460&u=db1d7a32b0de4373c355352638a3e7cad9ffa97c&v=4" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">FIUCIS-CDA UNIX Student Project</h3>

  <p align="center">
    UNIX project to automate Quartus and ModelSim operations through shell scripting
    <br />
    <a href="https://github.com/apast005/QMS"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/apast005/QMS">View Demo</a>
    ·
    <a href="https://github.com/apast005/QMS/issues">Report Bug</a>
    ·
    <a href="https://github.com/apast005/QMS/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [References Used](#references)
* [Acknowledgments](#acknowledgments)



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

UNIX course project to automate the installation of Intel's Quartus and ModelSim
for Linux Ubuntu 20.04. Necessary library dependencies for installation are checked
and installed.  Hardware components downloaded from [FIUSCIS-CDA GitHub](https://github.com/FIUSCIS-CDA?tab=repositories)
will also download the dependencies for the hardware to operate.  Documentation
will also be converted to man pages to be more readily accessed by the community.

Any feedback/suggestions to make this project a useful contribution to the open
source community is greatly appreciated!
My main goal is to ease the use of Quartus and ModelSim for educational purposes
and create polished shell scripts for anyone to use.


Most of the README will be updated as the project progresses.  The majority is
still in a template format derived from [this github.](https://github.com/othneildrew/Best-README-Template/blob/master/BLANK_README.md)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

1. 32bit libraries to install
```sh
sudo dpkg --add-architecture i386
```
```sh
sudo apt-get update
```
```sh
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
```
```sh
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0
```
```sh
sudo apt-get install build-essential
```
```sh
sudo apt-get install gcc-multilib g++-multilib lib32stdc++6 lib32gcc1 \

expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libgtk-3-0:i386 \

libcanberra0:i386 libice6:i386 libsm6:i386 zlib1g:i386 libx11-6:i386 \

libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \

libxt6:i386 libxtst6:i386
```
2. Go to [Quartus ModelSim download site](https://fpgasoftware.intel.com/20.1.1/?edition=lite&platform=linux)
3. Select Edition: 'Lite'
4. Select OS: 'Linux'
5. Select 'Individual Files' tab and download Quartus and ModelSim .run files

### Installation

1. Install git
```sh
sudo apt update && sudo apt upgrade
```
```sh
sudo apt install git
```
2. Clone the repo
```sh
git clone https://github.com/apast005/QMS.git
```
3. [Download freetype](http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2)
4. Extract freetype .tar.bz2 file
5. Then run the following set of commands
```sh
cd  ~/Downloads/
```
```sh
cd  freetype-2.4.12
```
```sh
./configure -- build=i686-pc -linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
```
```sh
make -j8
```
6. Go to modelsim_ase directory. Below is where my modelsim_ase directory was located
```sh
cd ~/intelFPGA/20.1/modelsim_ase
```
7. Once there, make a lib32 directory
```sh
mkdir lib32
```
8. Copy files from freetype to new lib32 folder inside modelsim_ase
```sh
sudo cp ~/Downloads/freetype-2.4.12/objs/.libs/libfreetype.so* ./lib32
```

<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap
1. Increase Usability      
    - [X] Download the appropriate components from GitHub and produce useful messages and/or log files for users as appropriate.  
    - [X] Outputs of these test benches also should be displayed in the terminal or into log files in ways that make sense
    - [ ] A user should be able to turn interactive mode on or off (for
              * Example:  Windows users executing these test benches over Putty

2. Automate component integration/testing
    - [X] Automate this process through scripts that could process these dependency files and check if dependencies have been installed
    - [X] Test benches for components should be automatically executed upon installation to validate a working component.

3. Documentation is in PDF table that specifies the module name, dependencies, inputs, outputs, and an English description of the component.  
    - [X] Alternative environment for documentation like Unix “man” pages.

4. See the [open issues](https://github.com/apast005/QMS/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

This is my first time trying Shell Scripting to automate a task.  Any feedback/suggestions is greatly appreciated and I thank you for taking the time
to help me grow and provide a contribution to the open source community.

Below is a template from a README template I used that is listed in Acknowledgments
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Alex Pastoriza - apast005@fiu.edu

Project Link: [https://github.com/apast005/QMS](https://github.com/apast005/QMS)



<!-- REFERENCES -->
## References

* [Intel Installation Guide](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/quartus_install.pdf#page=12&zoom=auto,-207,693)
* [Intel Quick Start Guide](https://fpgasoftware.intel.com/static/quick_start_guide/quick_start_guide_20.1_en.pdf)
* [Quartus Manual](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/quartus_install.pdf)
* [Intel Installation FAQS](https://www.intel.com/content/www/us/en/programmable/downloads/software/faq/installation-faq.html?erpm_id=8905536_ts1601556901225#_Toc361418227)
* [Intel's Download Center](https://fpgasoftware.intel.com/20.1/?edition=lite)
* [Intel's Terminal Guide](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/manual/tclscriptrefmnl.pdf)



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
* [Template for README](https://github.com/othneildrew/Best-README-Template/blob/master/BLANK_README.md)
* [Jens Schweikhardt How To](https://tldp.org/HOWTO/Man-Page/q3.html)
* [Troubleshooting Guide ModelSim](https://profile.iiita.ac.in/bibhas.ghoshal/COA_2020/Lab/ModelSim%20Linux%20installation.html)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/apast005/QMS.svg?style=flat-square
[contributors-url]: https://github.com/apast005/QMS/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/apast005/QMS.svg?style=flat-square
[forks-url]: https://github.com/apast005/QMS/network/members
[stars-shield]: https://img.shields.io/github/stars/apast005/QMS.svg?style=flat-square
[stars-url]: https://github.com/apast005/QMS/stargazers
[issues-shield]: https://img.shields.io/github/issues/apast005/QMS.svg?style=flat-square
[issues-url]: https://github.com/apast005/QMS/issues
[license-shield]: https://img.shields.io/github/license/apast005/QMS.svg?style=flat-square
[license-url]: https://github.com/apast005/QMS/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-blue.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/alexander-pastoriza
[product-screenshot]: images/screenshot.png
