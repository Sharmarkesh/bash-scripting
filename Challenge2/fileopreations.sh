#!/bin/bash
#Create a script that automates directory and file creation.
#Requirements:
#Create a directory called bash_demo
#Navigate into the directory
#Create a file called demo.txt
#Write text to the file (include current date)
#Display the file contents
#Example output:
#Directory 'bash_demo' created. File 'demo.txt' created.
#File contents: This file was created by a Bash script on 2024-11-29


mkdir  bash_demo
cd bash_demo
touch demo.txt
# Store date in a variable
current_date=$(date +%Y-%m-%d)
# Write to file (overwrite)
echo "This file was created on $current_date" >> demo.txt
cat demo.txt
