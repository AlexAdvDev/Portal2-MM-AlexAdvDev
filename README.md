# **Portal 2: Multiplayer Mod**

**Note: This mod is completely server-side. Only the host needs to run Portal 2 with the mod installed. People who join the host should run stock Portal 2.**

## Mod features
```
  A maximum player cap of 33
  Player colors
  Chat commands
  Nametags
  Admin System in-game
  Full cooperative campaign support
  Full singleplayer campaign support (needs minor polishing)
  Full Super 8 map support
  Full cooperative Gelocity map support
  Encryption of cvars from clients
  Support for Linux and Windows 7-11
  Ground up VScript development environment
```

## Features Coming Eventually
- Player-specific colored portals (this one is going to take a lot of time to implement)
- A system for map makers to make maps compatiable with p2mm
- Steam Deck support
- Discord API for easy invites

# Installation & use

- The latest version released: https://github.com/kyleraykbs/Portal2-32PlayerMod/releases/latest

***The Steam guide goes over everything you need to know to get the mod working, so be sure to read through it to prevent confusion.***
- Steam guide: https://steamcommunity.com/sharedfiles/filedetails/?id=2458260280

*If you need help setting up this mod, or just want to chill with a great community filled with developers, feel free to join our Discord server!*
- https://discord.gg/kW3nG6GKpF

# Contributions

If you want to contribute to this project, you can do so in 3 ways:
1- Help with the launcher written in python and using pygame.
2- Help with the VScript, add support to workshop maps, or optimize/clean current code.
3- Localize the launcher with different languages. You can do this by creating a folder called `languages` in your p2mm folder and start creating JSON files in it for each different language. [base translation file](https://github.com/kyleraykbs/Portal2-32PlayerMod/blob/main/src/languages/English.json))

### Dependencies
- pygame
- requests
- steamid-converter
- pyperclip

### Compilation
*You will need `pyinstaller` in order to proceed.*

- Windows: `pyinstaller src/MainWindow.py -F -i src/GUI/assets/images/p2mm64.ico --noconsole --add-data "src/GUI;GUI" --add-data "src/FALLBACK;FALLBACK" --add-data "src/languages;languages"`

- Linux: `pyinstaller "src/MainWindow.py" -F --add-data "src/GUI:GUI" --add-data "src/FALLBACK:FALLBACK" --add-data "src/languages:languages"`

**Note: if you want to fork the project and do your own releases, you need to change the variables at the top of `Updater.py` to your own information**


# Credits
**Founders**
- kyleraykbs *(Team Lead, Main VScript Dev, Singleplayer Support, Launcher Dev, Exploit Finder, Minor Reverse Engineering)*
- Bumpy *(Minor VScript, Exploit Finder)*

**Head Creators**
- Vista *(Main C++ Dev, Plugin Dev, Reverse Engineering)*
- Wolƒe Strider Shoσter *(Singleplayer Support, VScript Dev)*
- cabiste *(Launcher Dev)*
- Nanoman2525 *(Community Manager, Exploit Finder, Minor VScript)*

**Team Members**
- QuantumCoded (Jeffrey)
- Orsell (AKA zwexit) *(Launcher Dev, Minor VScript, Map Maker)*
- \n *(Test Subject (Under Gunpoint))*