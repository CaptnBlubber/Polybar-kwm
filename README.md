
# Polybar-kwm

Polybar-kwm is an [Übersicht](https://github.com/felixhageloh/uebersicht) widget that tries to recreate the same behavior as [polybar](https://github.com/jaagr/polybar) on macOS for [kwm](https://github.com/koekeishiya/kwm)


## Modules

- Workspaces
  - with highlight of current active space
- Volume
- CPU Usage
- Disk Usage
- Current Connected Wifi
- Battery
- Date
- Time


## Installation

```bash
git clone git@github.com:CaptnBlubber/Polybar-kwm.git ~/Library/Application Support/Übersicht/widgets/polybar
```

Download (or clone) this repository and place the contents inside a folder called `polybar` in your Übersicht widgets directory. By default the widget folder is located here: `~/Library/Application Support/Übersicht/widgets`

## Prerequisites

This Widget uses SauceCodePro from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts). You can easily install them using [brew](https://github.com/caskroom/homebrew-fonts):
```bash
brew tap caskroom/fonts
brew cask install font-sourcecodepro-nerd-font
```

## Configuration

Make sure your namespaces are named in kwm. Example:
``` 
kwmc config space 0 1 name " Web"
kwmc config space 0 2 name " Chat"
kwmc config space 0 3 name " Code"
```

## TODO
- [ ] Now Playing
- [ ] [chunkwm](https://github.com/koekeishiya/chunkwm). Not sure yet if I will let this support both wm's or create a seperate Widget for it.


## Known Issues

After reboot all Spaces will be shown as *[no tag]*. This is due to how kwm currently works. Simply switch to every space once and kwm will have the proper names.


## Questions?

If you find a bug or have any questions about Polybar Kwm,  [submit an issue](https://github.com/CaptnBlubber/Polybar-kwm/issues/new).


## Screenshots
![Polybar-kwm](https://i.imgur.com/CQd6ILB.png)