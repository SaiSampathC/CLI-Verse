#!/bin/bash

GREEN="\e[38;5;46m"
RED="\e[38;5;196m"
BLUE="\e[38;5;33m"
YELLOW="\e[38;5;220m"
RESET="\e[0m"

flicker_text() {
    local text="$1"
    for i in {1..3}; do
        echo -ne "\r${GREEN}${text:0:$i}   \r"
        sleep 0.05
    done
    echo -e "${GREEN}${text}${RESET}"
}

glitch_loading() {
    echo -ne "${BLUE}>> INITIATING SYSTEM LINK "
    for i in {1..10}; do
        echo -ne "#"
        sleep 0.07
    done
    echo -e " ${RESET}[${GREEN}OK${RESET}]"
}

print_header() {
    clear
    echo -e "${RED}"
    echo "============================="
    echo -e "  🌐 CLI-VERSE: TERMINAL CORE"
    echo -e "=============================${RESET}"
    echo -e "${YELLOW}>> $1${RESET}\n"
}

glitch_error() {
    echo -e "${RED}[ERR] SYSTEM MALFUNCTION: $1${RESET}"
}

divider() {
    echo -e "${BLUE}----------------------------------------${RESET}"
}

