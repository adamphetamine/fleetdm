#!/bin/bash

# with thanks to 'Mystery Incorporated' whose work I stole/ repurposed
# -assumptions-
# your os must have 'jq' installed for reading the JSON output to discover FleetDM version
# This script will be placed in /home/fleet/fleet-source and deposits the fleet and fleetctl binaries in /usr/bin/

# In this script
# $fleet_tag is the Github tagged version number example "fleet-v4.16.0"
# $version is the version number stripped from the tag, example "v4.16.0"

# Go to our working folder
cd /home/fleet/fleet-source/

# Delete the old downloads in this folder
rm -rf fleet_*
rm -rf fleetctl_*

# Find the current Fleetdm version
fleet_tag=$(curl -sL https://api.github.com/repos/fleetdm/fleet/releases/latest | jq -r ".tag_name")

echo current version of fleet is $fleet_tag

# oh noes, the version number is '-' and the binary is named '_'
# ok let's do some dirty work on the tag so we can add the version number properly
echo $fleet_tag | sed 's|.*\-\(.*\)|\1|'

version=$(echo $fleet_tag | sed 's|.*\-\(.*\)|\1|')

echo short version is $version

# let's download Fleet
curl -sL https://github.com/fleetdm/fleet/releases/download/"$fleet_tag"/fleet_"$version"_linux.tar.gz -o fleet_"$version"_linux.tar.gz

# Let's download Fleetctl
curl -sL https://github.com/fleetdm/fleet/releases/download/$fleet_tag/fleetctl_"$version"_linux.tar.gz -o fleetctl_"$version"_linux.tar.gz

# Expand Fleet
tar -xf fleet_"$version"_linux.tar.gz

# Expand Fleetctl
tar -xf fleetctl_"$version"_linux.tar.gz

echo ""
echo Stopping fleet service
echo ""
sudo service fleet stop

# prepare fleet database
/home/fleet/fleet-source/fleet_"$version"_linux/fleet prepare db --config /home/fleet/fleet.yml

# Remove old backups
rm -rf /usr/bin/fleet.bak/
rm -rf /usr/bin/fleetctl.bak/

# Create new backups
sudo mv /usr/bin/fleet /usr/bin/fleet.bak
sudo mv /usr/bin/fleetctl /usr/bin/fleetctl.bak

# Move our new binaries into place
sudo mv /home/fleet/fleet-source/fleet_"$version"_linux/fleet /usr/bin/fleet
sudo mv /home/fleet/fleet-source/fleetctl_"$version"_linux/fleetctl /usr/bin/fleetctl

# allow fleet to run on port 80 and 443
sudo setcap cap_net_bind_service=+ep /usr/bin/fleet

echo ""
echo Starting fleet service
echo ""
sudo service fleet start
echo Done


