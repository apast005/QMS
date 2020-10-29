#!/bin/bash

for i in `cat Repo_Names` 
	do
		groff -man -Tascii -tbl $i.7.gz > $i.txt
		
	done
