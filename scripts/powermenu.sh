#!/usr/bin/env bash

#################################################
# Power Menu
# Hyprland 0.56
#################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/functions.sh"

#################################################
# Dependências
#################################################

require wofi systemctl loginctl

#################################################
# Ícones
#################################################

LOCK="  Bloquear"
LOGOUT="  Encerrar sessão"
SUSPEND="  Suspender"
HIBERNATE="  Hibernar"
REBOOT="  Reiniciar"
POWEROFF="  Desligar"

#################################################
# Menu
#################################################

choice=$(
printf "%s\n%s\n%s\n%s\n%s\n%s\n" \
"$LOCK" \
"$LOGOUT" \
"$SUSPEND" \
"$HIBERNATE" \
"$REBOOT" \
"$POWEROFF" |
wofi \
    --dmenu \
    --prompt "Energia"
)

#################################################
# Ações
#################################################

case "$choice" in

"$LOCK")
    "$SCRIPT_DIR/lock.sh"
    ;;

"$LOGOUT")
    if confirm "Encerrar sessão?"; then
        hyprctl dispatch exit
    fi
    ;;

"$SUSPEND")
    if confirm "Suspender o sistema?"; then
        "$SCRIPT_DIR/lock.sh"
        systemctl suspend
    fi
    ;;

"$HIBERNATE")
    if confirm "Hibernar o sistema?"; then
        "$SCRIPT_DIR/lock.sh"
        systemctl hibernate
    fi
    ;;

"$REBOOT")
    if confirm "Reiniciar o computador?"; then
        systemctl reboot
    fi
    ;;

"$POWEROFF")
    if confirm "Desligar o computador?"; then
        systemctl poweroff
    fi
    ;;

esac

exit 0
