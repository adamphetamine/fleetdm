#!/bin/bash

# Example- sudo sh ./clientprefs.sh "YumBrands" "KFC" "Chook_Cook" "Sydney" "MyCustomvalue"
VERSION=1.00
COMPANYGROUP="$1"
COMPANY="$2"
BUSINESSUNIT="$3"
LOCATION="$4"
CUSTOM1="$5"

cat > com.servicemax.clientprefs.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>CompanyGroup</key>
        <string>$COMPANYGROUP</string>
        <key>Company</key>
        <string>$COMPANY</string>
        <key>BusinessUnit</key>
        <string>$BUSINESSUNIT</string>
        <key>Location</key>
        <string>$LOCATION</string>
        <key>Custom1</key>
        <string>$CUSTOM1</string>
</dict>
</plist>
EOF
