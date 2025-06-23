#!/bin/bash
source utils/ui.sh
source utils/engine.sh

print_header "🌀 GIT-LABYRINTH"

echo "Mission: Recover a lost file from the Git timeline."
echo "Clue: Use 'git reflog' to find the deleted commit."

tmp="/tmp/git-lab"
rm -rf "$tmp"
mkdir "$tmp"
cd "$tmp"
git init -q

echo "secret formula" > formula.txt
git add . && git commit -m "Add formula"
git rm formula.txt && git commit -m "Remove formula"

echo -e "${BLUE}>> You are now inside a broken Git repo."
echo -e "${GREEN}Restore formula.txt. Then exit this shell to complete the mission.${RESET}"

$SHELL

[[ -f formula.txt ]] && complete_mission || glitch_error "File not recovered from timeline."

