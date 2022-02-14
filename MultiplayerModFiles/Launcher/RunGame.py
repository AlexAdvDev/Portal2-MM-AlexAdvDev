# █ █▀▄▀█ █▀█ █▀█ █▀█ ▀█▀ █▀   ▄█▄   █░█ ▄▀█ █▀█ █ █▄▄ █░░ █▀▀ █▀
# █ █░▀░█ █▀▀ █▄█ █▀▄ ░█░ ▄█   ░▀░   ▀▄▀ █▀█ █▀▄ █ █▄█ █▄▄ ██▄ ▄█

from http.client import LineTooLong
import os


#/////////////////////////////////////////////////////////////////#
#//# detect if we are on windows (by default, we are on Linux) #//#
#/////////////////////////////////////////////////////////////////#

iow = False
# nt is the windows os
if os.name == 'nt':
    print("")
    print("(P2:MM) Windows OS detected!")
    nf = "\\"
    iow = True
else:
    nf = "/"
    print("")
    print("(P2:MM) Linux OS detected!")



#///////////////////////////////#
#//# get the local user path #//#
#///////////////////////////////#

if (iow):
    homefolder = os.environ['USERPROFILE']
else:
    homefolder = os.path.expanduser("~")

print("(P2:MM) Home Folder: " + homefolder)

print("")


# █▀█ ▄▀█ ▀█▀ █░█   █▀▄ █▀▀ ▀█▀ █▀▀ █▀▀ ▀█▀ █▀█ █▀█
# █▀▀ █▀█ ░█░ █▀█   █▄▀ ██▄ ░█░ ██▄ █▄▄ ░█░ █▄█ █▀▄



# █▀▀ █ █░░ █▀▀   █▀▄▀█ █▀█ █░█ █▄░█ ▀█▀ █▀▀ █▀█
# █▀░ █ █▄▄ ██▄   █░▀░█ █▄█ █▄█ █░▀█ ░█░ ██▄ █▀▄

def MountMod(gamepath):
    print("")
    print("(P2:MM) Mounting Mod...")
    # find a place to mount the dlc
    dlcmountpoint = FindAvalibleDLC(gamepath)
    # detect if we have a MultiplayModFiles folder
    if "MultiplayerModFiles" in os.listdir(gamepath):
        print("(P2:MM) MultiplayerModFiles folder found!")
    else:
        print("(P2:MM) MultiplayerModFiles folder not found!")
        print("(P2:MM) Creating MultiplayerModFiles folder...")
        os.mkdir(gamepath + nf + "MultiplayerModFiles")
        print("(P2:MM) MultiplayerModFiles folder created!")
    
    
    # copy MultiplayerModFiles/ModFiles/Portal 2 to the gamepath
    print("(P2:MM) Copying ModFiles folder to " + gamepath + nf + "MultiplayerModFiles" + nf + "ModFiles" + nf + "portal2...")
    # if on windows, use the command line to copy the folder
    if (iow):
        command = "xcopy /E /I /Y \"" + gamepath + nf + "MultiplayerModFiles" + nf + "ModFiles" + nf + "Portal 2\" \"" + gamepath + "\""
        print("(P2:MM) Command: " + command)
        os.system(command)
    else:
        command = "cp -r \"" + gamepath + nf + "MultiplayerModFiles" + nf + "ModFiles" + nf + "Portal 2\" \"" + gamepath.replace("Portal 2", "") + "\""
        print("(P2:MM) Command: " + command)
        # if on linux, use the command line
        os.system(command)
    

    # after we are done copying, we need to change rename the install_dlc folder
    print("(P2:MM) Renaming install_dlc folder to " + dlcmountpoint + "...")
    # if on windows, use the command line to rename the folder
    if (iow):
        command = "move \"" + gamepath + nf + "install_dlc\" \"" + gamepath + nf + dlcmountpoint + "\""
        print("(P2:MM) Command: " + command)
        os.system(command)
    else:
        command = "mv \"" + gamepath + nf + "install_dlc\" \"" + gamepath + nf + dlcmountpoint + "\""
        print("(P2:MM) Command: " + command)
        # if on linux, use the command line
        os.system(command)

