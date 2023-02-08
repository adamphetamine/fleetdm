# fleet-upgrade.sh
This script will download new versions of Fleet and fleetctl, 
stop the fleet service, 
back up the old files,
replace the binaries,
add the ability for Fleet to run on well known ports
and then restart Fleet.

It is extensively commented, if you can improve it please do and let me know so I can learn.

# fleet_client.sh
This script will use the variables in the execution command to create a file in an appropriate directory for both Mac and Linux.
Warning- I hard coded my business name 'Servicemax' as one of the directories so I can remove it from client machines easily. You can either modify the script or wait until I do a more generic version, but that might be a while...
Why? 
So we can read back the prefs file later and make these variables into tags that FleetDM can use
- new improved version will work on Linux too

Method
You can make your own variables, however we chose these-
COMPANYGROUP="$1"
COMPANY="$2"
BUSINESSUNIT="$3"
LOCATION="$4"
CUSTOM1="$5"

So to create a .env file with some variables added, you could execute something like 

sudo sh ./fleet_client.sh "YumBrands" "KFC" "Chook_Cook" "Sydney" "MyCustomvalue"


# clientprefs.sh
This version is basically deprecated now but works the same way as the one above. It's output is a .plist instead of more generic .env and it only works on Macs.
