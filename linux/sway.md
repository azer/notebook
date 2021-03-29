# Sway

## Get Outputs

```
swaymsg -t get_outputs
```

## Get Window Tree

```
swaymsg -t get_tree
```

## Screensharing

```
$ pacman -S xdg-desktop-portal-wlr libpipewire02 pipewire-media-session
$ systemctl --user enable --now pipewire-media-session xdg-desktop-portal-wlr xdg-desktop-portal

then make sure firefox is > 84.0-1
https://github.com/emersion/xdg-desktop-portal-wlr/wiki/Screencast-Compatibility#browsersoh and also make to have somewhere in your env so firefox can see it
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=waylandand also exec "systemctl --user import-environment" at the bottom of your sway config, so that xdg-desktop-portal can see it
https://github.com/emersion/xdg-desktop-portal-wlr/wiki/systemd-user-services,-pam,-and-environment-variables#tldrfollowed by probably a reboot :thumbsup: (edited)
```
