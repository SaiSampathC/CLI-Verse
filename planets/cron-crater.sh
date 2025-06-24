#!/bin/bash
source utils/ui.sh
source utils/engine.sh

print_header "🕒 PLANET CRON-CRATER: BROKEN TIME RIFT"

echo -e "${YELLOW}Warning:${RESET} Mission logs show a system script isn’t running on schedule."
echo -e "${GREEN}Mission:${RESET} Fix the crontab so the `backup.sh` script runs every minute.\n"

# Create simulation environment
tmp="/tmp/cron-crater"
rm -rf "$tmp"
mkdir -p "$tmp"
cd "$tmp"

cat > backup.sh <<EOF
#!/bin/bash
echo "backup success" >> backup.log
EOF

chmod +x backup.sh

# Simulate a broken crontab file
cat > crontab.broken <<EOF
# m h dom mon dow command
* * * * bash /tmp/cron-crater/backup.sh
EOF

echo -e "${BLUE}>> You are now in a broken cron system lab."
echo -e "${GREEN}Fix crontab.broken so it uses full path to bash, and run: ${YELLOW}touch mission_ready${RESET}"
echo -e "${YELLOW}Then exit the shell to complete the mission.${RESET}"

$SHELL

if grep -q "/bin/bash" crontab.broken && [[ -f mission_ready ]]; then
    complete_mission
else
    glitch_error "Time rift remains unstable. Crontab not repaired."
fi

