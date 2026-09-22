#!/usr/bin/env bash

#################################################
# Bluetooth - Hyprland
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require bluetoothctl notify-send

#################################################
# Funções
#################################################

enable() {

    bluetoothctl power on >/dev/null

    notify \
        "Bluetooth" \
        "Bluetooth ativado."

}

disable() {

    bluetoothctl power off >/dev/null

    notify \
        "Bluetooth" \
        "Bluetooth desativado."

}

toggle() {

    if bluetooth_enabled; then
        disable
    else
        enable
    fi

}

manager() {

    if command_exists blueman-manager; then
        blueman-manager &
    else
        notify \
            "Bluetooth" \
            "Blueman Manager não está instalado."
    fi

}

status() {

    if bluetooth_enabled; then
        notify \
            "Bluetooth" \
            "Bluetooth está ligado."
    else
        notify \
            "Bluetooth" \
            "Bluetooth está desligado."
    fi

}

#################################################
# Menu
#################################################

menu() {

    local option

    option=$(
        printf "Alternar\nLigar\nDesligar\nGerenciador\nStatus" |
        wofi \
            --dmenu \
            --prompt "Bluetooth"
    )

    case "$option" in
        "Alternar")
            toggle
            ;;

        "Ligar")
            enable
            ;;

        "Desligar")
            disable
            ;;

        "Gerenciador")
            manager
            ;;

        "Status")
            status
            ;;
    esac

}

#################################################
# Execução
#################################################

case "${1:-menu}" in

    on)
        enable
        ;;

    off)
        disable
        ;;

    toggle)
        toggle
        ;;

    manager)
        manager
        ;;

    status)
        status
        ;;

    menu)
        menu
        ;;

    *)
        menu
        ;;

esac
