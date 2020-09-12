#Name: Justin Nikles
#Description: This script pushes the first N lines from input to the last N lines of output

if [ "$#" -ne 2 ]; then
	echo "Expected 2 arguments, but received $#" 1>&2
	exit 1
else
	t=$(($1+1))
	tail -n +$t $2
	head -n $1 $2
fi
exit
