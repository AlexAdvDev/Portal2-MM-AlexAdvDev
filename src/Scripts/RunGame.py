# █ █▀▄▀█ █▀█ █▀█ █▀█ ▀█▀ █▀   ▄█▄   █░█ ▄▀█ █▀█ █ █▄▄ █░░ █▀▀ █▀
# █ █░▀░█ █▀▀ █▄█ █▀▄ ░█░ ▄█   ░▀░   ▀▄▀ █▀█ █▀▄ █ █▄█ █▄▄ ██▄ ▄█

import os
import subprocess
from Scripts.BasicLogger import Log
import Scripts.Configs as cfg 
import Scripts.GlobalVariables as GVars
import __main__
import shutil


# █▀▀ █ █░░ █▀▀   █▀▄▀█ █▀█ █░█ █▄░█ ▀█▀ █▀▀ █▀█
# █▀░ █ █▄▄ ██▄   █░▀░█ █▄█ █▄█ █░▀█ ░█░ ██▄ █▀▄

def MountMod():
    gamepath = cfg.FindInConfig(GVars.configData, "portal2path")
    
    # make sure the gamepath in the config file exists and is valid
    if (gamepath == "undefined") or ((os.path.exists(gamepath)) != True) or (os.path.exists(gamepath + GVars.nf + "portal2_dlc2") != True):
        Log("Portal 2 Path not found!")
        return "undefined"
    
    # detect if the mod files available 
    modFilesPath = os.path.dirname(__main__.__file__) + GVars.nf + "ModFiles" + GVars.nf + "Portal 2" + GVars.nf + "install_dlc"
    if os.path.exists(modFilesPath):
        Log("MultiplayerModFiles folder exists!")
    else:
        Log("MultiplayerModFiles folder not found!")
        return "filesMissing"

    Log("")
    Log("            __________Mounting Mod Start_________")
    Log("Gathering DLC folder data...")
    
    # find a place to mount the dlc
    dlcmountpoint = FindAvailableDLC(gamepath)
    
    destination = shutil.copytree(modFilesPath + GVars.nf+".", gamepath + GVars.nf + dlcmountpoint)
    Log("copied the mod files successfully to"+ destination)

    # patch the binaries
    Log("            ___________Moving Files End__________")
    UnpatchBinaries(gamepath)

    PatchBinaries(gamepath)
    Log("             __________Mounting Mod End__________")

def UnpatchBinaries(gamepath):
    binarys = [
        "bin" + GVars.nf + "linux32" + GVars.nf + "engine.so",
        "bin" + GVars.nf + "engine.dll",
        "portal2" + GVars.nf + "bin" + GVars.nf + "linux32" + GVars.nf + "server.so",
        "portal2" + GVars.nf + "bin" + GVars.nf + "server.dll",
    ]

    Log("")
    Log("             __________Binary Restoration_________")
    Log("Unpatching binaries...")
    for binary in binarys:
        # get the filename
        filename = binary.rsplit(GVars.nf, 1)[1]
        # delete the file from the gamepath if it exitsts
        if (os.path.isfile(gamepath + GVars.nf + filename)):
            Log("Deleting " + gamepath + GVars.nf + filename + "...")
            os.remove(gamepath + GVars.nf + filename)

    # unrename the binaries so we can move them
    UnRenameBinaries(gamepath, binarys)

