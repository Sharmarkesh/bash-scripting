#!/bin/bash
#Create a script that checks if a file exists and displays its permissions.
#Requirements:
#Prompt user for a filename
#Check if the file exists
#If it exists, check if it's readable, writable, and executable
#Display appropriate messages for each permission
#Example output:
#Enter filename to check: /etc/passwd
#File '/etc/passwd' exists. ✓ File is readable ✓ File is writable ✗ File is not executable
echo "============================================="
echo "  Date: $(date +%Y-%m-%d)   Time: $(date +%H:%M:%S)"
echo "============================================="


# Prompt user for filename
read -p "Enter filename to check : " filename

# Check if the file exists
if [ -e "$filename" ]; then
    if [ -f "$filename" ]; then
    echo "✔  File '$filename' EXISTS."
    ##check_permissions "$filename" "file"
          else
          echo ""
   fi
   else
   echo ""
fi

if [ -e "$filename" ]; then
    if [ -d "$filename" ]; then
    echo "✔  File '$filename' EXISTS and directory."
    ##check_permissions "$filename" "file"
          else
          echo ""
   fi
   else
   echo""
fi

    
    #Check_permissions(){
    # Check READ file permission
    if [ -r "$filename" ]; then
        echo "   ✔ File is readable"
    else
        echo "   ✘  File is not readable"
    fi

    # Check WRITE file permission
    if [ -w "$filename" ]; then
        echo "   ✔ File is writable"
    else
        echo "   ✘ File is not writable"
    fi

    # Check EXECUTE file permission
    if [ -x "$filename" ]; then
        echo "   ✔  File is executable"
    else
        echo "   ✘  File is not executable"
    fi
    

    