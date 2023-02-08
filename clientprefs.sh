#!/bin/sh

# Get the host operating system information
OS=$(uname -s)

# Define the input arguments
COMPANYGROUP="$1"
COMPANY="$2"
BUSINESSUNIT="$3"
LOCATION="$4"
CUSTOM1="$5"

# Define the contents of the .plist file
plist_contents="<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>COMPANYGROUP</key>
    <string>$COMPANYGROUP</string>
    <key>COMPANY</key>
    <string>$COMPANY</string>
    <key>BUSINESSUNIT</key>
    <string>$BUSINESSUNIT</string>
    <key>LOCATION</key>
    <string>$LOCATION</string>
    <key>CUSTOM1</key>
    <string>$CUSTOM1</string>
</dict>
</plist>"

# Determine the target directory based on the host operating system
if [ "$OS" == "Darwin" ]; then
  target_dir="/Application Support/Servicemax"
elif [ "$OS" == "Linux" ]; then
  target_dir="/opt"
else
  echo "Unsupported operating system: $OS"
  exit 1
fi

# Create the target directory if it doesn't exist
if [ ! -d "$target_dir" ]; then
  mkdir -p "$target_dir"
fi

# Define the path to the .plist file
plist_path="$target_dir/com.servicemax.clientprefs.plist"

# Write the contents to a file
echo "$plist_contents" > "$plist_path"
