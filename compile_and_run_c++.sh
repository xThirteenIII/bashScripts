#!/bin/bash
#
#
#
#
separator() {
	printf "\n-----------------------\n"
}

displayMenu() {
	printf "c++ compile and run:\n"
	printf "1 - ls files in current folder"
	printf "\n2 - compile .cpp file(s)"
	printf "\n3 - link -o file(s)"
	printf "\n4 - run exec binary file\n"
	separator
}

# Need to show menu once, then if selection is invalid,
# display message + new menu.
displayMenu
read userChoice

# Additional "" quoting and separate sets of brackets used for
# other shells portability.
while [[ "$userChoice" -lt 1 ]] || [[ "$userChoice" -gt 4 ]]; do
	printf "\nInvalid choice, please select one of the following:"
	separator
	displayMenu
	read userChoice
done

while :; do
	case $userChoice in

	1)
		ls
		;;
	2)
		printf "\nType file(s) to compile: "
		read fileToCompile
		;;
	3)
		printf "\nlinking"
		;;
	4)
		printf "\nrunning"
		;;
	*)
		printf "\ninvalid selection\n"
		;;
	esac

	[[ ($userChoice -lt 1 && $userChoice -gt 4) ]] || break
done

#printf "\nType executable file name to generate: "
#read execFile

#printf "\nCompiling $fileToCompile..."

#g++ -Wall -std=c++14 $fileToCompile -o $execFile

#printf "\nRunning $execFile...\n"

#./$execFile
