# █ █▀▄▀█ █▀█ █▀█ █▀█ ▀█▀ █▀   ▄█▄   █░█ ▄▀█ █▀█ █ █▄▄ █░░ █▀▀ █▀
# █ █░▀░█ █▀▀ █▄█ █▀▄ ░█░ ▄█   ░▀░   ▀▄▀ █▀█ █▀▄ █ █▄█ █▄▄ ██▄ ▄█

import os
import threading

from Scripts.BasicLogger import Log
import Scripts.GlobalVariables as GVars
import Scripts.EncryptCVars as EncryptCVars
import Scripts.Configs as cfg
import subprocess
import Scripts.BasicFunctions as BF
import random
import time

CommandReplacements = [
    ['pre_go_to_hub', 'p2mm_tran_hub', 'p2mm_tran_hub'],
    ['pre_go_to_calibration', 'p2mm_tran_calibration', 'p2mm_tran_calibration'],

    # ['go_to_hub', 'p2mm__gth', 'p2mm__gth'], # This is internally called in maps so we can't patch it
    ['go_to_calibration', 'p2mm_go_to_calibr', 'p2mm_go_to_calibr'],

    ['restart_level', 'p2mm__restart', 'p2mm__restart'],
    ['mp_restart_level', 'p2mm__mp_restart', 'p2mm__mp_restart'],

    ['transition_map', 'p2mm_next_maps', 'p2mm_next_maps'],

    ['select_map', 'p2mmselmap', 'p2mmselmap'],
    ['mp_select_level', 'p2mm_goto_level', 'p2mm_goto_level'],

    ['erase_mp_progress', 'p2mm_cut_progress', 'p2mm_cut_progress'],
    ['mp_earn_taunt', 'p2mm_earn_tnt', 'p2mm_earn_tnt'],
    ['mp_mark_all_maps_complete', 'p2mm_label_coop_completed', 'p2mm_label_coop_completed'],
    ['mp_mark_all_maps_incomplete', 'p2mm_label_coop_incompleted', 'p2mm_label_coop_incompleted'],
    ['mp_mark_course_complete', 'p2mm_course_#_completed', 'p2mm_course_#_completed'],
]


# █▀▀ █ █░░ █▀▀   █▀▄▀█ █▀█ █░█ █▄░█ ▀█▀ █▀▀ █▀█
# █▀░ █ █▄▄ ██▄   █░▀░█ █▄█ █▄█ █░▀█ ░█░ ██▄ █▀▄