def FindAvalibleDLC(gamepath):
    shouldbe = 1
    print("")
    print("(P2:MM) Finding Avalible DLC...")
    print("")
    dlcs = []
    # go through each file in the gamepath
    for file in os.listdir(gamepath):
        # find all of them that start with "portal2_dlc"
        if file.startswith("portal2_dlc"):
            # make sure it's a folder
            if os.path.isdir(gamepath + nf + file):
                # get everything after "portal2_dlc"
                try:
                    dlcnumber = file.split("portal2_dlc")[1]
                except:
                    print("(P2:MM) Error getting DLC name (probably a slice error moving on)!")
                    # move on to the next file
                    continue
                
                # if dlcnumber contains any letters, it's not a number
                if any(char.isalpha() for char in dlcnumber):
                    print("(P2:MM) DLC " + dlcnumber + " is not a number!")
                else:
                    dlcs.append(str(dlcnumber))
                    print("(P2:MM) Adding DLC: " + dlcnumber + " to list...")

    # go through each dlc in the list and sort them
    # sort the list
    dlcs.sort()

    #

    # final pass make sure there are no gaps or in the list
    for dlc in dlcs:
        # if the dlc is not the right number, remove it
        if int(dlc) != shouldbe:
            print("(P2:MM) DLC " + dlc + " removed from list!")
            dlcs.remove(dlc)
        else:
            print("(P2:MM) DLC " + dlc + " added to list!")
        shouldbe += 1
    
    # find the highest dlc number
    print("")
    print("(P2:MM) Used DLCs:")
    print("")
    highest = 0
    for dlc in dlcs:
        print("(P2:MM) " + dlc)
        # get the highest dlc
        if int(dlc) > highest:
            highest = int(dlc)
    
    # if the highest dlc + 1 does not exist then we found our mount point
    if "portal2_dlc" + str(highest + 1) not in os.listdir(gamepath):
        print("")
        print("(P2:MM) DLC Mount Point Found! " + gamepath + nf + "portal2_dlc" + str(highest + 1))
        # return the mount point
        return "portal2_dlc" + str(highest + 1)

        
                


# █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀   █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▀ █▀▄▀█ █▀▀ █▄░█ ▀█▀
# █▄▄ █▄█ █░▀█ █▀░ █ █▄█   █░▀░█ █▀█ █░▀█ █▀█ █▄█ ██▄ █░▀░█ ██▄ █░▀█ ░█░

DefaultConfigFile = [
    "# █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀",
    "# █▄▄ █▄█ █░▀█ █▀░ █ █▄█",
    "",
    "cfgvariant = 16 # DO NOT CHANGE THIS NUMBER WILL AUTO-UPDATE",
    "",
    "#// Launcher //#",
    "",
    "#-----------------------------------",
    "UseProton = off",
    "#-----------------------------------",
    "portal2path = undefined",
    "#-----------------------------------",
    "",
    "#// Portal 2 //#",
    "",
    "#-----------------------------------",
    "UsePlugin = false # Set to true if you want to use the plugin",
    "#-----------------------------------",
    "DedicatedServer = false # Set to true if you want to run the server as a dedicated server (INDEV)",
    "#-----------------------------------",
    "RandomTurretModels = false # Set to true if you want to randomize the turret models",
    "#-----------------------------------",
    "RandomPortalSize = false # Set to true if you want to randomize the portal size",
    "#-----------------------------------",
]

def FindConfigPath():
    print("(P2:MM) Finding Config Path...")
    # the config file should be in documents or .config
    if (iow):
        configpath = homefolder + "\\documents\\multiplayermod.conf"
    else:
        configpath = homefolder + "/.config/multiplayermod.conf"

    # if it doesn't exist, create it
    if not os.path.exists(configpath):
        print("(P2:MM) Config file not found, creating...")
        print("")
        # create the config file
        configfile = open(configpath, "w", encoding="utf-8")
        # write the default config file
        for line in DefaultConfigFile:
            configfile.write(line + "\n")
        # close the file
        configfile.close()
    
    # return the config path
    return configpath
        
def FindInConfig(cfg, search):
    # go through each line
    for line in cfg:
        # check if the line (left side of the =) is the one we want
        if line.split("=")[0].strip() == search:
            print("(P2:MM) Found " + search + " in config!")
            # return the right side of the line
            return line.split("=")[1].strip()
    # if we didn't find it, return undefined
    print("(P2:MM) " + search + " not found in config!")

