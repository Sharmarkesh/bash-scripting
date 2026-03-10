#!/bin/bash


#Here’s a simple Bash script that reads a filename from user input and echoes the full file path.
#How it works
#read -p prompts the user to enter a filename.
#realpath converts the filename into the absolute path.
#echo prints the path.

# ============================================================
#  FIND FILES & DISPLAY THEIR PATH
#Let's begun
# ============================================================

# Prompt user for filename
read -p "Enter filename to check : " filename

# Search for the file starting from root directory
echo "Searching for $filename ..."
 #Get full path
filepath=$(realpath "$filename")

 #echo the file path
echo "File path: $filepath"


