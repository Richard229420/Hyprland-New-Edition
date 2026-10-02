# Hyprland 0.55+ Configuration

Configuração pessoal e modular do **Hyprland 0.55+**, utilizada no **Arch Linux**.

O objetivo deste repositório é manter uma configuração organizada, modular e facilmente reutilizável em novas instalações, separando configurações de monitores, aparência, animações, entrada, atalhos, regras de janelas e inicialização.

A configuração utiliza **Lua** para organizar os módulos principais e scripts Shell para automações e integração com o sistema.

---

## Ambiente

| Componente          | Utilizado      |
| ------------------- | -------------- |
| Sistema             | Arch Linux     |
| Window Manager      | Hyprland 0.55+ |
| Desktop Environment | KDE Plasma 6 ou GNOME  |
| Display Server      | Wayland        |
| Display Manager     | SDDM ou GDM          |
| Terminal            | Kitty          |
| Navegador           | Firefox        |
| File Manager        | Dolphin        |
| Launcher            | Wofi           |
| Barra               | Waybar         |
| Notificações        | Dunst          |
| Wallpaper           | Hyprpaper      |
| Bluetooth           | Blueman        |
| Network Manager     | NetworkManager |
| Editor              | Neovim         |
| Shell               | Zsh            |

---

# Estrutura

A configuração está localizada em:

```text
~/.config/hypr/
```

Estrutura atual:

```text
~/.config/hypr/
├── hyprland.lua
├── hyprpaper.conf
│
├── config/
│   ├── monitors.lua
│   ├── appearance.lua
│   ├── animations.lua
│   ├── input.lua
│   ├── keybinds.lua
│   ├── windowrules.lua
│   ├── env.lua
│   └── startup.lua
│
├── scripts/
│   ├── autostart.sh
│   ├── wallpaper.sh
│   ├── brightness.sh
│   ├── volume.sh
│   ├── bluetooth.sh
│   ├── screenshot.sh
│   ├── update-system.sh
│   ├── wifi.sh
│   ├── toggle-waybar.sh
│   ├── powermenu.sh
│   └── lock.sh
│
├── assets/
│   ├── wallpapers/
│   ├── icons/
│   └── cursors/
│
└── themes/
```

---

# Configuração principal

O arquivo principal é:

```text
~/.config/hypr/hyprland.lua
```

Ele carrega os módulos separados presentes em `config/`.

Estrutura conceitual:

```lua
require("config.monitors")
require("config.appearance")
require("config.animations")
require("config.input")
require("config.keybinds")
require("config.windowrules")
require("config.env")
require("config.startup")
```

Essa abordagem evita manter toda a configuração do Hyprland em um único arquivo grande.

Cada módulo possui uma responsabilidade específica.

---

# Monitores

Arquivo:

```text
config/monitors.lua
```

Monitor principal do notebook:

```text
eDP-1
1366x768
~60 Hz
```

Também existe suporte para monitor externo, utilizado como monitor secundário à direita do notebook.

Exemplo de organização:

```text
┌──────────────┐ ┌──────────────────────┐
│    eDP-1     │ │   Monitor externo    │
│   1366x768   │ │      1920x1080       │
│   Principal  │ │      Secundário      │
└──────────────┘ └──────────────────────┘
```

---

# Aparência

Arquivo:

```text
config/appearance.lua
```

Configuração utilizada como base:

```text
gaps_in      = 5
gaps_out     = 10
border_size  = 2
layout       = dwindle
```

Cores utilizadas:

```text
active border:
rgba(89b4faff)

inactive border:
rgba(313244aa)
```

A configuração também utiliza bordas arredondadas para manter uma aparência mais limpa.

---

# Layout

O layout principal utilizado é:

```text
dwindle
```

O objetivo é permitir organização automática das janelas em mosaico.

Por exemplo:

```text
┌───────────────────────┐
│                       │
│       Janela 1        │
│                       │
├───────────┬───────────┤
│ Janela 2  │ Janela 3  │
│           │           │
└───────────┴───────────┘
```

Também é possível manter duas aplicações lado a lado dentro da mesma workspace.

```text
┌─────────────────┬─────────────────┐
│                 │                 │
│     Firefox     │      Kitty      │
│                 │                 │
│                 │                 │
└─────────────────┴─────────────────┘
```

---

# Animações

Arquivo:

```text
config/animations.lua
```

Configuração baseada em animações globais.

Parâmetros utilizados:

```text
enabled = true
speed   = 1.0
```