def EditConfig(filepath, search, newvalue):
    # open the file
    cfg = open(filepath, "r", encoding="utf-8")
    # read the file
    cfgdata = cfg.readlines()
    # close the file
    cfg.close()
    # delete the file
    os.remove(filepath)
    # open the file
    cfg = open(filepath, "w", encoding="utf-8")

    
    # go through each line by index so we can see if there is a match
    for i in range(len(cfgdata)):
        line = cfgdata[i]
        # remove everything after the first #
        line = line.split("#")[0]
        # remove the newline
        line = line.replace("\n", "")
        
        # if the line stripped is not empty and has a =, continue
        if (line != "" and "=" in line):
            # get everything to the left of the =
            leftline = line.split("=")[0]
            # get everything to the right of the =
            rightline = line.split("=")[1]
            # remove every space and tab from the left side
            leftline = leftline.replace(" ", "")
            leftline = leftline.replace("\t", "")
            # remove every tab from the right side
            rightline = rightline.replace("\t", "")
            # strip left and right
            leftline = leftline.strip()
            rightline = rightline.strip()
            # if the left side is the search, replace the right side with the new value
            if (leftline == search):
                print("(P2:MM) Replacing " + rightline + " with " + newvalue + " in config...")
                cfgdata[i] = search + " = " + newvalue + "\n"

    # write the file
    for line in cfgdata:
        cfg.write(line)

    # close the file
    cfg.close()

def ImportConfig():
    print("(P2:MM) Importing Config...")

    # get the config file and open it
    configpath = FindConfigPath()
    configfile = open(configpath, "r", encoding="utf-8")
    config = configfile.readlines()
    configfile.close()


    # process the config file into useable data
    print("(P2:MM) Processing Config...")
    print("")
    print("Config Data========================")
    processedconfig = []
    for line in config:
        # remove everything after the first #
        line = line.split("#")[0]
        # remove the newline
        line = line.replace("\n", "")
        
        # if the line stripped is not empty and has a =, continue
        if (line != "" and "=" in line):
            # get everything to the left of the =
            leftline = line.split("=")[0]
            # get everything to the right of the =
            rightline = line.split("=")[1]
            # remove every space and tab from the left side
            leftline = leftline.replace(" ", "")
            leftline = leftline.replace("\t", "")
            # remove every tab from the right side
            rightline = rightline.replace("\t", "")
            # strip left and right
            leftline = leftline.strip()
            rightline = rightline.strip()
            # recombine the two sides with a =
            line = leftline + "=" + rightline

            # if the line is not empty, add it to the processed config
            if (line != ""):
                processedconfig.append(line)
                print("Line:" + line)

    print("Config Data End====================")
    print("")
    print("(P2:MM) Config Imported!")
    return processedconfig
    


# █ █▄░█ █ ▀█▀
# █ █░▀█ █ ░█░

def Init():
    print("(P2:MM) Initializing...")
    print("")

#//# import the config #//#
    configdata = ImportConfig()
    configpath = FindConfigPath()
    print("")

#//# get the portal 2 path #//#
    # setup a name for the default dlc2 (so we can make sure we get the right path later)

    print("(P2:MM) Checking for Portal 2 Path...")
    portal2path = FindInConfig(configdata, "portal2path")
    
    # if we don't have a path, find it
    if (portal2path == "undefined"):
        print("(P2:MM) Portal 2 Path not predefined!")
        print("(P2:MM) Finding Portal 2 Path...")
        # as a last resort, ask the user to find the path
        hasfoundcorrectpath = False
        while hasfoundcorrectpath == False:
            print("")
            portal2path = input("Enter the path to your Portal 2 installation: ")

            # double check that the path is valid
            if (os.path.exists(portal2path) and os.path.exists(portal2path + nf + "portal2_dlc2")):
                # if it does stop the loop
                print("(P2:MM) Portal 2 Path found!")
                hasfoundcorrectpath = True
            else:
                print("(P2:MM) Invalid Path!")
                print("(P2:MM) Please try again!")
                hasfoundcorrectpath = False

        # write the path to the config
        print("(P2:MM) Writing Portal 2 Path to Config...")
        EditConfig(configpath, "portal2path", portal2path)

    # if we still don't have a path, we can't continue
    if (portal2path == "undefined"):
        print("(P2:MM) [Error] Portal 2 Path not found! Launch cannot continue!")
        exit()

    # double check that the path is valid
    if (os.path.exists(portal2path) and os.path.exists(portal2path + nf + "portal2_dlc2")):
        print("(P2:MM) Portal 2 Path found And Is Correct!")
    else:
        print("(P2:MM) [Error] Invalid Path!")
        print("(P2:MM) [Error] Launch cannot continue!")
        exit()



#//# mount the multiplayer mod #//#
    MountMod(portal2path)

# RUN INIT
Init()