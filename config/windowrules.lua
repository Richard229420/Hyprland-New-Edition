-------------------------------------------------
-- Hyprland 0.56.2
-- Regras de janelas
-------------------------------------------------

-------------------------------------------------
-- Aplicações flutuantes
-------------------------------------------------

-- Controle de volume do PulseAudio/PipeWire
hl.window_rule({
    name = "pavucontrol-floating",
    match = {
        class = "pavucontrol",
    },
    float = true,
    center = true,
})

-- Gerenciador de conexões de rede
hl.window_rule({
    name = "network-manager-floating",
    match = {
        class = "nm-connection-editor",
    },
    float = true,
    center = true,
})

-- Gerenciador Bluetooth
hl.window_rule({
    name = "blueman-floating",
    match = {
        class = "blueman-manager",
    },
    float = true,
    center = true,
})

-- Autenticação do Polkit
hl.window_rule({
    name = "polkit-floating",
    match = {
        class = "org.kde.polkit-kde-authentication-agent-1",
    },
    float = true,
    center = true,
})

-- Qalculate
hl.window_rule({
    name = "qalculate-floating",
    match = {
        class = "qalculate-gtk",
    },
    float = true,
    center = true,
    size = {
        800,
        600,
    },
})

-------------------------------------------------
-- Diálogos de impressão
-------------------------------------------------

hl.window_rule({
    name = "print-dialog-floating",
    match = {
        title = ".*[Pp]rint.*",
    },
    float = true,
    center = true,
})

-------------------------------------------------
-- Picture-in-Picture
-------------------------------------------------

hl.window_rule({
    name = "picture-in-picture",
    match = {
        class = ".*",
        title = "Picture%-in%-Picture",
    },
    float = true,
    pin = true,
    size = { 640, 360 },
    move = { "100%-660", "40"},
})

-------------------------------------------------
-- Workspaces
-------------------------------------------------

-- Firefox
hl.window_rule({
    name = "firefox-workspace",
    match = {
        class = "firefox",
    },
    workspace = "2",
})

-- Zen Browser
hl.window_rule({
    name = "zen-browser-workspace",
    match = {
        class = "zen",
    },
    workspace = "2",
})

-- VS Code
hl.window_rule({
    name = "vscode-workspace",
    match = {
        class = "code",
    },
    workspace = "3",
})

-- Discord
hl.window_rule({
    name = "discord-workspace",
    match = {
        class = "discord",
    },
    workspace = "4",
})

-- Steam
hl.window_rule({
    name = "steam-workspace",
    match = {
        class = "steam",
    },
    workspace = "5",
})

-- Spotify
hl.window_rule({
    name = "spotify-workspace",
    match = {
        class = "spotify",
    },
    workspace = "6",
})

-- LibreOffice
hl.window_rule({
    name = "libreoffice-workspace",
    match = {
        class = "libreoffice",
    },
    workspace = "7",
})

-- OBS Studio
hl.window_rule({
    name = "obs-workspace",
    match = {
        class = "obs",
    },
    workspace = "8",
})

-- GIMP
hl.window_rule({
    name = "gimp-workspace",
    match = {
        class = "gimp",
    },
    workspace = "9",
})

-------------------------------------------------
-- Kitty
-------------------------------------------------

hl.window_rule({
    name = "kitty-workspace",
    match = {
        class = "kitty",
    },
    workspace = "1",
})

-------------------------------------------------
-- Neovim
-------------------------------------------------

hl.window_rule({
    name = "neovim-opacity",
    match = {
        title = ".*nvim.*",
    },
    opacity = "1.0 override 0.95 override",
})

-------------------------------------------------
-- Comportamento geral
-------------------------------------------------

-- Impede que aplicativos forcem o layout para maximizado.
hl.window_rule({
    name = "suppress-maximize",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})
