#!/bin/bash
source utils/ui.sh
source utils/engine.sh

print_header "🛡️ PLANET FIREWALL-X"

echo -e "${GREEN}Mission:${RESET} Fix a firewall.rules file to block port 8080."
echo -e "${YELLOW}Hint:${RESET} It should DROP, not ACCEPT."

tmp="/tmp/firewall-x"
rm -rf "$tmp"
mkdir "$tmp"
cd "$tmp"

cat > firewall.rules <<EOF
-A INPUT -p tcp --dport 22 -j ACCEPT
-A INPUT -p tcp --dport 8080 -j ACCEPT
EOF

echo -e "\nEdit firewall.rules and change port 8080 rule to DROP."
echo -e "When you're done, type: ${GREEN}touch rules_fixed${RESET}"

$SHELL

grep -q "8080.*DROP" firewall.rules && [[ -f rules_fixed ]] && complete_mission || glitch_error "Port 8080 is still wide open."

