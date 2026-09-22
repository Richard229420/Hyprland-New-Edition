-------------------------------------------------
-- Hyprland 0.56.2
-- Atalhos de teclado e mouse
-------------------------------------------------

local mainMod = "SUPER"


-------------------------------------------------
-- Aplicações
-------------------------------------------------

-- Terminal
hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd("kitty")
)

-- Firefox
hl.bind(
    mainMod .. " + F",
    hl.dsp.exec_cmd("firefox")
)

-- Dolphin
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd("dolphin")
)

-- Wofi
hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd("wofi --show drun")
)


-------------------------------------------------
-- Sessão
-------------------------------------------------

-- Bloquear tela
hl.bind(
    mainMod .. " + ALT + L",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/lock.sh"
    )
)

-- Menu de energia
hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/powermenu.sh"
    )
)

-- Sair do Hyprland
hl.bind(
    mainMod .. " + SHIFT + Q",
    hl.dsp.exit()
)

-- Recarregar configuração
hl.bind(
    mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd("hyprctl reload")
)


-------------------------------------------------
-- Janelas
-------------------------------------------------

-- Fechar janela
hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)

-- Alternar floating
hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({
        action = "toggle",
    })
)

-- Tela cheia
hl.bind(
    mainMod .. " + SHIFT + F",
    hl.dsp.window.fullscreen()
)

-- Pseudotile
hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)

-- Alternar split
hl.bind(
    mainMod .. " + ALT + J",
    hl.dsp.layout("togglesplit")
)

-- Próxima janela
hl.bind(
    mainMod .. " + TAB",
    hl.dsp.window.cycle_next()
)


-------------------------------------------------
-- Foco das janelas
-------------------------------------------------

hl.bind(
    mainMod .. " + H",
    hl.dsp.focus({
        direction = "left",
    })
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.focus({
        direction = "down",
    })
)

hl.bind(
    mainMod .. " + K",
    hl.dsp.focus({
        direction = "up",
    })
)

hl.bind(
    mainMod .. " + L",
    hl.dsp.focus({
        direction = "right",
    })
)


-------------------------------------------------
-- Mover janelas
-------------------------------------------------

hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.window.move({
        direction = "left",
    })
)

hl.bind(
    mainMod .. " + SHIFT + J",
    hl.dsp.window.move({
        direction = "down",
    })
)

hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.window.move({
        direction = "up",
    })
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.window.move({
        direction = "right",
    })
)


-------------------------------------------------
-- Redimensionar janelas
-------------------------------------------------

hl.bind(
    mainMod .. " + CTRL + H",
    hl.dsp.window.resize({
        x = -40,
        y = 0,
        relative = true,
    }),
    {
        repeating = true,
    }
)

hl.bind(
    mainMod .. " + CTRL + J",
    hl.dsp.window.resize({
        x = 0,
        y = 40,
        relative = true,
    }),
    {
        repeating = true,
    }
)

hl.bind(
    mainMod .. " + CTRL + K",
    hl.dsp.window.resize({
        x = 0,
        y = -40,
        relative = true,
    }),
    {
        repeating = true,
    }
)

hl.bind(
    mainMod .. " + CTRL + L",
    hl.dsp.window.resize({
        x = 40,
        y = 0,
        relative = true,
    }),
    {
        repeating = true,
    }
)


-------------------------------------------------
-- Workspaces
-------------------------------------------------

for i = 1, 10 do

    local key = i % 10

    -- Ir para workspace
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = i,
        })
    )

    -- Mover janela para workspace
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
        })
    )

end


-------------------------------------------------
-- Special workspace
-------------------------------------------------

-- Mostrar / esconder special workspace
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

-- Enviar janela para special workspace
hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
    })
)


-------------------------------------------------
-- Mouse
-------------------------------------------------

-- Mover janela com SUPER + botão esquerdo
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
    }
)

-- Redimensionar janela com SUPER + botão direito
hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
    }
)


-------------------------------------------------
-- Volume
-------------------------------------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/volume.sh up"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/volume.sh down"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/volume.sh mute"
    ),
    {
        locked = true,
    }
)


-------------------------------------------------
-- Brilho
-------------------------------------------------

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/brightness.sh up"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/brightness.sh down"
    ),
    {
        locked = true,
        repeating = true,
    }
)


-------------------------------------------------
-- Screenshots
-------------------------------------------------

-- Tela inteira
hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/screenshot.sh fullscreen"
    )
)

-- Região
hl.bind(
    mainMod .. " + Print",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/screenshot.sh region"
    )
)

-- Janela ativa
hl.bind(
    mainMod .. " + SHIFT + Print",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/screenshot.sh active"
    )
)


-------------------------------------------------
-- Wallpaper
-------------------------------------------------

hl.bind(
    mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/wallpaper.sh random"
    )
)


-------------------------------------------------
-- Waybar
-------------------------------------------------

hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/togglewaybar.sh"
    )
)
