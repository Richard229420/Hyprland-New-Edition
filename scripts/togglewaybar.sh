#!/usr/bin/env bash

#################################################
# Toggle Waybar
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require waybar notify-send

#################################################
# Configuração
#################################################

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"

#################################################
# Alternar
#################################################

if pgrep -x waybar >/dev/null 2>&1; then

    pkill -x waybar

    notify \
        "Waybar" \
        "Waybar ocultada."

else

    waybar \
        -c "$WAYBAR_CONFIG" \
        -s "$WAYBAR_STYLE" \
        >/dev/null 2>&1 &

    notify \
        "Waybar" \
        "Waybar iniciada."

fi