#!/usr/bin/env bash

#################################################
# Hyprlock
#################################################

set -euo pipefail

LOG="$HOME/.cache/hypr/lock.log"

mkdir -p "$(dirname "$LOG")"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$LOG"
}

#################################################
# Evitar múltiplas instâncias
#################################################

if pgrep -x hyprlock >/dev/null 2>&1; then
    log "Hyprlock já está executando."
    exit 0
fi

#################################################
# Bloquear sessão
#################################################

log "Iniciando Hyprlock."

exec hyprlock \
    -c "$HOME/.config/hyprlock/hyprlock.conf"