Curva utilizada:

```text
easeOutQuart
```

A intenção é manter animações suaves sem comprometer excessivamente a responsividade do ambiente.

---

# Teclado

Arquivo:

```text
config/input.lua
```

Layout:

```text
us
```

Variant:

```text
intl
```

Isso permite utilizar o teclado **US International com dead keys**, facilitando caracteres como:

```text
á é í ó ú
ã õ
ç
```

Configuração adicional:

```text
numlock_by_default = true
repeat_rate        = 25
repeat_delay       = 600
follow_mouse       = 1
```

---

# Touchpad

O touchpad está configurado com suporte a:

```text
natural_scroll
tap
clickfinger
```

Isso permite utilizar gestos e clique direito através do touchpad.

---

# Atalhos

Arquivo:

```text
config/keybinds.lua
```

Principais atalhos:

| Atalho      | Ação            |
| ----------- | --------------- |
| `SUPER + T` | Kitty           |
| `SUPER + F` | Firefox         |
| `SUPER + E` | Dolphin         |
| `SUPER + R` | Wofi            |
| `SUPER + S` | Steam           |
| `SUPER + L` | Bloquear sessão |
| `SUPER + Q` | Power Menu      |
| `SUPER + C` | Fechar janela   |

---

# Áudio

As teclas multimídia controlam o áudio diretamente.

```text
XF86AudioMute
XF86AudioLowerVolume
XF86AudioRaiseVolume
```

Comportamento:

```text
Mute         → Toggle
Volume Down  → -5%
Volume Up    → +5%
```

O controle também pode ser realizado pelo script:

```text
scripts/volume.sh
```

---

# Brilho

Controle através de:

```text
scripts/brightness.sh
```

O script centraliza as operações relacionadas ao brilho da tela.

---

# Wi-Fi

Gerenciamento auxiliar:

```text
scripts/wifi.sh
```

O ambiente também utiliza:

```text
NetworkManager
nm-applet
```

---

# Bluetooth

Gerenciamento:

```text
scripts/bluetooth.sh
```

Interface gráfica:

```text
blueman-manager
```

Applet:

```text
blueman-applet
```

---

# Screenshots

Script:

```text
scripts/screenshot.sh
```

Responsável por centralizar as ações relacionadas a capturas de tela.

---

# Waybar

A barra utilizada no Hyprland é:

```text
Waybar
```

Ela é iniciada automaticamente junto com a sessão.

Também existe o script:

```text
scripts/toggle-waybar.sh
```

que permite mostrar ou ocultar a barra sem precisar finalizar a sessão.

---

# Wallpapers

O gerenciamento de wallpapers utiliza:

```text
hyprpaper
```

Versão utilizada durante a configuração:

```text
hyprpaper 0.8.4
```

Configuração:

```text
~/.config/hypr/hyprpaper.conf
```

Script auxiliar:

```text
scripts/wallpaper.sh
```

Os wallpapers ficam em:

```text
~/.config/hypr/assets/wallpapers/
```

Estrutura:

```text
assets/
└── wallpapers/
    ├── wallpaper-01.jpg
    ├── wallpaper-02.jpg
    ├── wallpaper-03.jpg
    └── ...
```

A configuração foi preparada pensando em rotação sequencial dos wallpapers.

---

# Autostart

Arquivo responsável:

```text
config/startup.lua
```

O script principal de inicialização é:

```text
scripts/autostart.sh
```

Entre os componentes iniciados automaticamente estão:

```text
Waybar
Dunst
Cliphist
nm-applet
blueman-applet
polkit-kde
```

Além disso, os wallpapers são inicializados através de:

```text
scripts/wallpaper.sh
```

---

# Regras de janelas

Arquivo:

```text
config/windowrules.lua
```

Algumas aplicações administrativas são abertas automaticamente como janelas flutuantes.

### Pavucontrol

```text
Floating
Centered
900x650
```

### Network Manager

```text
nm-connection-editor
Floating
Centered
```

### Blueman

```text
blueman-manager
Floating
Centered
900x700
```

---

# Workspaces

Algumas aplicações possuem workspaces predefinidas.

| Workspace | Aplicação    |
| --------: | ------------ |
|       `1` | Kitty        |
|       `2` | Firefox      |
|       `6` | Discord      |
|       `7` | Virt-Manager |
|       `9` | Steam        |

Isso permite manter um padrão previsível de organização.

Exemplo:

