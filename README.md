# dotfiles

Personal configuration files for my Linux terminal environment (ZorinOS), built around a consistent [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme) color palette across every tool.

![Starship prompt](screenshots/starship.png)

## Contents

```
.
├── ghostty/          # Ghostty terminal config + custom cursor shaders
├── kitty/             # Kitty terminal config + color themes
├── starship/          # Starship prompt config + helper scripts
└── screenshots/        # Preview images
```

## Ghostty

Primary terminal emulator.

- `config.ghostty` — main configuration: FiraCode Nerd Font with ligatures, TokyoNight Night theme, `cursor-style = bar`, and custom keybindings (`Ctrl+C` copy, `Ctrl+V` paste, `Ctrl+Shift+C` for SIGINT).
- `auto/theme.ghostty` — automatic theme switching config.
- `shaders/` — custom cursor shaders (sweep, tail, warp, ripple, rectangle boom, sonic boom effects) for animated cursor trails. See `shaders/README.md` / `shaders/LICENSE` for shader-specific credits and licensing.

> **Note:** Ghostty does not support inline trailing comments in its config file — keep comments on their own line.

## Kitty

Secondary terminal emulator, kept as a fallback.

- `kitty.conf` — main configuration.
- `dracula.conf`, `Dracula.conf`, `Monokai.conf` — standalone color theme files.
- `themes/` — additional theme variants (Dracula, Monokai, Nord, Tokyo Night) for easy switching.

## Starship

Cross-shell prompt, themed to match Tokyo Night.

- `starship.toml` — flat, minimal prompt using standard Unicode symbols (no Nerd Font glyphs required). Shows: current directory, git branch/status, active Python virtualenv, memory usage (above a threshold), command duration (for long-running commands), background job count, last command status, network/proxy status, and time.
- `starship-scripts/net-status.sh` — custom module script that reports network connectivity status in the prompt.

> The config also references a `proxy-status.sh` script under `starship-scripts/` for the proxy indicator — make sure it's included when copying this config to a new machine.

## Installation

Symlink the relevant files into place, e.g.:

```bash
ln -sf ~/dotfiles/ghostty/config.ghostty ~/.config/ghostty/config
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
```

Adjust paths as needed for your system.

## License

Personal configuration files are provided as-is, free to use or adapt. See `ghostty/shaders/LICENSE` for the license covering the third-party cursor shaders.
