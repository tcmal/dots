# dots

Dotfiles. Packaged using stow.

# Contents

## Colour scheme / Font

One main colour scheme is used throughout, font is Fira Mono (not code).

## dunst

  - Coherent colour scheme

## i3

  - Coherent colour scheme
  - Usual navigation binds w/ workspace icons
  - Windows assigned to workspaces
  - Startup apps:
    - Redshift
    - Mpdas
    - Dunst
    - Wallpaper

## ncmpcpp

  - Appearance

## polybar

  - One bar at the top
    - mpd
    - i3 workspaces
    - clock
    - battery

## prezto

  - Prompt
  - Modules
    - Node
    - Pacman
    - Git
    - Ssh
  - Sorin prompt
  - Path
    - ~/.bin
    - cargo bin
    - rvm bin
  - Rvm

## rofi

  - dmenu+i3 combination
  - Coherent colour scheme

## termite

  - Coherent colour scheme
  - Hide mouse automatically

## tf2

  - Scroll up/down for weapons 1/2
  - Side button for melee
  - Null cancelling
  - Mastercomfig
  - Spy quick-disguise & sapper chat binds
  - Medic binds
  - jump.cfg
  - talk/notalk.cfg

## vim

  - NERDTree, CtrlP
  - Monokai theme

# Installation

```
stow -t ~ dunst i3 ncmpcpp polybar prezto rofi scripts termite tf2 vim
ln -s ~/.config/tf2 [steamapps]/Team Fortress 2/tf/custom
```
