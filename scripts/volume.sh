#!/usr/bin/env bash

#################################################
# Controle de Volume
# Hyprland 0.56
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require wpctl notify-send

#################################################
# Configuração
#################################################

STEP=5

#################################################
# Funções
#################################################

increase() {

    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${STEP}%+"

    notify \
        "Volume" \
        "Volume: $(get_volume)%"

}

decrease() {

    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${STEP}%-"

    notify \
        "Volume" \
        "Volume: $(get_volume)%"

}

toggle_mute() {

    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    if is_muted; then
        notify \
            "Volume" \
            "Áudio silenciado."
    else
        notify \
            "Volume" \
            "Volume: $(get_volume)%"
    fi

}

set_volume() {

    local value="$1"

    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${value}%"

    notify \
        "Volume" \
        "Volume: $(get_volume)%"

}

status() {

    if is_muted; then

        notify \
            "Volume" \
            "Áudio silenciado."

    else

        notify \
            "Volume" \
            "Volume atual: $(get_volume)%"

    fi

}

#################################################
# Execução
#################################################

case "${1:-}" in

    up)
        increase
        ;;

    down)
        decrease
        ;;

    mute)
        toggle_mute
        ;;

    set)
        set_volume "${2:-50}"
        ;;

    status)
        status
        ;;

    *)
        echo "Uso:"
        echo "  volume.sh up"
        echo "  volume.sh down"
        echo "  volume.sh mute"
        echo "  volume.sh set <0-100>"
        echo "  volume.sh status"
        exit 1
        ;;

esac

exit 0
