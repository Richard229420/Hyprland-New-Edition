-------------------------------------------------
-- Hyprland 0.56.2
-- Aparência e comportamento visual
-------------------------------------------------

-------------------------------------------------
-- Configuração geral
-------------------------------------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 2,

        resize_on_border = true,

        allow_tearing = false,

        layout = "dwindle",

        col = {
            active_border = "rgba(89b4faee)",
            inactive_border = "rgba(4c566aaa)",
        },
    },

-------------------------------------------------
-- Decoração
-------------------------------------------------

    decoration = {
        rounding = 10,

        active_opacity = 1.0,
        inactive_opacity = 0.95,
        fullscreen_opacity = 1.0,

        blur = {
            enabled = true,

            size = 8,
            passes = 2,

            vibrancy = 0.18,

            noise = 0.01,
            contrast = 1.1,
            brightness = 1.0,

            popups = true,
            ignore_opacity = true,
        },

        shadow = {
            enabled = true,

            range = 18,
            render_power = 4,

            color = "rgba(00000055)",
        },

        dim_inactive = false,
    },

-------------------------------------------------
-- Configurações diversas
-------------------------------------------------

    misc = {
        animate_manual_resizes = true,
        animate_mouse_windowdragging = true,
    },

-------------------------------------------------
-- Layout Dwindle
-------------------------------------------------

    dwindle = {
        preserve_split = true,
        smart_split = true,
        smart_resizing = true,
    },

-------------------------------------------------
-- Layout Master
-------------------------------------------------

    master = {
        new_status = "master",
    },
})
