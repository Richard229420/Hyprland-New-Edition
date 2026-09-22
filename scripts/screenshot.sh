#!/usr/bin/env bash

#################################################
# Screenshot
# Hyprland 0.56
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require grim slurp wl-copy notify-send

#################################################
# Diretórios
#################################################

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

mkdir -p "$SCREENSHOT_DIR"

#################################################
# Nome do arquivo
#################################################

FILE="$SCREENSHOT_DIR/Screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png"

#################################################
# Funções
#################################################

fullscreen() {

    grim "$FILE"

    wl-copy < "$FILE"

    notify \
        "Screenshot" \
        "Tela capturada."

}

region() {

    grim -g "$(slurp)" "$FILE"

    wl-copy < "$FILE"

    notify \
        "Screenshot" \
        "Região capturada."

}

active() {

    local geometry

    geometry="$(hyprctl activewindow -j \
        | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')"

    grim -g "$geometry" "$FILE"

    wl-copy < "$FILE"

    notify \
        "Screenshot" \
        "Janela capturada."

}

edit() {

    local geometry

    geometry="$(slurp)"

    grim -g "$geometry" - \
        | swappy -f -

}

open_folder() {

    xdg-open "$SCREENSHOT_DIR" >/dev/null 2>&1 &
}

#################################################
# Execução
#################################################

case "${1:-fullscreen}" in

    fullscreen)
        fullscreen
        ;;

    region)
        region
        ;;

    active)
        active
        ;;

    edit)
        edit
        ;;

    folder)
        open_folder
        ;;

    *)
        fullscreen
        ;;

esac

exit 0
