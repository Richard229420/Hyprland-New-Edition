-------------------------------------------------
-- Hyprland 0.56.2
-- Teclado, mouse e touchpad
-------------------------------------------------

hl.config({
    input = {

        -------------------------------------------------
        -- Teclado
        -------------------------------------------------

        -- Teclado físico ANSI
        kb_layout = "us",

        -- US International com teclas mortas
        kb_variant = "intl",

        kb_model = "",
        kb_options = "",
        kb_rules = "",

        -- Repetição das teclas
        repeat_rate = 50,
        repeat_delay = 300,

        -- Num Lock ativado por padrão
        numlock_by_default = true,

        -------------------------------------------------
        -- Foco das janelas
        -------------------------------------------------

        -- 1 = mover o mouse para uma janela coloca o foco nela
        follow_mouse = 1,

        -------------------------------------------------
        -- Mouse
        -------------------------------------------------

        -- Sensibilidade padrão
        sensitivity = 0,

        -- Perfil de aceleração
        accel_profile = "adaptive",

        -------------------------------------------------
        -- Touchpad
        -------------------------------------------------

        touchpad = {
            -- Rolagem natural
            natural_scroll = true,

            -- Desabilita o touchpad enquanto se digita
            disable_while_typing = true,

            -- Toque no touchpad funciona como clique
            tap_to_click = true,

            -- Permite arrastar mantendo o toque
            tap_and_drag = true,

            -- Não mantém o arraste após retirar o dedo
            drag_lock = false,
        },
    },
})
