#!/usr/bin/env bash

#################################################
# Hyprpaper Wallpaper Manager
#################################################

set -euo pipefail

#################################################
# Diretórios
#################################################

WALLPAPER_DIR="$HOME/.config/hypr/assets/wallpapers"
STATE_FILE="$HOME/.cache/hypr/current_wallpaper"

mkdir -p "$(dirname "$STATE_FILE")"

#################################################
# Verificar Hyprpaper
#################################################

if ! pgrep -x hyprpaper >/dev/null 2>&1; then
    echo "Erro: hyprpaper não está executando." >&2
    exit 1
fi

#################################################
# Buscar wallpapers
#################################################

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" \
        -type f \
        \( \
            -iname "*.jpg" \
            -o -iname "*.jpeg" \
            -o -iname "*.png" \
            -o -iname "*.webp" \
        \)
)

if (( ${#WALLPAPERS[@]} == 0 )); then
    echo "Nenhum wallpaper encontrado em:" >&2
    echo "$WALLPAPER_DIR" >&2
    exit 1
fi

#################################################
# Escolher wallpaper
#################################################

case "${1:-}" in

    random)
        WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"
        ;;

    "")
        WALLPAPER="${WALLPAPERS[0]}"
        ;;

    *)
        if [[ -f "$1" ]]; then
            WALLPAPER="$1"
        else
            echo "Wallpaper não encontrado: $1" >&2
            exit 1
        fi
        ;;

esac

#################################################
# Aplicar
#################################################

hyprctl hyprpaper unload all

hyprctl hyprpaper preload "$WALLPAPER"

hyprctl hyprpaper wallpaper \
    ",$WALLPAPER"

#################################################
# Salvar estado
#################################################

printf '%s\n' "$WALLPAPER" > "$STATE_FILE"

echo "Wallpaper aplicado:"
echo "$WALLPAPER"