# fleet-upgrade.sh
This script will download new versions of Fleet and fleetctl, 
stop the fleet service, 
back up the old files,
replace the binaries,
add the ability for Fleet to run on well known ports
and then restart Fleet.

It is extensively commented, if you can improve it please do and let me know so I can learn.

# clientprefs.sh
This script will use the variables in the execution command to create a .plist file in the working directory.
Why? 
So we can read back the prefs file later and make these variables into tags that FleetDM can use

Method
You can make your own variables, however we chose these-
COMPANYGROUP="$1"
COMPANY="$2"
BUSINESSUNIT="$3"
LOCATION="$4"
CUSTOM1="$5"

So to create a .plist file with some variables added, you could execute something like 

sudo sh ./clientprefs.sh "YumBrands" "KFC" "Chook_Cook" "Sydney" "MyCustomvalue"
