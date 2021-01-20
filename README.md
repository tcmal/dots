# dots

Dotfiles in NixOS configuration format.

Machines are specific hosts that i use.
Roles are sets of programs/configs that i want to run in combination.
Programs are program-specific configuration, usually using home-manager.

# colours

I use base16 to sync the same colour scheme across the following applications:
  - `alacritty`
  - `discord`
  - `firefox`
  - `gtk2/3`
  - `i3`
  - `rofi`
  - `spotify`
  - `vscode`

This can be seen in `roles/desktop.nix`

# license

Copyright belongs to me and is under the MIT License, except for:
  - `share/obsidian.css` - ['Nord' obsidian theme. Unknown License](https://github.com/insanum/obsidian_nord)
  - `share/spotify.css` - ['Nord' spicetify theme. MIT License](https://github.com/morpheusthewhite/spicetify-themes)
  - `programs/discord-base16.nix` - ['Nox' discord theme. MIT License](https://github.com/rauenzi/Nox)
  - `programs/gtk-base16.nix` - [Materia customising package. MIT License](https://gitlab.com/rycee/nur-expressions)
  - `share/shutdown-menu` - [Script by Benjamin Chrétien. GNU-GPLv3 License](https://github.com/vivien/i3blocks-contrib/)
  - `share/wallpaper.png` - [Celeste, Chapter 7. Developed by Matt Makes Games](https://store.steampowered.com/app/504230/Celeste/)
  - `share/userstyles/google.ejs` - [Google Dark Rainbow. MIT License](https://github.com/exmert/Google-Dark---Rainbow)
  - `share/idea/base16-system.icls` - [Base16 Builder, MIT License](https://github.com/base16-builder/base16-builder)