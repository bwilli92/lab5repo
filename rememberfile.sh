#!/bin/bash
# remember--An easy command line-based reminder pad
rememberfile="$HOME/.remember"
if [ $# -eq 0 ] ; then
# Prompt the user for input and append whatever they write to
# the rememberfile.
echo "Enter note, end with ^D: "
cat - >> $rememberfile
else
# Append any arguments passed to the script on to the .remember file.
 echo "$@" >> $rememberfile
fi
exit 0