def PatchBinaries(gamepath):
    Log("")
    Log("Patching binaries...")

    # move the binaries to the game directory
    Log("Moving the patched binaries to " + gamepath + "...")
    Log("")

    binarys = [
        "bin" + GVars.nf + "engine.dll",
        "portal2" + GVars.nf + "bin" + GVars.nf + "server.dll",
        "bin" + GVars.nf + "linux32" + GVars.nf + "engine.so",
        "portal2" + GVars.nf + "bin" + GVars.nf + "linux32" + GVars.nf + "server.so",
    ]

    Log("")
    Log("             _________Binary Moving Start________")
    for binary in binarys:
        Log("Moving " + binary + " to " + gamepath + "...")
        # get the filename
        filename = binary.rsplit(GVars.nf, 1)[1]
        # if the filename already exists, delete it
        if (os.path.isfile(gamepath + GVars.nf + filename)):
            Log("File already exists, deleting...")
            os.remove(gamepath + GVars.nf + filename)

        # copy the binary to the gamepath
        # windows command
        if (GVars.iow):
            command = "copy \"" + gamepath + GVars.nf + binary + "\" \"" + gamepath + GVars.nf + filename + "\""
        # linux command
        elif (GVars.iol):
            command = "cp \"" + gamepath + GVars.nf + binary + "\" \"" + gamepath + GVars.nf + filename + "\""
        Log("Command: " + command)
        os.system(command)
    Log("             __________Binary Moving End_________")


    # patch the binaries
    ###/// ENGINE.DLL ///###
    if (os.path.isfile(gamepath + GVars.nf + "engine.dll")):
        Log("")
        Log("Patching engine.dll...")
        f = open(gamepath + GVars.nf + "engine.dll", "rb")
        data = f.read()
        f.close()
        # remove the file
        os.remove(gamepath + GVars.nf + "engine.dll")
        # replace the data
        data = data.replace(bytes.fromhex("84 c0 74 1f 8b 16 8b 82 cc 00 00 00 68 98 b0 37 10 53 56 ff d0 83 c4 0c 5b 5f 33 c0 5e 8b e5 5d c2 2c 00 8b 16 8b 42 6c 8b ce ff d0 84 c0 75 78 8b 16 8b 42 70 8b ce ff d0 84 c0 75 6b 8b 45 14 8b 16 8b 92 d0 00 00 00 50 53 8b ce ff d2 84 c0 75 0c 8b"), bytes.fromhex("84 d8 74 1f 8b 16 8b 82 cc 00 00 00 68 98 b0 37 10 53 56 ff d0 83 c4 0c 5b 5f 33 c0 5e 8b e5 5d c2 2c 00 8b 16 8b 42 6c 8b ce ff d0 84 c0 75 78 8b 16 8b 42 70 8b ce ff d0 84 c0 75 6b 8b 45 14 8b 16 8b 92 d0 00 00 00 50 53 8b ce ff d2 84 c0 75 0c 8b"))

        data = data.replace(bytes.fromhex("83 f8 03 0f 85 dd 00 00 00 8b 4d 08 33 c0 8d 55 f8 52 89 45 f8 89 45 fc e8 10 27 f2 ff 8b 5d 1c 8d 43 ff 3d fe 07 00 00 0f 87 90 00 00 00 8b 75 10 8b 0e 8b 56 04 8b 46 08 89 4d ec 8b ce 89 55 f0 89 45 f4 e8 c4 3b 14 00 83 f8 01 74 0b 8b ce e8 48 3b 14 00 84 c0 74 13 b9 ac e0 6a 10 e8 ca 3b 14 00 50 8d 4d ec e8 01 3d 14 00 8b 4d 18 8b 45 0c 53 51 8b 4d 08 8d 55 ec 52 50 51 e8 ab a2 ff ff 8b c8 e8 d4"), bytes.fromhex("83 f8 69 0f 85 dd 00 00 00 8b 4d 08 33 c0 8d 55 f8 52 89 45 f8 89 45 fc e8 10 27 f2 ff 8b 5d 1c 8d 43 ff 3d fe 07 00 00 0f 87 90 00 00 00 8b 75 10 8b 0e 8b 56 04 8b 46 08 89 4d ec 8b ce 89 55 f0 89 45 f4 e8 c4 3b 14 00 83 f8 01 74 0b 8b ce e8 48 3b 14 00 84 c0 74 13 b9 ac e0 6a 10 e8 ca 3b 14 00 50 8d 4d ec e8 01 3d 14 00 8b 4d 18 8b 45 0c 53 51 8b 4d 08 8d 55 ec 52 50 51 e8 ab a2 ff ff 8b c8 e8 d4"))
        # write the data back to the file
        f = open(gamepath + GVars.nf + "engine.dll", "wb")
        f.write(data)
        f.close()

    ###/// SERVER.DLL ///###
    if (os.path.isfile(gamepath + GVars.nf + "server.dll")):
        Log("Patching server.dll...")
        f = open(gamepath + GVars.nf + "server.dll", "rb")
        data = f.read()
        f.close()
        # remove the file
        os.remove(gamepath + GVars.nf + "server.dll")
        # replace the data
        # 33 player cap edit
        data = data.replace(b'\x8bM\x08\xc7\x00\x01\x00\x00\x00\xc7\x01\x01\x00\x00\x00\xff\x15', b'\x8bM\x08\xc7\x00\x20\x00\x00\x00\xc7\x01\x20\x00\x00\x00\xff\x15')
        data = data.replace(b'\xf7\xd8\x1b\xc0\xf7\xd8\x83\xc0\x02\x89\x01]', b'\xf7\xd8\x1b\xc0\xf7\xd8\x83\xc0 \x89\x01]')
        data = data.replace(b'\xff\xd0\x85\xc0t\x05\xbe\x03\x00\x00\x00\x8b', b'\xff\xd0\x85\xc0t\x05\xbe\x21\x00\x00\x00\x8b')
        data = data.replace(b'\xff\xd0\x85\xc0\x0f\x85\xaf\x05\x00\x00\xb0\x01_^', b'\xff\xd0\x85\xc0\x0f\x85\xaf\x05\x00\x00\xb0\x20_^')

        # Partner disconnect edit
        data = data.replace(b'disconnect "Partner disconnected"', b'script EntFire("pdcm", "display")')

        # Command patch edit
        data = data.replace(b'restart_level', b'portal2mprslv')
        data = data.replace(b'mp_restart_level', b'portal2mpmprslev')
        data = data.replace(b'mp_earn_taunt', b'portal2mpmper')
        data = data.replace(b'pre_go_to_calibration', b'portal2multiplayrpgtc')
        data = data.replace(b'erase_mp_progress', b'portal2multiemppg')
        data = data.replace(b'mp_mark_all_maps_complete', b'portal2multiplayermpmamcp')
        data = data.replace(b'mp_mark_all_maps_incomplete', b'portal2multiplayermodmpmami')
        data = data.replace(b'pre_go_to_hub', b'portal2mppgth')
        data = data.replace(b'transition_map', b'portal2mptrmap')
        data = data.replace(b'select_map', b'p2mpselmap')
        data = data.replace(b'mp_select_level', b'portal2mpmpsell')
        data = data.replace(b'mp_mark_course_complete', b'portal2multiplayermpmcc')

        # write the data back to the file
        f = open(gamepath + GVars.nf + "server.dll", "wb")
        f.write(data)
        f.close()
        Log("")

    ###/// ENGINE.SO ///###
    if (os.path.isfile(gamepath + GVars.nf + "engine.so")):
        Log("")
        Log("Patching engine.so...")
        f = open(gamepath + GVars.nf + "engine.so", "rb")
        data = f.read()
        f.close()
        # remove the file
        os.remove(gamepath + GVars.nf + "engine.so")
        # replace the data
        # commentary fix (i think)
        data = data.replace(bytes.fromhex("84 c0 0f 84 f5 fc ff ff 8b 06 8d 93 ee 96 d5 ff 83 ec 04 e9 6b ff ff ff 83 ec 0c ff b4 24 80 00 00 00 e8 31 76 2a 00 89 c7 89 34 24 e8 47 c1 ff ff 83 c4 10 84 c0 8b 06 0f 84 99 fc ff ff 8b 96 6c 01 00 00 0b 96 70 01 00 00 0f 85 87 fc ff ff 89 f9 84 c9 0f 85 7d fc ff ff 83 ec 08 8b b8 d0 00 00 00 6a 00 ff b4 24 80 00 00 00 e8 b7 74 2a 00 5a ff b4 24 88 00 00 00 50 8d 83 44 a0 d5 ff 50 ff b4 24 8c 00 00 00 56 ff d7 83 c4 20 31 ff e9 ff fe ff ff 8d"), bytes.fromhex("84 d8 0f 84 f5 fc ff ff 8b 06 8d 93 ee 96 d5 ff 83 ec 04 e9 6b ff ff ff 83 ec 0c ff b4 24 80 00 00 00 e8 31 76 2a 00 89 c7 89 34 24 e8 47 c1 ff ff 83 c4 10 84 c0 8b 06 0f 84 99 fc ff ff 8b 96 6c 01 00 00 0b 96 70 01 00 00 0f 85 87 fc ff ff 89 f9 84 c9 0f 85 7d fc ff ff 83 ec 08 8b b8 d0 00 00 00 6a 00 ff b4 24 80 00 00 00 e8 b7 74 2a 00 5a ff b4 24 88 00 00 00 50 8d 83 44 a0 d5 ff 50 ff b4 24 8c 00 00 00 56 ff d7 83 c4 20 31 ff e9 ff fe ff ff 8d"))
        # steam validation removal
        data = data.replace(bytes.fromhex("83 f8 03 74 6c e8 a7 7d 24 00 83 ec 08 ff 74 24 4c 50 e8 ca 93 24 00 83 c4 10 84 c0 75 20 8b 16 88 44 24 0f 8d 8b 56 94 d5 ff 83 ec 04 51 57 56 ff 92 d0 00 00 00 0f b6 44 24 1f 83 c4 10 83 c4 2c 5b 5e 5f 5d c3 8d 76 00 8b 06 8d 93 26 94 d5 ff"), bytes.fromhex("83 f8 69 74 6c e8 a7 7d 24 00 83 ec 08 ff 74 24 4c 50 e8 ca 93 24 00 83 c4 10 84 c0 75 20 8b 16 88 44 24 0f 8d 8b 56 94 d5 ff 83 ec 04 51 57 56 ff 92 d0 00 00 00 0f b6 44 24 1f 83 c4 10 83 c4 2c 5b 5e 5f 5d c3 8d 76 00 8b 06 8d 93 26 94 d5 ff"))
        # write the data back to the file
        f = open(gamepath + GVars.nf + "engine.so", "wb")
        f.write(data)
        f.close()

    ###/// SERVER.SO ///###
    if (os.path.isfile(gamepath + GVars.nf + "server.so")):
        Log("Patching server.so...")
        f = open(gamepath + GVars.nf + "server.so", "rb")
        data = f.read()
        f.close()
        # remove the file
        os.remove(gamepath + GVars.nf + "server.so")
        # replace the data
        # 33 player cap edit
        data = data.replace(b'\x01\x00\x00\x00\x8bD$\x14\xc7\x00\x01', b'\x1f\x00\x00\x00\x8bD$\x14\xc7\x00\x1f')
        data = data.replace(b'\xc0\x0f\xb6\xc0\x83\xc0\x02\x89\x02\x83\xc4', b'\xc0\x0f\xb6\xc0\x83\xc0 \x89\x02\x83\xc4')
        data = data.replace(b'\x0f\xb6\xc0\x83\xc0\x02\x83\xec\x04\x89\xf3', b'\x0f\xb6\xc0\x83\xc0 \x83\xec\x04\x89\xf3')
        data = data.replace(b'K\x8de\xf4\xb8\x01\x00\x00\x00[^', b'K\x8de\xf4\xb8\x1f\x00\x00\x00[^')

        # Partner disconnect edit
        data = data.replace(b'disconnect "Partner disconnected"', b'script EntFire("pdcm", "display")')

        # Command patch edit
        data = data.replace(b'restart_level', b'portal2mprslv')
        data = data.replace(b'mp_restart_level', b'portal2mpmprslev')
        data = data.replace(b'mp_earn_taunt', b'portal2mpmper')
        data = data.replace(b'pre_go_to_calibration', b'portal2multiplayrpgtc')
        data = data.replace(b'erase_mp_progress', b'portal2multiemppg')
        data = data.replace(b'mp_mark_all_maps_complete', b'portal2multiplayermpmamcp')
        data = data.replace(b'mp_mark_all_maps_incomplete', b'portal2multiplayermodmpmami')
        data = data.replace(b'pre_go_to_hub', b'portal2mppgth')
        data = data.replace(b'transition_map', b'portal2mptrmap')
        data = data.replace(b'select_map', b'p2mpselmap')
        data = data.replace(b'mp_select_level', b'portal2mpmpsell')
        data = data.replace(b'mp_mark_course_complete', b'portal2multiplayermpmcc')

        # write the data back to the file
        f = open(gamepath + GVars.nf + "server.so", "wb")
        f.write(data)
        f.close()
        Log("")

    # rename the files so the new files are used
    Log("Renaming binaries...")
    RenameBinaries(gamepath, binarys)

