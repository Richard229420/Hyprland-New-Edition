-------------------------------------------------
-- Hyprland 0.56.2
-- Arquivo principal
-------------------------------------------------

-------------------------------------------------
-- Caminho dos módulos Lua
-------------------------------------------------

package.path = package.path .. ";" ..
os.getenv("HOME") .. "/.config/hypr/?.lua"

-------------------------------------------------
-- Módulos de configuração
-------------------------------------------------

require("config.env")
require("config.monitors")
require("config.appearance")
require("config.animations")
require("config.input")
require("config.keybinds")
require("config.windowrules")
require("config.startup")
