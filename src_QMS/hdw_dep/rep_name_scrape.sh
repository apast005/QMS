#!/bin/bash

#####################################################################
#####################################################################
# Repository Title Scrape | Used for Menu Creation
# GitHub: https://github.com/FIUSCIS-CDA?tab=repositories
# Script_Version 0.01
# Author: apast005
#####################################################################
#####################################################################

## FIXME: Find a way to do this dynamically incase more pages get added
# FIUCIS-CDA Repository Urls
repo_url_pg1="https://github.com/FIUSCIS-CDA?tab=repositories"
repo_url_pg2="https://github.com/FIUSCIS-CDA?after=Y3Vyc29yOnYyOpK5MjAyMC0wOC0yMFQxMTowMToxNi0wNDowMM4RApK7&tab=repositories"

## Add check for curl on system
## Add check for html2text (possibly not needed but want to check later)
# Collect Page Source from repo Urls
# Parse order: html file > text file > lean text file grep > awk the Repo names
curl $repo_url_pg1 > tmp && curl $repo_url_pg2 >> tmp
html2text tmp tmp1
grep -e '    \* \*\*\*\* *' tmp1 > tmp
awk '$1=$1' tmp > Repo_Names