def RenameBinaries(gamepath, binarys):
    # binarys = [
    #     "bin/linux32/engine.so",
    #     "bin/engine.dll",
    #     "portal2/bin/linux32/server.so",
    #     "portal2/bin/server.dll",
    # ]

    # go through the list of binaries
    for binary in binarys:
        # if the binary exists
        if (os.path.isfile(gamepath + GVars.nf + binary)):
            # add a ".override" to the end of the binary
            os.rename(gamepath + GVars.nf + binary, gamepath + GVars.nf + binary + ".override")
            Log("Renamed " + binary + " to " + binary + ".override")

def UnRenameBinaries(gamepath, binarys):
    # binarys = [
    #     "bin/linux32/engine.so",
    #     "bin/engine.dll",
    #     "portal2/bin/linux32/server.so",
    #     "portal2/bin/server.dll",
    # ]

    Log("")
    Log("Un-renaming binaries...")

    # go through the list of binaries
    for binary in binarys:
        # add a ".override" to the end of the binary
        binary = binary + ".override"
        # if the binary exists
        if (os.path.isfile(gamepath + GVars.nf + binary)):
            Log("Un-renaming " + binary + " to " + binary[:-9])
            # if a file with the name gamepath + GVars.nf + binary[:-9] exists
            if (os.path.isfile(gamepath + GVars.nf + binary[:-9])):
                # remove the file
                os.remove(gamepath + GVars.nf + binary)
            else:
                # rename the binary back to the original
                os.rename(gamepath + GVars.nf + binary, gamepath + GVars.nf + binary[:-9])