```text
Workspace 1 → Terminal / desenvolvimento
Workspace 2 → Navegação
Workspace 6 → Comunicação
Workspace 7 → Máquinas virtuais
Workspace 9 → Jogos
```

---

# Power Menu

Atalho:

```text
SUPER + Q
```

Script:

```text
scripts/powermenu.sh
```

Centraliza opções relacionadas à sessão e energia.

---

# Lock Screen

Atalho:

```text
SUPER + L
```

Script:

```text
scripts/lock.sh
```

Responsável pelo bloqueio da sessão.

---

# Atualização do sistema

Script:

```text
scripts/update-system.sh
```

Permite centralizar o processo de atualização do Arch Linux e outros componentes utilizados pelo ambiente.

---

# Dependências principais

Uma instalação típica precisa dos seguintes componentes:

```bash
sudo pacman -S \
    hyprland \
    hyprpaper \
    waybar \
    kitty \
    firefox \
    dolphin \
    wofi \
    dunst \
    cliphist \
    networkmanager \
    network-manager-applet \
    blueman \
    pavucontrol
```

Dependências adicionais podem ser necessárias dependendo dos scripts utilizados.

---

# Shell

O shell principal utilizado é:

```text
Zsh
```

Com ferramentas adicionais como:

```text
eza
bat
ripgrep
fd
zoxide
```

Também é utilizado:

```text
Oh My Zsh
```

com o tema:

```text
robbyrussell
```

---

# Desktop Environment

Apesar do Hyprland ser utilizado como compositor/window manager principal para esta configuração, o sistema também possui:

```text
KDE Plasma 6
```

O KDE fornece diversas aplicações e componentes úteis para integração do desktop.

O gerenciador de login utilizado é:

```text
SDDM
```

---

# Arquitetura da configuração

A configuração segue aproximadamente esta divisão:

```text
                 hyprland.lua
                      │
        ┌─────────────┼─────────────┐
        │             │             │
     monitors     appearance      input
        │             │             │
        ├─────────────┼─────────────┤
        │             │             │
   animations      keybinds     windowrules
        │             │             │
        └─────────────┼─────────────┘
                      │
                 startup/env
                      │
                   scripts
                      │
       ┌──────────────┼──────────────┐
       │              │              │
   wallpaper        audio          network
       │              │              │
   hyprpaper      PipeWire     NetworkManager
```

---

# Objetivos do projeto

Esta configuração busca principalmente:

* modularidade;
* facilidade de manutenção;
* configuração reutilizável;
* integração com KDE;
* ambiente leve;
* suporte completo a Wayland;
* organização automática das janelas;
* atalhos simples;
* scripts independentes;
* facilidade de reinstalação.

---

# Reutilização

Para utilizar a configuração em outra instalação:

```bash
git clone <URL-DO-REPOSITORIO> ~/.config/hypr
```

Depois, torne os scripts executáveis:

```bash
chmod +x ~/.config/hypr/scripts/*.sh
```

Instale as dependências necessárias e inicie uma sessão Hyprland através do SDDM.

---

# Verificação

Versão do Hyprland:

```bash
hyprctl version
```

Hyprpaper:

```bash
hyprpaper --version
```

Waybar:

```bash
waybar --version
```

Verificar monitores:

```bash
hyprctl monitors
```

Verificar workspaces:

```bash
hyprctl workspaces
```

Verificar clientes/janelas:

```bash
hyprctl clients
```

Recarregar a configuração:

```bash
hyprctl reload
```

---

# Observações sobre Hyprland 0.55+

Esta configuração foi desenvolvida considerando as mudanças introduzidas nas versões recentes do Hyprland.

Ao reutilizar configurações antigas, é importante verificar alterações na API/configuração, principalmente relacionadas a:

```text
window rules
dispatchers
keybinds
focus
opacity
animations
```

Configurações de versões antigas do Hyprland podem não funcionar diretamente em versões `0.55+`.

---

# Status

```text
OS            Arch Linux
DE            KDE Plasma 6
WM            Hyprland 0.55+
Display       Wayland
DM            SDDM
Terminal      Kitty
Browser       Firefox
Files         Dolphin
Launcher      Wofi
Bar           Waybar
Notifications Dunst
Wallpaper     Hyprpaper
Shell         Zsh
Editor        Neovim
```

A configuração continua em desenvolvimento e pode receber alterações conforme novas versões do Hyprland forem lançadas.

---

## License

Configuração destinada principalmente a uso pessoal e estudos.

Pode ser utilizada como referência para outras configurações de Hyprland.

