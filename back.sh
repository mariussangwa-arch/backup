#!/bin/bash

read -p "Enter the folder path: " path
path=${path:-$HOME/Documents}

if [ ! -d "$path" ]; then
  echo "The folder is invalid"

read -p "Do you want to create $path? [y/n]: " choice

if [ "$choice" = "y" ]; then
  echo "Creating the folder..."
  sleep 2
  mkdir -p "$path"
  echo "Folder created"

else
  echo "The backup has been cancelled"

exit 1
   fi
fi

back="$HOME/backup"
mkdir -p "$back"

date=$(date +%Y)
dir_name=$(basename "$path")_"$date"
echo "Backing up your folder, just a few seconds...."
sleep 2
cp -r "$path" "$back/$dir_name"
echo "Backup saved to $back/$dir_name"