def DeleteUnusedDlcs(gamepath):
    Log("")
    Log("            _________Dealing with Folders________")
    Log("Deleting in-use DLCs...")
    # go through each file in the gamepath
    for file in os.listdir(gamepath):
        # find all the files/folders that start with "portal2_dlc"
        if file.startswith("portal2_dlc"):
            # make sure it's a folder
            if os.path.isdir(gamepath + GVars.nf + file):
                # if inside the folder there is a file called "32playermod.identifier" delete this folder
                if "32playermod.identifier" in os.listdir(gamepath + GVars.nf + file):
                    Log("Found OLD DLC: " + file)
                    # delete the folder even if it's not empty
                    # Windows command
                    if (GVars.iow):
                        command = "rmdir /S /Q \"" + gamepath + GVars.nf + file + "\""
                    # Linux command
                    elif (GVars.iol):
                        command = "rm -r \"" + gamepath + GVars.nf + file + "\""
                        
                    os.system(command)
                    Log("Deleted OLD DLC: " + file)
                    Log("Command: " + command)

def FindAvailableDLC(gamepath):
    Log("Finding Available DLC...")
    dlcs = []
    DeleteUnusedDlcs(gamepath)
    # go through each file in the gamepath
    for file in os.listdir(gamepath):
        # find all the files/folders that start with "portal2_dlc"
        if file.startswith("portal2_dlc"):
            # make sure it's a folder
            if os.path.isdir(gamepath + GVars.nf + file):
                # get everything after "portal2_dlc"
                try:
                    dlcnumber = file.split("portal2_dlc")[1]
                except Exception as e:
                    Log("Error getting DLC name (probably a slice error moving on)!")
                    Log("Error: " + str(e))
                    # move on to the next file
                    continue

                # if dlcnumber contains any letters, it's not a number
                if any(char.isalpha() for char in dlcnumber):
                    Log("DLC " + dlcnumber + " is not a number!")
                else:
                    dlcs.append(str(dlcnumber))
                    Log("Adding DLC: " + dlcnumber + " to our internal list...")

    # sort each dlc number lower to higher
    dlcs.sort(key=int)
    # return the folder where to mount the mod
    return "portal2_dlc" + str(int(dlcs[len(dlcs)-1]) + 1)



