#! /bin/bash


# Delayed invocation Root
(( __reinvoked )) || exec sudo -s __reinvoked=1 "$BASH_SOURCE" "$@"

# kill running Pulse processes
pgrep Pulse | xargs kill

# Change perm on files to be deleted
chmod +rwx /Applications/'Pulse Secure.app'/

chmod +rwx /Library/'Application Support'/'Pulse Secure'/

#if error or success return this message
if rm -rd /Applications/'Pulse Secure.app'/Contents/ && rm -rd /Applications/'Pulse Secure.app'/ && rm -rd /Library/'Application Support'/'Pulse Secure'/ && rm -rd '~/Library/Application Support/Juniper Networks/';
then
    sleep 3
    echo "Removal complete."
else
    sleep 3
    echo "An error occurred. Please try again."
fi 
