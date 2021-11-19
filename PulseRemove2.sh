#! /bin/bash

# Root
# [[ $(id -u) -eq 0 ]] || exec sudo /bin/bash -c "$(printf '%q ' "$BASH_SOURCE" "$@")"

# Delayed invocation Root
(( __reinvoked )) || exec sudo -s __reinvoked=1 "$BASH_SOURCE" "$@"

# kill running Pulse processes
pgrep Pulse | xargs kill

# Change perm on files to be deleted
chmod +rwx /Applications/'Pulse Secure.app'/

chmod +rwx /Library/'Application Support'/'Pulse Secure'/

#if error or success return this message
if rm -rd /Applications/'Pulse Secure.app'/Contents/ && rm -rd /Applications/'Pulse Secure.app'/ && rm -rd /Library/'Application Support'/'Pulse Secure'/ && rm -rd ~/Library/Receipts/ ;
then
    echo "Removal complete."
    exit 0
else
    echo "An error occurred. Please try again."
    exit 1
fi 