# █ █▄░█ █ ▀█▀
# █ █░▀█ █ ░█░

def LaunchGame():
    Log("")
    gamepath = cfg.FindInConfig(GVars.configData, "portal2path")
    Log("Running Game...")
    
    # LAUNCH OPTIONS: -applaunch 620 -novid -allowspectators -nosixense +map mp_coop_lobby_3 +developer 918612 -conclearlog -condebug -console
    try:
        if (GVars.iow):
            # start portal 2 with the launch options and dont wait for it to finish
            subprocess.run([gamepath + GVars.nf + "portal2.exe", "-novid", "-allowspectators", "-nosixense", "+map mp_coop_lobby_3", "+developer 918612", "-conclearlog", "-condebug", "-console"])
            Log("Game exited successfully.")
        else:
            os.system("steam -applaunch 620 -novid -allowspectators -nosixense +map mp_coop_lobby_3 +developer 918612 -conclearlog -condebug -console")
            Log("Game launch successful!")

    except Exception as e:
        Log("Failed to launch Portal 2!")
        Log("Error: " + str(e))
        quit()
    
    

####### INIT ########
def Init():
    Log("")
    Log("Initializing...")
    Log("")


#//# mount the multiplayer mod #//#
    # if (WillMount):
    #     MountMod(portal2path) # mount the mod
    #     LaunchGame(portal2path) # launch the game
    # else:
    #     DeleteUnusedDlcs(portal2path)
    #     UnpatchBinaries(portal2path)

if __name__ == "__main__":
    # RUN INIT
    Init()