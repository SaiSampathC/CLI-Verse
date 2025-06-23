#!/bin/bash
source utils/ui.sh
source utils/engine.sh

print_header "🛸 PLANET DOCKTAR"

echo -e "${GREEN}Mission:${RESET} Fix a corrupted Dockerfile."
echo -e "${YELLOW}Hint:${RESET} One instruction is broken."

tmp="/tmp/docktar"
rm -rf "$tmp"
mkdir "$tmp"
cd "$tmp"

cat > Dockerfile <<EOF
FROM alpine
COPY script.sh /start.sh
CMDD ["sh", "/start.sh"]
EOF

cat > script.sh <<EOF
echo "Container booted"
EOF

chmod +x script.sh

echo -e "\nFix the Dockerfile. When ready, type: ${GREEN}touch build_success${RESET} to simulate a build."
$SHELL

[[ -f build_success ]] && complete_mission || glitch_error "Fake build failed. Try again."

