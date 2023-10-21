#!/bin/bash
#
#
#
#

printf "c++ compile and run:"

separator() {
	printf "\n------------------------------\n"
}

# Linux and unix type terminals
# TODO: add win and mac $OSTYPE compatibility.
clearScreen() {
	clear
}

displayMenu() {
	separator
	printf "1 - ls files in current folder"
	printf "\n2 - compile a single .cpp file into obj file"
	printf "\n3 - compile all .cpp files into exec binary file"
	printf "\n4 - link all .o file(s)"
	printf "\n5 - run exec binary file"
	printf "\nq - quit"
	separator
}

invalidChoiceMessage() {
	printf "\nInvalid choice, please select one of the following:"
}

# Wall stands for warning all
compileGpp() {
	separator
	printf "Compiling $1\n"
	g++ -Wall -std=c++14 -c $1 -o $2.o
}

compileAllGpp() {
	separator
	printf "Compiling all .cpp files in $PWD\n"
	g++ -Wall -std=c++14 *.cpp -o $1
}

execFile() {
	separator
	printf "Executing $1\n"
	./$1
}

# Not a great solution if obj files are not named .o but for now
# should work.
linkObjFiles() {
	g++ *.o -o $1
	separator
	printf "\nCreated $1 exec file"
}

# Need to show menu once, then if selection is invalid,
# display message + new menu.
displayMenu
read userChoice

# Additional "" quoting and separate sets of brackets used for
# other shells portability.
# I know it's ugly using a char instead of a number for quitting,
# but q feels so good.
while [[ "$userChoice" != "q" ]] && [[ "$userChoice" -lt 1 || "$userChoice" -gt 4 ]]; do
	clearScreen
	invalidChoiceMessage
	displayMenu
	read userChoice
done

while :; do
	case $userChoice in

	1)
		clearScreen
		printf "\nFiles in $PWD:"
		ls
		displayMenu
		read userChoice
		;;
	2)
		clearScreen
		# TODO: check if file exists in folder
		printf "Type file to compile: "
		read fileToCompile
		printf "\nType output file name: "
		read outputFileName
		compileGpp $fileToCompile $outputFileName
		printf "\nCreated $outputFileName.o file"
		displayMenu
		read userChoice
		;;
	3)
		# TODO: fix behaviour if there's no .cpp files in folder
		clearScreen
		printf "Type output file name for your executable: "
		read execFileName
		compileAllGpp $execFileName
		printf "Created $execFileName executable"
		displayMenu
		read userChoice
		;;
	4)
		# TODO: fix behaviour if there's no .o files in folder
		clearScreen
		printf "Type output file name for your executable: "
		read execFileName
		linkObjFiles $execFileName
		printf "\nCreated $execFileName executable file"
		printf "\nIf you can't exec the file, be sure it has x permissions"
		displayMenu
		read userChoice
		;;
	5)
		# TODO: check if file exists in folder
		clearScreen
		printf "Type exec file to run: "
		read execFileName
		execFile $execFileName
		exit
		;;
	"q")
		exit
		;;
	*)
		clearScreen
		printf "invalid selection\n"
		displayMenu
		read userChoice
		;;
	esac

	[[ "$userChoice" -gt 1 ]] || [[ "$userChoice" -lt 4 ]] || break
done

#printf "\nType executable file name to generate: "
#read execFile

#printf "\nCompiling $fileToCompile..."

#printf "\nRunning $execFile...\n"

#./$execFile
