# dotfiles-hyprland

My Hyprland desktop on CachyOS (ThinkPad T480): a Lua-based Hyprland config and an iPhone-style
**Dynamic Island** shell built with [Quickshell](https://quickshell.outfoxxed.me). Colors for the
whole desktop are generated from the wallpaper with [matugen](https://github.com/InioX/matugen).

## What's inside

| Folder | What it is |
| --- | --- |
| [`hypr/`](hypr) | Hyprland config written in Lua (`hyprland.lua` + `config/*.lua`), hyprpaper |
| [`quickshell/`](quickshell) | The Dynamic Island shell: media, notifications, OSDs, launcher, Wi-Fi/Bluetooth, weather, calendar, clipboard, lock screen. See its [README](quickshell/README.md) |
| [`quickshell/sddm/`](quickshell/sddm) | Matching "Island" SDDM login theme |
| [`quickshell/obsidian/`](quickshell/obsidian) | Obsidian themes: `Island` (recolored from the wallpaper) and `ThinkRed`. Copy into `<vault>/.obsidian/themes/` |
| [`matugen/`](matugen) | Wallpaper-based color generation |
| [`kitty/`](kitty) | Terminal |
| [`fish/`](fish) | Shell |
| [`gtk-3.0/`](gtk-3.0), [`gtk-4.0/`](gtk-4.0), [`qt6ct/`](qt6ct), [`nwg-look/`](nwg-look), [`kdeglobals`](kdeglobals) | GTK / Qt theming |
| [`cava/`](cava) | Audio visualizer (also drives the island's bars) |
| [`btop/`](btop), [`micro/`](micro), [`spicetify/`](spicetify) | btop, micro editor, Spotify theming |

## Dependencies

`hyprland` (Lua config support), `hyprpaper`, `quickshell`, `matugen`, `kitty`, `fish`, `cava`,
`brightnessctl`, `cliphist`, `wl-clipboard`, `bluez-tools` (`bt-agent`), `dolphin`.
Optional: the `hyprglass` plugin via `hyprpm` for the "Liquid Glass" look.

## Install

These files live directly in `~/.config`. **Back up your own config first.**

```sh
git clone https://github.com/DarkAaronfox/dotfiles-hyprland.git ~/dotfiles-hyprland
cp -r ~/dotfiles-hyprland/{hypr,quickshell,kitty,fish,matugen,cava} ~/.config/
```

Copy any other folders you want the same way. Hyprland starts the island (`qs`) automatically
(see `hypr/config/autostart.lua`).

### Fonts

The island and the SDDM theme use **SF Pro** (Display, Text, Rounded). Apple doesn't allow those
fonts to be redistributed, so they are not in this repo. Download them from
[developer.apple.com/fonts](https://developer.apple.com/fonts/) and put the `.otf` files in
`~/.local/share/fonts/` and `quickshell/sddm/island/fonts/`.

### SDDM theme

```sh
sudo sh ~/.config/quickshell/sddm/install.sh
```
