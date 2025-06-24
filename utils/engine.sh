# utils/engine.sh

source utils/ui.sh

PLANETS=(
  "git-labyrinth"
  "docktar"
  "firewall-x"
  "cron-crater"
  "perm-sigma"
)

start_cli_verse() {
  print_header "CLI-VERSE: Cosmic Command Console"

  XP_FILE="assets/save/progress.log"
  if [[ -f "$XP_FILE" ]]; then
    XP=$(grep "XP=" "$XP_FILE" | cut -d '=' -f2)
    show_rank "$XP"
  fi

  while true; do
    echo -e "\n${CYAN}🌌 Available Planets:${RESET}"
    select planet in "${PLANETS[@]}" "Exit"; do
      if [[ "$planet" == "Exit" ]]; then
        echo -e "${YELLOW}Exiting CLI-VERSE. Until next mission...${RESET}"
        exit 0
      elif [[ -n "$planet" ]]; then
        travel_to "$planet"
        break
      else
        echo -e "${RED}Invalid choice. Choose a number from the list.${RESET}"
      fi
    done
  done
}

travel_to() {
  local planet="$1"
  case $planet in
    git-labyrinth)
      bash planets/git-labyrinth.sh
      ;;
    docktar)
      bash planets/docktar.sh
      ;;
    firewall-x)
      bash planets/firewall-x.sh
      ;;
    cron-crater)
      bash planets/cron-crater.sh
      ;;
    perm-sigma)
      bash planets/perm-sigma.sh
      ;;
    *)
      glitch_error "Unknown planet '$planet'"
      ;;
  esac
}

complete_mission() {
  echo -e "${GREEN}>> Mission status: COMPLETE${RESET}"
  XP_FILE="assets/save/progress.log"

  if [[ -f "$XP_FILE" ]]; then
    XP=$(grep "XP=" "$XP_FILE" | cut -d '=' -f2)
    NEW_XP=$((XP + 10))
    echo "XP=$NEW_XP" > "$XP_FILE"
    echo -e "${YELLOW}>> Gained 10 XP! Total: $NEW_XP XP${RESET}"
    show_rank "$NEW_XP"
  fi
}

show_rank() {
  local xp=$1
  local rank=""

  if (( xp < 30 )); then
    rank="Shell Cadet"
  elif (( xp < 60 )); then
    rank="Kernel Operative"
  elif (( xp < 100 )); then
    rank="Root Architect"
  else
    rank="SysGod"
  fi

  echo -e "${BLUE}>> Rank: $rank${RESET}"
}