def SetNewEncryptions() -> None:
    # set the new encryptions
    Log("Setting new encryptions...")
    Log("")
    minlen = 3
    for cmdrep in CommandReplacements:
        Log("===========")
        Log("Original CVAR: " + cmdrep[1])
        cmdrep[2] = cmdrep[1][:len(cmdrep[1]) - int(len(cmdrep[1]) / minlen)] + ''.join(random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") for i in range(int(len(cmdrep[1]) / minlen)))
        Log("New CVAR:      " + cmdrep[2])
        Log("===========")

def UnEncryptEncryptions() -> None:
    Log("UnEncrypting Encryptions...")
    for cmdrep in CommandReplacements:
        cmdrep[2] = cmdrep[1]
    Log("Finished UnEncrypting Encryptions")

def SetVscriptConfigFile(vsconfigfile: str) -> None:
    Log("")
    Log("")
    Log("")
    Log("")
    Log("")
    Log("====================================================")
    Log("Setting VScript config file: " + vsconfigfile)
    Log("")
    p2cfgs = cfg.GetConfigList("menu", "portal2")

    lines = open(vsconfigfile, "r", encoding="utf-8").readlines()

    indx = -1
    for line in lines:
        indx += 1
        # remove all spaces
        line = line.strip().replace(" ", "")

        # if the line contains a // remove it
        if (line.find("//") != -1):
            line = line.split("//")[0]
        # if the line is empty skip it
        if (line == ""):
            continue
        # if the line doesnt contain a = or <- skip it
        if (line.find("=") == -1 and line.find("<-") == -1):
            continue

        key = ""

        # if the line has a <-
        if (line.find("<-") != -1):
            # split the <-
            key = line.split("<-")[0]

        # if the line has a =
        if (line.find("=") != -1):
            # split the =
            key = line.split("=")[0]

        for p2cfg in p2cfgs:
            if (key == p2cfg):
                val = GVars.configData[p2cfg]["value"]
                Log("Setting " + p2cfg + " To " + val)
                line = key + " <- " + val
                Log(line)
                lines[indx] = line + "\n"

    ################## ADMINS
    # convert the lines to a string with newlines
    lines = ''.join(lines)
    print(lines)

    # find the admins section
    admins = lines.find("Admins <-")
    # find the next [ after the admins section
    nextObrack = lines.find("[", admins)
    # add the player line after the admins section
    for player in GVars.configData["Players"]["value"]:
        name = player["name"]
        level = player["adminlevel"]
        steamid = player["steamid"]
        print("Adding " + name + " to admins")

        lines = lines[:nextObrack + 1] + '\n"[' + level + "]" + steamid + '", // ' + name + lines[nextObrack + 1:]

    open(vsconfigfile, "w", encoding="utf-8").write(lines)

    Log("====================================================")
    Log("")
    Log("")
    Log("")
    Log("")
    Log("")

def MountMod(gamepath: str, encrypt: bool = False) -> bool:
    Log("")
    Log("            __________Mounting Mod Start_________")
    Log("Gathering DLC folder data...")

    modFilesPath = GVars.modPath + GVars.nf + "ModFiles" + GVars.nf + "Portal 2" + GVars.nf + "install_dlc"

    # find a place to mount the dlc
    dlcmountpoint = FindAvailableDLC(gamepath)

    destination = BF.CopyFolder(modFilesPath + GVars.nf+".", gamepath + GVars.nf + dlcmountpoint)
    Log("Successfully copied the mod files to "+ destination)

    nutConfigFile = gamepath + GVars.nf + dlcmountpoint + GVars.nf + "scripts" + GVars.nf + "vscripts" + GVars.nf + "multiplayermod" + GVars.nf + "config.nut"
    if os.path.exists(nutConfigFile):
        SetVscriptConfigFile(nutConfigFile)

    #### ENCRYPT THE CVARS #####
    Log("____ENCRYPTING CVARS____")
    if encrypt:
        SetNewEncryptions()
    else:
        UnEncryptEncryptions()
    path = gamepath + GVars.nf + dlcmountpoint

    if encrypt:
        for cmdrep in CommandReplacements:
            EncryptCVars.Encrypt(BF.ConvertPath(path), cmdrep[1], cmdrep[2])

    Log("__ENCRYPTING CVARS END__")

    # patch the binaries
    Log("            ___________Moving Files End__________")
    UnpatchBinaries(gamepath)

    PatchBinaries(gamepath)
    Log("            ___________Mounting Mod End__________")
    return True

def UnpatchBinaries(gamepath: str) -> None:
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

def PatchBinaries(gamepath: str) -> None:
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
        # Get the filename
        filename = binary.rsplit(GVars.nf, 1)[1]

        # If the file already exists, it will be replaced. There's no need to delete it manually.
        try:
            # copy the binary to the gamepath
            BF.CopyFile(gamepath + GVars.nf + binary, gamepath + GVars.nf + filename)
            Log("Copied " + binary+" to " + gamepath + GVars.nf + filename)
        except:
            # On Windows there is no "linux32" folder, so we avoid an error.
            Log("Unable to copy "+ binary+", since it doesn't exist!" )
    Log("             __________Binary Moving End_________")


    # patch the binaries
    ###/// ENGINE.DLL ///###
    if (os.path.isfile(gamepath + GVars.nf + "engine.dll")):
        Log("")
        Log("Patching engine.dll...")

        data = open(gamepath + GVars.nf + "engine.dll", "rb").read()

        # Delete the file
        os.remove(gamepath + GVars.nf + "engine.dll")
        # replace the data
        data = data.replace(bytes.fromhex("84 c0 74 1f 8b 16 8b 82 cc 00 00 00 68 98 b0 37 10 53 56 ff d0 83 c4 0c 5b 5f 33 c0 5e 8b e5 5d c2 2c 00 8b 16 8b 42 6c 8b ce ff d0 84 c0 75 78 8b 16 8b 42 70 8b ce ff d0 84 c0 75 6b 8b 45 14 8b 16 8b 92 d0 00 00 00 50 53 8b ce ff d2 84 c0 75 0c 8b"), bytes.fromhex("84 d8 74 1f 8b 16 8b 82 cc 00 00 00 68 98 b0 37 10 53 56 ff d0 83 c4 0c 5b 5f 33 c0 5e 8b e5 5d c2 2c 00 8b 16 8b 42 6c 8b ce ff d0 84 c0 75 78 8b 16 8b 42 70 8b ce ff d0 84 c0 75 6b 8b 45 14 8b 16 8b 92 d0 00 00 00 50 53 8b ce ff d2 84 c0 75 0c 8b"))

        # data = data.replace(bytes.fromhex("83 f8 03 0f 85 dd 00 00 00 8b 4d 08 33 c0 8d 55 f8 52 89 45 f8 89 45 fc e8 10 27 f2 ff 8b 5d 1c 8d 43 ff 3d fe 07 00 00 0f 87 90 00 00 00 8b 75 10 8b 0e 8b 56 04 8b 46 08 89 4d ec 8b ce 89 55 f0 89 45 f4 e8 c4 3b 14 00 83 f8 01 74 0b 8b ce e8 48 3b 14 00 84 c0 74 13 b9 ac e0 6a 10 e8 ca 3b 14 00 50 8d 4d ec e8 01 3d 14 00 8b 4d 18 8b 45 0c 53 51 8b 4d 08 8d 55 ec 52 50 51 e8 ab a2 ff ff 8b c8 e8 d4"), bytes.fromhex("83 f8 69 0f 85 dd 00 00 00 8b 4d 08 33 c0 8d 55 f8 52 89 45 f8 89 45 fc e8 10 27 f2 ff 8b 5d 1c 8d 43 ff 3d fe 07 00 00 0f 87 90 00 00 00 8b 75 10 8b 0e 8b 56 04 8b 46 08 89 4d ec 8b ce 89 55 f0 89 45 f4 e8 c4 3b 14 00 83 f8 01 74 0b 8b ce e8 48 3b 14 00 84 c0 74 13 b9 ac e0 6a 10 e8 ca 3b 14 00 50 8d 4d ec e8 01 3d 14 00 8b 4d 18 8b 45 0c 53 51 8b 4d 08 8d 55 ec 52 50 51 e8 ab a2 ff ff 8b c8 e8 d4"))
        # write the data back to the file
        open(gamepath + GVars.nf + "engine.dll", "wb").write(data)

    ###/// SERVER.DLL ///###
    if (os.path.isfile(gamepath + GVars.nf + "server.dll")):
        Log("Patching server.dll...")

        data = open(gamepath + GVars.nf + "server.dll", "rb").read()

        # Delete the file
        os.remove(gamepath + GVars.nf + "server.dll")
        # replace the data
        # 32 player cap edit
        data = data.replace(b'\x8bM\x08\xc7\x00\x01\x00\x00\x00\xc7\x01\x01\x00\x00\x00\xff\x15', b'\x8bM\x08\xc7\x00\x20\x00\x00\x00\xc7\x01\x20\x00\x00\x00\xff\x15')
        data = data.replace(b'\xf7\xd8\x1b\xc0\xf7\xd8\x83\xc0\x02\x89\x01]', b'\xf7\xd8\x1b\xc0\xf7\xd8\x83\xc0 \x89\x01]')
        data = data.replace(b'\xff\xd0\x85\xc0t\x05\xbe\x03\x00\x00\x00\x8b', b'\xff\xd0\x85\xc0t\x05\xbe\x21\x00\x00\x00\x8b')
        data = data.replace(b'\xff\xd0\x85\xc0\x0f\x85\xaf\x05\x00\x00\xb0\x01_^', b'\xff\xd0\x85\xc0\x0f\x85\xaf\x05\x00\x00\xb0\x20_^')
        # Rename the server game description to our mod
        data = data.replace(b'\x50\x6f\x72\x74\x61\x6c\x20\x32\x20\x43\x6f\x6f\x70', b'\x50\x6f\x72\x74\x61\x6c\x20\x32\x20\x3a\x20\x4d\x4d')

        # Partner disconnect edit
        data = data.replace(b'disconnect "Partner disconnected"', b'script EntFire("pdcm", "display")')

        # Command patch edit
        Log("===Patching commands===")
        for cmdrep in CommandReplacements:
            Log("Replacing " + cmdrep[0] + " with " + cmdrep[2])
            data = data.replace(bytes(cmdrep[0], 'utf-8'), bytes(cmdrep[2], 'utf-8'))
        Log("==========Done=========")

        # write the data back to the file
        open(gamepath + GVars.nf + "server.dll", "wb").write(data)
        Log("")

    # we don't need to patch the other files since they don't exist on windows
    if GVars.iow:
        # rename the files so the new files are used
        Log("Renaming binaries...")
        RenameBinaries(gamepath, binarys)
        return

    ###/// ENGINE.SO ///###
    if (os.path.isfile(gamepath + GVars.nf + "engine.so")):
        Log("")
        Log("Patching engine.so...")

        data = open(gamepath + GVars.nf + "engine.so", "rb").read()

        # remove the file
        os.remove(gamepath + GVars.nf + "engine.so")
        # replace the data
        # commentary fix (i think)
        data = data.replace(bytes.fromhex("84 c0 0f 84 f5 fc ff ff 8b 06 8d 93 ee 96 d5 ff 83 ec 04 e9 6b ff ff ff 83 ec 0c ff b4 24 80 00 00 00 e8 31 76 2a 00 89 c7 89 34 24 e8 47 c1 ff ff 83 c4 10 84 c0 8b 06 0f 84 99 fc ff ff 8b 96 6c 01 00 00 0b 96 70 01 00 00 0f 85 87 fc ff ff 89 f9 84 c9 0f 85 7d fc ff ff 83 ec 08 8b b8 d0 00 00 00 6a 00 ff b4 24 80 00 00 00 e8 b7 74 2a 00 5a ff b4 24 88 00 00 00 50 8d 83 44 a0 d5 ff 50 ff b4 24 8c 00 00 00 56 ff d7 83 c4 20 31 ff e9 ff fe ff ff 8d"), bytes.fromhex("84 d8 0f 84 f5 fc ff ff 8b 06 8d 93 ee 96 d5 ff 83 ec 04 e9 6b ff ff ff 83 ec 0c ff b4 24 80 00 00 00 e8 31 76 2a 00 89 c7 89 34 24 e8 47 c1 ff ff 83 c4 10 84 c0 8b 06 0f 84 99 fc ff ff 8b 96 6c 01 00 00 0b 96 70 01 00 00 0f 85 87 fc ff ff 89 f9 84 c9 0f 85 7d fc ff ff 83 ec 08 8b b8 d0 00 00 00 6a 00 ff b4 24 80 00 00 00 e8 b7 74 2a 00 5a ff b4 24 88 00 00 00 50 8d 83 44 a0 d5 ff 50 ff b4 24 8c 00 00 00 56 ff d7 83 c4 20 31 ff e9 ff fe ff ff 8d"))
        # steam validation removal
        data = data.replace(b"\xFF\x90\xD0\x00\x00\x00\x83\xC4\x10\x31\xC0", b"\x31\xC0\x40\x83\xC4\x10\xEB\x03\x10\x31\xC0")
        # write the data back to the file
        open(gamepath + GVars.nf + "engine.so", "wb").write(data)

    ###/// SERVER.SO ///###
    if (os.path.isfile(gamepath + GVars.nf + "server.so")):
        Log("Patching server.so...")

        data = open(gamepath + GVars.nf + "server.so", "rb").read()

        # remove the file
        os.remove(gamepath + GVars.nf + "server.so")
        # replace the data
        # 32 player cap edit
        data = data.replace(b'\x01\x00\x00\x00\x8bD$\x14\xc7\x00\x01', b'\x1f\x00\x00\x00\x8bD$\x14\xc7\x00\x1f')
        data = data.replace(b'\xc0\x0f\xb6\xc0\x83\xc0\x02\x89\x02\x83\xc4', b'\xc0\x0f\xb6\xc0\x83\xc0 \x89\x02\x83\xc4')
        data = data.replace(b'\x0f\xb6\xc0\x83\xc0\x02\x83\xec\x04\x89\xf3', b'\x0f\xb6\xc0\x83\xc0 \x83\xec\x04\x89\xf3')
        data = data.replace(b'K\x8de\xf4\xb8\x01\x00\x00\x00[^', b'K\x8de\xf4\xb8\x1f\x00\x00\x00[^')
        # Rename the server game description to our mod
        data = data.replace(b'\x50\x6f\x72\x74\x61\x6c\x20\x32\x20\x43\x6f\x6f\x70', b'\x50\x6f\x72\x74\x61\x6c\x20\x32\x20\x3a\x20\x4d\x4d')

        # Partner disconnect edit
        data = data.replace(b'disconnect "Partner disconnected"', b'script EntFire("pdcm", "display")')

        # Command patch edit
        Log("===Patching commands===")
        for cmdrep in CommandReplacements:
            Log("Replacing " + cmdrep[0] + " with " + cmdrep[2])
            data = data.replace(bytes(cmdrep[0], 'utf-8'), bytes(cmdrep[2], 'utf-8'))
        Log("==========Done=========")

        # write the data back to the file
        open(gamepath + GVars.nf + "server.so", "wb").write(data)
        Log("")

    # rename the files so the new files are used
    Log("Renaming binaries...")
    RenameBinaries(gamepath, binarys)

def RenameBinaries(gamepath: str, binarys: list[str]) -> None:
    # binarys = [
    #     "bin/linux32/engine.so",
    #     "bin/engine.dll",
    #     "portal2/bin/linux32/server.so",
    #     "portal2/bin/server.dll",
    # ]

    # go through the list of binaries
    for binary in binarys:
        filename = binary.rsplit(GVars.nf, 1)[1]
        # if the binary exists
        extra = "Portal2" + GVars.nf + "bin" + GVars.nf
        if (os.path.isfile(gamepath + GVars.nf + binary)):
            # add a ".p2mmoverride" to the end of the binary
            os.rename(gamepath + GVars.nf + binary, gamepath + GVars.nf + binary + ".p2mmoverride")
            Log("Renamed " + binary + " to " + binary + ".p2mmoverride")

            if filename.startswith("engine"):
                extra = "bin" + GVars.nf
            # copy the binary to the gamepath
            BF.MoveFile(gamepath + GVars.nf + filename,
                        gamepath + GVars.nf + extra + filename)

def UnRenameBinaries(gamepath: str, binarys: list[str]) -> None:
    # binarys = [
    #     "bin/linux32/engine.so",
    #     "bin/engine.dll",
    #     "portal2/bin/linux32/server.so",
    #     "portal2/bin/server.dll",
    # ]

    Log("")
    Log("Un-renaming binaries...")

    # Go through the list of binaries
    for Og_binary in binarys:
        # Add a ".p2mmoverride" file extension to the end of the binary's name
        binary = Og_binary + ".p2mmoverride"
        # If the binary exists
        if (os.path.isfile(gamepath + GVars.nf + binary)):
            Log("Un-renaming " + binary + " to " + Og_binary)

            # If a file with the original binary's name exist delete it
            if (os.path.isfile(gamepath + GVars.nf + Og_binary)):
                os.remove(gamepath + GVars.nf + Og_binary)

            # Rename the binary back to it's original name
            os.rename(gamepath + GVars.nf + binary, gamepath + GVars.nf + Og_binary)

def DeleteUnusedDlcs(gamepath: str) -> None:
    Log("")
    Log("            _________Dealing with Folders________")

    if ((os.path.exists(gamepath)) != True) or (os.path.exists(gamepath + GVars.nf + "portal2_dlc2") != True):
        Log("Portal 2 game path not found!")
        return

    # go through each file in the gamepath
    for file in os.listdir(gamepath):
        # find all the folders that start with "portal2_dlc"
        if file.startswith("portal2_dlc") and os.path.isdir(gamepath + GVars.nf + file):
            # if inside the folder there is a file called "32playermod.identifier" delete this folder
            if "32playermod.identifier" in os.listdir(gamepath + GVars.nf + file):
                Log("Found old DLC: " + file)
                # delete the folder even if it's not empty
                BF.DeleteFolder(gamepath + GVars.nf + file)
                Log("Deleted old DLC: " + file)


def FindAvailableDLC(gamepath: str) -> str:
    Log("Finding the next increment in DLC folders...")
    dlcs = []
    DeleteUnusedDlcs(gamepath)
    # go through each file in the gamepath
    for file in os.listdir(gamepath):
        # find all the folders that start with "portal2_dlc"
        if file.startswith("portal2_dlc") and os.path.isdir(gamepath + GVars.nf + file):
            # get everything after "portal2_dlc"
            try:
                dlcnumber = file.split("portal2_dlc")[1]
            except Exception as e:
                Log("Error getting DLC name! Probably a slice error. Moving on!")
                Log("Error: " + str(e))
                # move on to the next file
                continue

            # if dlcnumber contains any letters, it's not a number
            if any(char.isalpha() for char in dlcnumber):
                Log("DLC " + dlcnumber + " is not a number!")
            else:
                dlcs.append(str(dlcnumber))
                Log("Adding DLC: " + dlcnumber + " to our internal list to ignore...")

    # sort each dlc number lower to higher
    dlcs.sort(key=int)
    # return the folder where to mount the mod
    return "portal2_dlc" + str(int(dlcs[len(dlcs)-1]) + 1)




# █ █▄░█ █ ▀█▀
# █ █░▀█ █ ░█░

def LaunchGame(gamepath: str) -> None:
    Log("")
    Log("Running Game...")

    # LAUNCH OPTIONS: -applaunch 620 -novid -allowspectators -nosixense +map mp_coop_lobby_3 +developer 918612 -conclearlog -condebug -console -usercon
    try:
        if (GVars.iow): #launching for windows
            # start portal 2 with the launch options and dont wait for it to finish
            def RunGame() -> None:
                # start portal 2 with the launch options and dont wait for it to finish
                subprocess.run([gamepath + GVars.nf + "portal2.exe", "-novid", "-allowspectators", "-nosixense", "+developer 918612", "+clear", "-conclearlog", "-usercon", GVars.configData["CustomLaunchOptions"]["value"]])
                Log("Game exited successfully.")
                # Run The AfterFunction
                GVars.AfterFunction()
            # start the game in a new thread
            thread = threading.Thread(target=RunGame)
            thread.start()
        elif (GVars.iol): #launching for linux
            def RunGame():
                def RunSteam():
                    os.system("steam -applaunch 620 -novid -allowspectators -nosixense +developer 918612 +clear -conclearlog -usercon " + GVars.configData["CustomLaunchOptions"]["value"])
                threading.Thread(target=RunSteam).start()

                def CheckForGame() -> None:
                    shouldcheck = True
                    lached = False
                    while shouldcheck:
                        gamerunning = str(os.system("pidof portal2_linux"))
                        if gamerunning == "256":
                            if lached == True:
                                GVars.AfterFunction()
                                shouldcheck = False
                        elif not lached:
                            lached = True
                        time.sleep(1)
                CheckForGame()
            thread = threading.Thread(target=RunGame)
            thread.start()


    except Exception as e:
        Log("Failed to launch Portal 2!")
        Log("Error: " + str(e))
        quit()