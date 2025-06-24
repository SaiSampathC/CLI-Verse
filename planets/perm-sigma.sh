#!/bin/bash
source utils/ui.sh
source utils/engine.sh

print_header "🔐 PLANET PERM-SIGMA: BROKEN PERMISSIONS"

echo -e "${YELLOW}Alert:${RESET} Planet's core script is unexecutable."
echo -e "${GREEN}Mission:${RESET} Fix permissions so 'run.sh' can execute."

tmp="/tmp/perm-sigma"
rm -rf "$tmp"
mkdir -p "$tmp"
cd "$tmp"

echo -e "#!/bin/bash\necho 'Mission passed: file executed'" > run.sh

chmod 644 run.sh  # intentionally broken

echo -e "${BLUE}>> 'run.sh' is missing execute permission."
echo -e "${GREEN}Fix it, then run it. If it works, run: ${YELLOW}touch mission_ready${RESET} and exit."

$SHELL

if [[ -x run.sh ]] && [[ -f mission_ready ]]; then
    complete_mission
else
    glitch_error "Permissions still incorrect or run.sh not executed."
fi

