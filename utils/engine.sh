#!/bin/bash

save_file="assets/save/progress.log"

init_save_file() {
    mkdir -p assets/save
    [[ ! -f "$save_file" ]] && echo "missions_completed=0" > "$save_file"
}

load_progress() {
    source "$save_file"
    echo -e "${BLUE}>> Missions Completed: ${GREEN}${missions_completed}${RESET}"
}

complete_mission() {
    ((missions_completed++))
    echo "missions_completed=$missions_completed" > "$save_file"
    echo -e "${YELLOW}>> Mission status: ${GREEN}COMPLETE${RESET}"
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
        *)
            glitch_error "Unknown planet '$planet'"
            ;;
    esac
}

load_map() {
    divider
    cat assets/map.txt
    divider
}

show_intro() {
    init_save_file
    print_header "BOOTING CLI-VERSE SYSTEM CORE"
    glitch_loading
    load_progress
    echo ""
    flicker_text ">>> WELCOME, CADET. TYPE A PLANET TO TRAVEL."
}

