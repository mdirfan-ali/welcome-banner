#!/bin/bash

echo "========================================="
echo "Keep THE patiencE aNd be DiscipLINEd"
echo "========================================="

# Color codes
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

name="Homo sapiens"
today=$(date "+%A, %d %B %Y")
now=$(date "+%I:%M %p")

echo -e "${GREEN}===================================${RESET}"
echo -e "       ${YELLOW}Welcome back, $name!${RESET}"
echo -e "${GREEN}-----------------------------------${RESET}"
echo -e "   ${CYAN}Date :${RESET} $today"
echo -e "   ${CYAN}Time :${RESET} $now"
echo -e "${GREEN}===================================${RESET}"

echo  -e "  ${CYAN} Today's tasks:${RESET}"

if [ -f "$HOME/shell/intro/todo.md" ]; then
	cat "$HOME/shell/intro/todo.md"
else
	echo " (No todo found -- find new task!)"
fi


echo -e "${GREEN}===================================${RESET}"










