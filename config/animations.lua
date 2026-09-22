-------------------------------------------------
-- Hyprland 0.56.2
-- Animações
-------------------------------------------------

-------------------------------------------------
-- Curvas personalizadas
-------------------------------------------------

hl.curve("easeOutQuart", {
    type = "bezier",
    points = {
        { 0.25, 1.00 },
        { 0.50, 1.00 },
    },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        { 0.65, 0.05 },
        { 0.36, 1.00 },
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        { 0.00, 0.00 },
        { 1.00, 1.00 },
    },
})

-------------------------------------------------
-- Animação global
-------------------------------------------------

-- A animação global utiliza a curva padrão
-- fornecida pelo Hyprland.

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

-------------------------------------------------
-- Bordas
-------------------------------------------------

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})

-------------------------------------------------
-- Janelas
-------------------------------------------------

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "linear",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})

-------------------------------------------------
-- Fade
-------------------------------------------------

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuart",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuart",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 3,
    bezier = "linear",
})

-------------------------------------------------
-- Layers
-------------------------------------------------

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 3,
    bezier = "linear",
})

-------------------------------------------------
-- Workspaces
-------------------------------------------------

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "easeInOutCubic",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 4,
    bezier = "easeInOutCubic",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 4,
    bezier = "easeInOutCubic",
})

-------------------------------------------------
-- Zoom
-------------------------------------------------

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuart",
})
