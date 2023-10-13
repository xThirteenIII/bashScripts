#!/bin/bash
#
#
printf "Files in current folder: "
ls

printf "\nType file to compile: "
read fileToCompile

printf "\nType executable file name to generate: "
read execFile

printf "\nCompiling $fileToCompile ..."

g++ -Wall -std=c++14 $fileToCompile $execFile

printf "\nRunning $execFile ..."

./$execFile


