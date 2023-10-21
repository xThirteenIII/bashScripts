#!/bin/bash
#
#
#
#
separator() {
	printf "\n------------------------------\n"
}

displayMenu() {
	printf "c++ compile and run:"
	separator
	printf "1 - ls files in current folder"
	printf "\n2 - compile .cpp file(s)"
	printf "\n3 - link -o file(s)"
	printf "\n4 - run exec binary file"
	printf "\nq - quit"
	separator
}

invalidChoiceMessage() {
	printf "\nInvalid choice, please select one of the following:"
}

# Need to show menu once, then if selection is invalid,
# display message + new menu.
displayMenu
read userChoice

# Additional "" quoting and separate sets of brackets used for
# other shells portability.
while [[ "$userChoice" != "q" ]] && [[ "$userChoice" -lt 1 || "$userChoice" -gt 4 ]]; do
	invalidChoiceMessage
	separator
	displayMenu
	read userChoice
done

while :; do
	case $userChoice in

	1)
		printf "\nFiles in $PWD:"
		separator
		ls
		;;
	2)
		separator
		printf "\nType file(s) to compile: "
		read fileToCompile
		;;
	3)
		separator
		printf "\nlinking"
		;;
	4)
		separator
		printf "\nrunning"
		;;
	"q")
		exit
		;;
	*)
		separator
		printf "\ninvalid selection\n"
		;;
	esac

	[[ "$userChoice" -lt 1 ]] || [[ "$userChoice" -gt 4 ]] || break
done

#printf "\nType executable file name to generate: "
#read execFile

#printf "\nCompiling $fileToCompile..."

#g++ -Wall -std=c++14 $fileToCompile -o $execFile

#printf "\nRunning $execFile...\n"

#./$execFile
