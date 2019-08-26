#!/bin/bash

# Create temp files to store intermediate values
temp=$(mktemp -t test2.XXXXX)
temp2=$(mktemp -t test2.XXXXX)




# Define functions
function makeFileExec {
  zenity --info --text="Making file executable" --width 300 --height 10
  chmod $fileName u+x
  zenity --info --text="Made file executable:$?" --width 300 --height 10
}
function makeFileWriteable {
  zenity --info --text="Making file writeable"  --width 300 --height 10
  chmod $fileName u+w
  zenity --info --text="Made file writeable:$?" --width 300 --height 10
}
function makeFileReadable {
  zenity --info --text="Making file readable"  --width 300 --height 10
  chmod $fileName u+r
  zenity --info --text="Made file readable:$?" --width 300 --height 10
}

function doesFileExist {
  fileName=$(zenity --entry --title="Does this file exist" --text="Please enter the name of the file:")

  if test -f $fileName
  then
    zenity --info --text="File exists: $fileName \\n `ls -l $fileName`"  --width 300 --height 10
  else
    zenity --info --text="That file -> $fileName doesn't exist. Here are your files:\\n`ls -l | awk '{print \$9}'`" --width 200 --height 100
  fi
}

function doesDirectoryExist {
  dirName=$(zenity --entry --title="Does this directory exist" --text="Please enter the name of the directory:")

  if test -d $dirName
  then
    zenity --info --text="Directory exists: $dirName \\n `ls -l $dirName`"  --width 300 --height 10
  else
    zenity --info --text="That directory -> $dirName doesn't exist. Here are your directories:\\n`ls -l | grep "^d" `" --width 200 --height 100
  fi
}
function listAllFiles {
  zenity --info --text="Listing all files: \n`ls -l`" --width 400 --height 100
}
function showDateAndTime {
  zenity --info --text="Date and Time: \n`date`" --width 200 --height 100
}
function changeFilePermission {
  fileName=$(zenity --entry --title="Change file permission of file" --text="Please enter the name of the file:")

  # Does the file exist
  if test ! -f $fileName
  then
    zenity --info --text="That file -> $fileName doesn't exist. Here are your files:\\n`ls -l | awk '{print \$9}'`" --width 200 --height 100
  fi

  zenity --list --radiolist --title "File Permission Menu" --column "Selection" --column "Menu Item" FALSE "Make file executable" FALSE "Make file write-able" FALSE "Make file readable" FALSE "Exit" > $temp2
  selection2=$(cat $temp2)

  case $selection2 in
  "Make file executable")
    makeFileExec $fileName;;
  "Make file write-able")
    makeFileWriteable $fileName;;
  "Make file readable")
    makeFileReadable $fileName;;
  "Exit")
    break ;;
  *)
    zenity --info "Sorry, invalid selection"
  esac
}

while [ 1 ]
do
  zenity --list --radiolist --title "Admin Menu" --column "Select" --column "Menu Item" FALSE "Check if a file exists" FALSE "Check if a directory exists" FALSE "List all files" FALSE "Get the date & time" FALSE "Change permission on a file" FALSE "Exit" > $temp

  # If not successfull
  if [[ $? -eq 1 ]]; then
    break;
  fi

  selection=$(cat $temp)

  case $selection in
  "Check if a file exists")
    doesFileExist ;;
  "Check if a directory exists")
    doesDirectoryExist ;;
  "List all files")
    listAllFiles ;;
  "Get the date & time")
    showDateAndTime ;;
  "Change permission on a file")
    changeFilePermission ;;
  "Exit")
    break ;;
  *)
    zenity --info "Sorry, invalid selection"
  esac
done






# File cleanup
rm -f $temp  2> /dev/null
rm -f $temp2 2> /dev/null