#!/bin/bash

#--------------------------------
#******** CLI-UniVerse*********
#Author: SaiSampathC
#--------------------------------

source utils/ui.sh
source utils/engine.sh

start_cli_verse

#show_intro
#load_map

while true; do
    echo -ne "\n🚀 Enter destination (planet name or 'exit'): "
    read planet
    if [[ "$planet" == "exit" ]]; then
        echo "🌌 Logging out of the CLI-Verse..."
        exit 0
    fi
    travel_to "$planet"
done

