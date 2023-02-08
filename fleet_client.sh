#!/bin/sh

# Get the host operating system information
OS=$(uname -s)

# Define the input arguments
COMPANYGROUP="$1"
COMPANY="$2"
BUSINESSUNIT="$3"
LOCATION="$4"
CUSTOM1="$5"

# Define the contents of the file
file_contents="COMPANYGROUP=$COMPANYGROUP
COMPANY=$COMPANY
BUSINESSUNIT=$BUSINESSUNIT
LOCATION=$LOCATION
CUSTOM1=$CUSTOM1"

# Determine the target directory based on the host operating system
if [ "$OS" == "Darwin" ]; then
  target_dir="/Library/Application Support/Servicemax"
elif [ "$OS" == "Linux" ]; then
  target_dir="/opt/Servicemax"
else
  echo "Unsupported operating system: $OS"
  exit 1
fi

# Create the target directory if it doesn't exist
if [ ! -d "$target_dir" ]; then
  mkdir -p "$target_dir"
fi

# Define the path to the file
file_path="$target_dir/fleet_client.env"

# Write the contents to a file
echo "$file_contents" > "$file_path"
