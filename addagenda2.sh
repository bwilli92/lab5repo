#!/bin/sh
# agenda--Scans through the user's .agenda file to see if there
# are matches for the current or next day
agendafile="$HOME/.agenda"
checkDate()
{
# Create the possible default values that will match today.
weekday=$1 day=$2 month=$3 year=$4
format1="$weekday" format2="$day$month" format3="$day$month$year"
# And step through the file comparing dates...
IFS="|" # The reads will naturally split at the IFS.
echo "On the agenda for today:"
while read date description ; do
if [ "$date" = "$format1" -o "$date" = "$format2" -o \
"$date" = "$format3" ]
then
echo " $description"
fi
done < $agendafile
}
if [ ! -e $agendafile ] ; then
echo "$0: You don't seem to have an .agenda file. " >&2
echo "To remedy this, please use 'addagenda' to add events" >&2
exit 1
fi
# Now let's get today's date...
eval $(date '+weekday="%a" month="%b" day="%e" year="%G"')
day="$(echo $day|sed 's/ //g')" # Remove possible leading space.
checkDate $weekday $day $month $year
exit 0
