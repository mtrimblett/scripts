#!/bin/bash
# ip a | grep "scope global tun0" | cut -d ' ' -f 6 | cut -d '/' -f 1
# Get the IP address of the tun0 interface

# Define the purple colour
purple=$(tput setaf 5)

# Reset color back to normal
no_colour=$(tput sgr0)

ip_address=$(ip a | grep "scope global tun0" | cut -d ' ' -f 6 | cut -d '/' -f 1)

# Print the IP address
echo "The IP address of the tun0 interface is: ${purple}$ip_address${no_colour}"

# Copy the IP address to the clipboard
echo $ip_address | xclip -r -selection clipboard

# Print a success message
echo "The IP address of the tun0 interface has been copied to the clipboard."
