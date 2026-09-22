#!/usr/bin/env bash

#################################################
# Hyprland Autostart
#################################################

set -euo pipefail

CONFIG_DIR="$HOME/.config"
HYPR_DIR="$CONFIG_DIR/hypr"
LOG="$HOME/.cache/hypr/autostart.log"

mkdir -p "$(dirname "$LOG")"

#################################################
# Log
#################################################

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$LOG"
}

#################################################
# Iniciar processo
#################################################

start_service() {
    local process="$1"
    shift

    if pgrep -x "$process" >/dev/null 2>&1; then
        log "$process já está executando."
        return 0
    fi

    log "Iniciando: $process"

    "$@" >> "$LOG" 2>&1 &
}

#################################################
# Ambiente
#################################################

export XDG_CURRENT_DESKTOP="Hyprland"
export XDG_SESSION_DESKTOP="Hyprland"

#################################################
# Hyprpaper
#################################################

start_service hyprpaper hyprpaper

#################################################
# Hypridle
#################################################

start_service hypridle hypridle

#################################################
# Waybar
#################################################

start_service \
    waybar \
    waybar \
        -c "$CONFIG_DIR/waybar/config.jsonc" \
        -s "$CONFIG_DIR/waybar/style.css"

#################################################
# Mako
#################################################

start_service \
    mako \
    mako \
        -c "$CONFIG_DIR/mako/config.conf"

#################################################
# Wallpaper
#################################################

if [[ -x "$HYPR_DIR/scripts/wallpaper.sh" ]]; then
    log "Aplicando wallpaper."

    "$HYPR_DIR/scripts/wallpaper.sh" >> "$LOG" 2>&1 &
else
    log "wallpaper.sh não encontrado ou não executável."
fi

#################################################
# Finalização
#################################################

log "Autostart finalizado."