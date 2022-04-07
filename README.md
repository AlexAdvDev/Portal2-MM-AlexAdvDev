# Created by ***kyleraykbs, Nanoman2525, Vista, Bumpy, & Wolƒe Strider Shoσter***
**Big thanks to our team members: ***Cabiste, sear, & Jeffrey*****

# v1.5 vs v2.0
**You may have noticed that there hasn't been a new release for the better half of a year**.

During this time, however, we have restructured the mod almost entirely to allow for better efficiency and more features collectively from 1,022 commits at this point in time. Because of this, the method of updating the mod that we expanded upon in the previous version (v1.5) is deprecated; It will be replaced with a newer, more flexible one.

Because of the amount of stability fixes and new features in the recent version of the mod, we have decided to rename it to version 2.0 rather than 1.6.
As it stands right now, version 1.5 is severely outdated, however, version 2.0 also has its issues with stability, as it is constantly being updated.

The pros and cons are listed below, though we recommend sticking with the latest pre-release. (v2.0)

***Version 1.5***
```
+ Easy to install
+ Gets the job done of having multiple players
- Lacks many features
- Rushed codebase
- Existing features may be broken due to binary changes in recent Portal 2 updates
- Only supports the Windows OS
```

***Version 2.0***
```
+ Presents tons new features that were not in 1.5
+ Makes use of a custom plugin to bring about some of the features (Broken on Windows at the moment)
+ Full Linux support in addition to Windows
+ Rewritten codebase to allow for efficiency
+ Coded in a way to more likely to work with every Portal 2's continual updates.
+ Stable, user-friendly launcher
+ More organized file-structure
- Will take longer to install (requires that you install Python and add it to PATH)
- Some features may break as we update the pre-release.
- Not easy to update
```


# Mod features (Already shipped in v1.5)
1. Maximum player cap of 33 (not 32!)
2. Elastic player collision
3. Custom player colors
4. Player join/disconnect messages
5. Patched some game breaking commands to prevent abuse from other players
6. Full cooperative campaign support
7. Support for Windows 11, 10, 8.1, 8, 7, Vista, and XP

# Planned features (Will be shipped in v2.0)
1. Full singleplayer campaign support (Almost finished, needs a lot more polishing)
2. Nametags (Finished)
3. Support for Linux (Finished)
4. Full support for the cooperative Gelocity workshop maps (Two of the three maps are finished)
5. Chat commands (Finished)
6. Allow players to spawn in any map without breaking (Finished)
7. Make the launcher patch files on the spot for consistency and stability (Finished)
8. Allow the server to cache objects server-side without crashing (Finished)

# Features on the table
1. Dedicated servers
2. Sixense support
3. Player specific colored portals

# Installation & use

- Latest version released: https://github.com/kyleraykbs/Portal2-32PlayerMod-Lite/releases/latest
  - v2.0 can be downloaded from the commits.

- Steam guide: https://steamcommunity.com/sharedfiles/filedetails/?id=2458260280
  - ***The Steam guide goes over everything you need to know in order to get the mod working, but just in case, we have also prepared supplementary videos if you get stuck.***

- Version 1.5 YouTube installation: https://www.youtube.com/watch?v=AOh6qela-uI
- Version 2.0 YouTube installation: https://www.youtube.com/watch?v=_Vsey2wPXSo

# Discord

If you need help setting up this mod, or just want to chill with a great community filled with developers, feel free to join our Discord server!

https://discord.gg/kW3nG6GKpF

# How to build
- This project can be built theoretically on any OS that supports python 3 
1. Clone the repo
2. Create a virtual python environment (Not needed but preferred) 
	1. Create the virtual environment 
		- `python3 -m venv env`
	2.  Activate the virtual environment 
		- Windows: `.\env\Scripts\activate.bat`
		- Linux: `source ./venv/bin/activate`
4. Download dependencies 
	- `pip install PySide6`
	- `pip install requests`
5. Run `src/MainWindow.py`