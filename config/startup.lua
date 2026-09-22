-------------------------------------------------
-- Hyprland 0.56.2
-- Inicialização da sessão
-------------------------------------------------

hl.on("hyprland.start", function()

    -------------------------------------------------
    -- Ambiente D-Bus / systemd
    -------------------------------------------------

    hl.exec_cmd(
        "dbus-update-activation-environment --systemd " ..
        "WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    )

    -------------------------------------------------
    -- Serviços e aplicações de inicialização
    -------------------------------------------------

    -- Script principal de inicialização
    hl.exec_cmd(
        "~/.config/hypr/scripts/autostart.sh"
    )

    -------------------------------------------------
    -- Polkit
    -------------------------------------------------

    hl.exec_cmd(
        "/usr/lib/polkit-kde-authentication-agent-1"
    )

    -------------------------------------------------
    -- NetworkManager
    -------------------------------------------------

    hl.exec_cmd(
        "nm-applet --indicator"
    )

    -------------------------------------------------
    -- Bluetooth
    -------------------------------------------------

    hl.exec_cmd(
        "blueman-applet"
    )

    -------------------------------------------------
    -- Clipboard
    -------------------------------------------------

    -- Texto
    hl.exec_cmd(
        "wl-paste --type text --watch cliphist store"
    )

    -- Imagens
    hl.exec_cmd(
        "wl-paste --type image --watch cliphist store"
    )

end)
