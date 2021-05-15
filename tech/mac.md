# Mac

## Shortcuts

* Toggle Fullscreen: `Cmd-Ctrl-F`
* Minimize: `Cmd-Opt-M`
* Switch between apps: `Cmd-tab` (hold option if window is minimized)
* Switch between desktops: `Ctrl+left` / `Ctrl+right`
* Hide current window: `Command + H`
* Hide all other windows: `Command + Option + H`
* Lock screen: `Control + Cmd + Q`

## Tiling

* Open Settings -> Keyboard -> Shortcuts -> App shortcuts
* Create new
* Menu title: `Tile Window to Left of Screen`
* Shortcut: Shift+Cmd+Left
* Create new
* Menu title: `Tile Window to Right of Screen`
* Shortcut: Shift+Cmd+Right

## Disable Animations

```
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true
```
To undo the changes, paste this into the terminal:

```
defaults delete -g NSAutomaticWindowAnimationsEnabled
defaults delete -g NSScrollAnimationEnabled
defaults delete -g NSWindowResizeTime
defaults delete -g QLPanelAnimationDuration
defaults delete -g NSScrollViewRubberbanding
defaults delete -g NSDocumentRevisionsWindowTransformAnimation
defaults delete -g NSToolbarFullScreenAnimationDuration
defaults delete -g NSBrowserColumnAnimationSpeedMultiplier
defaults delete com.apple.dock autohide-time-modifier
defaults delete com.apple.dock autohide-delay
defaults delete com.apple.dock expose-animation-duration
defaults delete com.apple.dock springboard-show-duration
defaults delete com.apple.dock springboard-hide-duration
defaults delete com.apple.dock springboard-page-duration
defaults delete com.apple.finder DisableAllAnimations
defaults delete com.apple.Mail DisableSendAnimations
defaults delete com.apple.Mail DisableReplyAnimations
```
