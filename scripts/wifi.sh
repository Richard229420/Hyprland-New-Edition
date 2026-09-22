#!/usr/bin/env bash

#################################################
# Wi-Fi
# Hyprland 0.56
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require nmcli notify-send wofi

#################################################
# Funções
#################################################

enable() {

    nmcli radio wifi on

    notify \
        "Wi-Fi" \
        "Wi-Fi ativado."

}

disable() {

    nmcli radio wifi off

    notify \
        "Wi-Fi" \
        "Wi-Fi desativado."

}

toggle() {

    if wifi_enabled; then
        disable
    else
        enable
    fi

}

status() {

    if wifi_enabled; then

        local ssid

        ssid="$(nmcli -t -f active,ssid dev wifi \
            | awk -F: '$1=="yes"{print $2}')"

        if [[ -n "$ssid" ]]; then
            notify \
                "Wi-Fi" \
                "Conectado em: $ssid"
        else
            notify \
                "Wi-Fi" \
                "Wi-Fi ligado, porém sem conexão."
        fi

    else

        notify \
            "Wi-Fi" \
            "Wi-Fi desligado."

    fi

}

#################################################
# Selecionar rede
#################################################

connect() {

    enable

    local network

    network=$(
        nmcli -t -f SSID dev wifi list \
            | sed '/^$/d' \
            | sort -u \
            | wofi \
                --dmenu \
                --prompt "Redes Wi-Fi"
    )

    [[ -z "$network" ]] && exit 0

    nmcli device wifi connect "$network"

    notify \
        "Wi-Fi" \
        "Conectado em $network."

}

#################################################
# Desconectar
#################################################

disconnect() {

    nmcli networking off
    sleep 1
    nmcli networking on

    notify \
        "Wi-Fi" \
        "Conexão encerrada."

}

#################################################
# Menu
#################################################

menu() {

    local option

    option=$(
        printf \
"Conectar\nAlternar\nLigar\nDesligar\nStatus\nDesconectar" |
        wofi \
            --dmenu \
            --prompt "Wi-Fi"
    )

    case "$option" in

        "Conectar")
            connect
            ;;

        "Alternar")
            toggle
            ;;

        "Ligar")
            enable
            ;;

        "Desligar")
            disable
            ;;

        "Status")
            status
            ;;

        "Desconectar")
            disconnect
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

    connect)
        connect
        ;;

    disconnect)
        disconnect
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

exit 0
