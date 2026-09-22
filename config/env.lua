-------------------------------------------------
-- Hyprland 0.56.2
-- Variáveis de ambiente
-------------------------------------------------

-------------------------------------------------
-- Aplicações padrão
-------------------------------------------------

hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")
hl.env("TERMINAL", "kitty")
hl.env("BROWSER", "zen-browser")

-------------------------------------------------
-- Sessão Wayland / Hyprland
-------------------------------------------------

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-------------------------------------------------
-- GTK / Wayland
-------------------------------------------------

hl.env("GDK_BACKEND", "wayland,x11")

-------------------------------------------------
-- Qt / Wayland
-------------------------------------------------

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-------------------------------------------------
-- SDL / Wayland
-------------------------------------------------

hl.env("SDL_VIDEODRIVER", "wayland")

-------------------------------------------------
-- Clutter / Wayland
-------------------------------------------------

hl.env("CLUTTER_BACKEND", "wayland")

-------------------------------------------------
-- Java / Wayland
-------------------------------------------------

hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

-------------------------------------------------
-- Firefox / Wayland
-------------------------------------------------

hl.env("MOZ_ENABLE_WAYLAND", "1")

-------------------------------------------------
-- Electron / Wayland
-------------------------------------------------

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-------------------------------------------------
-- Cursor
-------------------------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
