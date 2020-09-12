#Name: Justin Nikles
#Description: This script prints integers in a sequence by increment of 1 by default, or by a given increment

#setting error message types so that I don't have to type it in multiple places
range_err="Error: $0 bad range"
usage_err="Usage: $0 first [inc] last"

#check that all inputs are ints

for arg in "$@"
do
	if [ "$arg" -eq "$arg" ]
	then
		:
	else
		echo "$usage_err" 1>&2
		exit 1
	fi	
done	


if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]
then
	echo "$usage_err" 1>&2
	exit 1
fi

#initial setting of variables and checking for errors
if [ "$#" -eq 3 ]
then
	#checking errors specific to the case that a user provided increment
	if [ "$2" -eq 0 ] && [ "$1" -ne "$3" ]
	then
		echo "$range_err" 1>&2
		exit 2
	elif [ "$1" -lt "$3" ] && [ "$2" -lt 0 ] 
	then
		echo "$range_err" 1>&2
		exit 3
	elif [ "$1" -gt "$3" ] && [ "$2" -gt 0 ]	
	then
		echo "$range_err" 1>&2
		exit 4
	elif [ "$1" -eq "$3" ]
	then	
		if [ "$2" -ne 0 ] 
		then	
			echo "$range_err" 1>&2
		else
			echo "$1"
			exit
		fi	
		exit 5	
	else
		a="$1"
        	i="$2"
		b="$3" 	 
	fi
fi
if [ "$#" -eq 2 ]
then
	a="$1"
	b="$2"
	if [ ! "$a" -gt "$b" ]
	then
		i=1
	else
		i=-1 
	fi
fi

if [ "$a" -gt "$b" ]
then
while [ ! "$a" -lt "$b" ]
do
	echo "$a"
	a=$(($a+$i))
done
else
while [ ! "$a" -gt "$b" ]
do
	echo "$a"
	a=$(($a+$i))
done
fi
exit
