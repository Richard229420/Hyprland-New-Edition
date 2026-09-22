#!/usr/bin/env bash

#################################################
# Controle de Brilho
# Hyprland 0.56
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require brightnessctl notify-send

#################################################
# Configuração
#################################################

STEP=5

#################################################
# Funções
#################################################

increase() {

    brightnessctl set "${STEP}%+"

    notify \
        "Brilho" \
        "Brilho: $(get_brightness)%"

}

decrease() {

    brightnessctl set "${STEP}%-"

    notify \
        "Brilho" \
        "Brilho: $(get_brightness)%"

}

set_value() {

    local value="$1"

    brightnessctl set "${value}%"

    notify \
        "Brilho" \
        "Brilho: $(get_brightness)%"

}

show() {

    notify \
        "Brilho" \
        "Brilho atual: $(get_brightness)%"

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

    set)
        set_value "${2:-50}"
        ;;

    status)
        show
        ;;

    *)
        echo "Uso:"
        echo "  brightness.sh up"
        echo "  brightness.sh down"
        echo "  brightness.sh set <0-100>"
        echo "  brightness.sh status"
        exit 1
        ;;

esac

exit 0
