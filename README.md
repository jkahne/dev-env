put this project in ~/dev-env.

## Run
run `run --dry` to see what it runs by default. 

You probably want to run `run ordered --extras --dry` first.  

`ordered` runs things in the right ... order.  But it isn't run by default because `run` is set up to run a particular script in `/runs`.  `--extras` enables the ability to use these excluded-by-default scripts.


## Dotfiles

run `dotfiles` to copy my dotfiles to where they need to be. This requires that this project be in ~/dot-env.  (see top of dot-zshrc)

you can run `dotfiles --dry` if you want to see what it will do.
it copies a bunch of dotfiles to $HOME
it copies several directories to ~/.config
it copies lazygit config into the depths of ~/Library




## Other things

- update name and email in dot-gitconfig

1Password

Keyboard Maestro
 - sync to ./synced/Keyboard\ Maestro\ Macros.kmsync

gh auth login
    => sets ups ssh and puts it on github.com
    => next time you push, you will need to auth with the forever token


-- is this even needed?
Font
 - Install JetBrains font from TODO -- NO, install HACK font  

Cleanshot
 - keyboard shortcuts:
   - ⌘1 Capture Area
   - ⇧⌘1 Capture Text (OCR)
   - ⌘2 Record Screen

Things

System Settings
 - Desktop & Dock
   - size => small
   - Magnification => 1/4 or so
   - position on screen => Left
   - Double Click a window's title bar => Do Nothing
   - Automatically hide and show the Dock => True
   - Show suggested and recent apps in Dock => False
   - Click wallpaper to reveal desktop => Only in Stage Manager
 - Accessibility
   - Zoom
     - Use scroll gesture with modifier keys to zoom => true
     -
 - Wallpaper
   - Dynamic Wallpapers => Solar Gradients
 - Keyboard
   - Key repeat rate => Fast
   - Delay until repeat => Short
   - Modifier Keys
     - ⭐️ Caps Lock to Control

Fantastical
Fork
Datagrip
Ice - bartender alternative since bartender got bought by a shady company.   https://github.com/jordanbaird/Ice


I need to evaluate this entire repo: https://github.com/prdanelli/dotfiles/blob/main/neovim/lua/plugins/which-key.lua
