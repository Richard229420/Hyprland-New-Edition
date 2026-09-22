#!/usr/bin/env bash

#################################################
# Biblioteca de funções
# Hyprland
#################################################

set -euo pipefail

#################################################
# Diretórios
#################################################

CONFIG_DIR="$HOME/.config/hypr"
SCRIPT_DIR="$CONFIG_DIR/scripts"
CACHE_DIR="$HOME/.cache/hypr"

mkdir -p "$CACHE_DIR"

#################################################
# Verificar comando
#################################################

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

#################################################
# Executar apenas uma vez
#################################################

run_once() {
    local process="$1"
    shift

    if ! pgrep -x "$process" >/dev/null 2>&1; then
        "$@" &
    fi
}

#################################################
# Notificação
#################################################

notify() {
    local title="$1"
    local message="$2"

    if command_exists notify-send; then
        notify-send "$title" "$message"
    fi
}

#################################################
# Verificar dependências
#################################################

require() {
    local program

    for program in "$@"; do
        if ! command_exists "$program"; then
            echo "Erro: '$program' não está instalado." >&2
            exit 1
        fi
    done
}

#################################################
# Obter volume
#################################################

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ |
        awk '{printf "%.0f\n", $2 * 100}'
}

#################################################
# Verificar mute
#################################################

is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ |
        grep -q "MUTED"
}

#################################################
# Obter brilho
#################################################

get_brightness() {
    local current
    local maximum

    current="$(brightnessctl get)"
    maximum="$(brightnessctl max)"

    awk -v current="$current" -v maximum="$maximum" \
        'BEGIN {
            if (maximum > 0)
                printf "%.0f\n", (current / maximum) * 100
            else
                print "0"
        }'
}

#################################################
# Verificar Wi-Fi
#################################################

wifi_enabled() {
    nmcli radio wifi |
        grep -qi "enabled"
}

#################################################
# Verificar Bluetooth
#################################################

bluetooth_enabled() {
    bluetoothctl show |
        grep -q "Powered: yes"
}

#################################################
# Wallpaper aleatório
#################################################

random_wallpaper() {
    find "$CONFIG_DIR/assets/wallpapers" \
        -type f \
        \( \
            -iname "*.jpg" \
            -o -iname "*.jpeg" \
            -o -iname "*.png" \
            -o -iname "*.webp" \
        \) |
        shuf -n1
}

#################################################
# Registrar log
#################################################

log() {
    echo "[$(date '+%F %T')] $*" >> "$CACHE_DIR/hypr.log"
}

#################################################
# Confirmar ação
#################################################

confirm() {
    local message="$1"

    if ! command_exists wofi; then
        return 0
    fi

    [[ "$(
        printf "Não\nSim" |
            wofi \
                --dmenu \
                --prompt "$message"
    )" == "Sim" ]]
}

#################################################
# Encerrar processo
#################################################

kill_process() {
    local process="$1"

    pkill -x "$process" 2>/dev/null || true
}