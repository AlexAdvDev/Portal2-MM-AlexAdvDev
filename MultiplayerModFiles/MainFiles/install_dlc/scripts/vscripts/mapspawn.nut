//-----------------------------------
//             COPYRIGHT
//2021 Portal 2: Multiplayer Mod Team
//     under a GNU GPLv3 license
//-----------------------------------

ConsoleAscii <- [
"██████╗░░█████╗░██████╗░████████╗░█████╗░██╗░░░░░  ██████╗░"
"██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║░░░░░  ╚════██╗"
"██████╔╝██║░░██║██████╔╝░░░██║░░░███████║██║░░░░░  ░░███╔═╝"
"██╔═══╝░██║░░██║██╔══██╗░░░██║░░░██╔══██║██║░░░░░  ██╔══╝░░"
"██║░░░░░╚█████╔╝██║░░██║░░░██║░░░██║░░██║███████╗  ███████╗"
"╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ╚══════╝"
""
"██████╗░██████╗░██████╗░██╗░░░░░░█████╗░██╗░░░██╗███████╗██████╗░"
"╚════██╗╚════██╗██╔══██╗██║░░░░░██╔══██╗╚██╗░██╔╝██╔════╝██╔══██╗"
"░█████╔╝░░███╔═╝██████╔╝██║░░░░░███████║░╚████╔╝░█████╗░░██████╔╝"
"░╚═══██╗██╔══╝░░██╔═══╝░██║░░░░░██╔══██║░░╚██╔╝░░██╔══╝░░██╔══██╗"
"██████╔╝███████╗██║░░░░░███████╗██║░░██║░░░██║░░░███████╗██║░░██║"
"╚═════╝░╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝"
""
"███╗░░░███╗░█████╗░██████╗░"
"████╗░████║██╔══██╗██╔══██╗"
"██╔████╔██║██║░░██║██║░░██║"
"██║╚██╔╝██║██║░░██║██║░░██║"
"██║░╚═╝░██║╚█████╔╝██████╔╝"
]

foreach (line in ConsoleAscii) {
    printl(line)
}



//  ____               __             ___           ___       __         __       ___
// /\  _`\            /\ \__         /\_ \        /'___`\    /\ \      /'__`\   /'___`\
// \ \ \L\ \___   _ __\ \ ,_\    __  \//\ \      /\_\ /\ \   \ \ \    /\_\L\ \ /\_\ /\ \
//  \ \ ,__/ __`\/\`'__\ \ \/  /'__`\  \ \ \     \/_/// /__   \ \ \   \/_/_\_<_\/_/// /__
//   \ \ \/\ \L\ \ \ \/ \ \ \_/\ \L\.\_ \_\ \_      // /_\ \   \ \ \    /\ \L\ \  // /_\ \
//    \ \_\ \____/\ \_\  \ \__\ \__/.\_\/\____\    /\______/    \ \ \   \ \____/ /\______/
//     \/_/\/___/  \/_/   \/__/\/__/\/_/\/____/    \/_____/      \ \ \   \/___/  \/_____/
//                                                                \ \_\
//                                                                 \/_/

//  ██████  ██████  ███    ██ ███████ ██  ██████
// ██      ██    ██ ████   ██ ██      ██ ██
// ██      ██    ██ ██ ██  ██ █████   ██ ██   ███
// ██      ██    ██ ██  ██ ██ ██      ██ ██    ██
//  ██████  ██████  ██   ████ ██      ██  ██████

//-----------------------------------
DevMode <- true
//-----------------------------------
UsePlugin <- false
//-----------------------------------
DedicatedServer <- false
//-----------------------------------


//  ██████  ██████  ██████  ███████
// ██      ██    ██ ██   ██ ██
// ██      ██    ██ ██   ██ █████
// ██      ██    ██ ██   ██ ██
//  ██████  ██████  ██████  ███████



// █▀ █▀▀ ▀█▀ █░█ █▀█   █░█ ▄▀█ █▀█ █ █▄▄ █░░ █▀▀ █▀
// ▄█ ██▄ ░█░ █▄█ █▀▀   ▀▄▀ █▀█ █▀▄ █ █▄█ █▄▄ ██▄ ▄█

canclearcache <- false
DoneCacheing <- false
CachedModels <- []
IsInSpawnZone <- []
HasSpawned <- false
PlayerColorCached <- []
PlayerID <- 0
GBIsMultiplayer <- 0
cacheoriginalplayerposition <- 0
DoneWaiting <- false
IsSingleplayerMap <- false
LoadPlugin <- false
PluginLoaded <- false
if (UsePlugin==true) {
    PluginLoaded <- true
}

// add names to credits
MPMCoopCreditNames <- [
"",
"",
"",
"",
"Portal 2 Multiplayer Mod: Credits",
"",
"--------------------------",
"Multiplayer Mod: Team",
"--------------------------",
"kyleraykbs | Scripting + Team Lead",
"Vista | Reverse Engineering, Plugin Dev",
"Bumpy | Scripting + Script Theory",
"Wolƒe Strider Shoσter | Scripting",
"Enator18 | Python"
"Nanoman2525 | Mapping + Entity and Command Help",
"--------------------------",
"Multiplayer Mod: Contributers",
"--------------------------",
"Darnias | Jumpstarter Code",
"Mellow | stole all of Python"
"The Pineapple | Hamachi support",
"actu | Remote File Downloads",
"Blub/Vecc | Code Cleanup + Commenting",
"AngelPuzzle | Translations",
"SuperSpeed | spedrun da test",
"--------------------------",
"Multiplayer Mod: Beta Testers",
"--------------------------",
"sear",
"Trico_Everfire",
"Brawler",
"iambread",
"hulkstar",
"neck",
"soulfur",
"brawler",
"Sheuron",
"portalboy",
"charity",
"Souper Marilogi",
"fluffys",
"JDWMGB",
"ALIEN GOD",
"mono",
"mp_emerald",
"Funky Kong",
"MicrosoftWindows",
"dactam",
"wol",
"kitsune",
"--------------------------",
"Thank you all so so much!!!",
"--------------------------"
"",
"",
"--------------------------",
"Valve: Credits",
"--------------------------",
]

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █ █▄░█ █ ▀█▀
// █ █░▀█ █ ░█░

function init() {

    // Run singleplayer code
    if (GetMapName().slice(0, 7) != "mp_coop") {
        IsSingleplayerMap <- true
        SingleplayerSupport(true, false, false)
    }

    // Enable fast download
    SendToConsole("sv_downloadurl https://github.com/kyleraykbs/gilbert/raw/main/portal2")
    SendToConsole("sv_allowdownload 1")
    SendToConsole("sv_allowupload 1")

    // Create an on screen text message entity
    onscreendisplay <- Entities.CreateByClassname("game_text")
    onscreendisplay.__KeyValueFromString("targetname", "onscreendisplaympmod")
    onscreendisplay.__KeyValueFromString("message", "Waiting For Players...")
    onscreendisplay.__KeyValueFromString("holdtime", "0.2")
    onscreendisplay.__KeyValueFromString("fadeout", "0.2")
    onscreendisplay.__KeyValueFromString("fadein", "0.2")
    onscreendisplay.__KeyValueFromString("spawnflags", "1")
    onscreendisplay.__KeyValueFromString("color", "60 200 60")
    onscreendisplay.__KeyValueFromString("channel", "1")
    //onscreendisplay.__KeyValueFromString("x", "-1.1")
    //onscreendisplay.__KeyValueFromString("y", "-1.1")

    // Create a join message entity
    joinmessagedisplay <- Entities.CreateByClassname("game_text")
    joinmessagedisplay.__KeyValueFromString("targetname", "joinmessagedisplaympmod")
    joinmessagedisplay.__KeyValueFromString("holdtime", "3")
    joinmessagedisplay.__KeyValueFromString("fadeout", "0.2")
    joinmessagedisplay.__KeyValueFromString("fadein", "0.2")
    joinmessagedisplay.__KeyValueFromString("spawnflags", "1")
    joinmessagedisplay.__KeyValueFromString("color", "255 200 0")
    joinmessagedisplay.__KeyValueFromString("channel", "3")
    //joinmessagedisplay.__KeyValueFromString("x", "0.1")
    //joinmessagedisplay.__KeyValueFromString("y", "0.1")

    // Create entity to run loop() every 0.1 seconds
    timer <- Entities.CreateByClassname("logic_timer")
    timer.__KeyValueFromString("targetname", "timer")
    EntFireByHandle(timer, "AddOutput", "RefireTime 0.1", 0, null, null)
    EntFireByHandle(timer, "AddOutput", "classname move_rope", 0, null, null)
    EntFireByHandle(timer, "AddOutput", "OnTimer worldspawn:RunScriptCode:loop():0:-1", 0, null, null)
    EntFireByHandle(timer, "Enable", "", 0.1, null, null)

    // Create an entity that sends a client command
    clientcommand <- Entities.CreateByClassname("point_clientcommand")

    // load plugin
    if("getPlayerName" in this) {
        printl("=================================")
        printl("Plugin Already Loaded Skipping...")
        printl("=================================")
    } else {
        printl("============================")
        printl("Plugin Not Loaded Loading...")
        printl("============================")
        pluginloadcommand <- Entities.CreateByClassname("point_servercommand")
        // SendToConsole("plugin_load pl")
        LoadPlugin <- true
        PluginLoaded <- false
    }

    // Run instant map code
    AllMapsCode(false, false, false, true)
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

//Teleport players within a distance
function TeleportPlayerWithinDistance(SearchPos, SearchDis, TeleportDest) {
    local ent = null
    while(ent = Entities.FindByClassnameWithin(ent, "player", SearchPos, SearchDis)) {
        ent.SetOrigin(TeleportDest)
    }
}

function PlayerWithinDistance(SearchPos, SearchDis) {
    local ent = null
    while(ent = Entities.FindByClassnameWithin(ent, "player", SearchPos, SearchDis)) {
        return ent
    }
}

function DeleteModels(ModelName) {
    local ent = null

}

function CacheModel(ModelName) {
    if (Entities.FindByModel(null, "models/"+ModelName)) {
            printl("Model " + ModelName + " is already cached!")
        } else {
        try {
            if (servercommand) {
                printl("servercommand exists")
            }
        } catch(exception) {
            // Create an entity that sends a server command
            servercommand <- Entities.CreateByClassname("point_servercommand")
        }
        EntFireByHandle(servercommand, "command", "hud_saytext_time 0", 0, null, null)
        EntFireByHandle(servercommand, "command", "sv_cheats 1", 0, null, null)
        EntFireByHandle(servercommand, "command", "prop_dynamic_create " + ModelName, 0, null, null)
        EntFireByHandle(servercommand, "command", "sv_cheats 0", 0, null, null)
        CachedModels.push("models/"+ModelName)

        printl("Model " + ModelName + " has been cached sucessfully!")
    }
}

//-----------------------------------
// Multiplayer support code
//-----------------------------------

// Set GBIsMultiplayer if game is multiplayer
try {
    if (::IsMultiplayer()) {
        GBIsMultiplayer <- 1
    }
} catch(exception) {
    GBIsMultiplayer <- 0
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------//
// ░█▀▄▀█ ─█▀▀█ ▀█▀ ░█▄─░█    ░█─── ░█▀▀▀█ ░█▀▀▀█ ░█▀▀█ //
// ░█░█░█ ░█▄▄█ ░█─ ░█░█░█    ░█─── ░█──░█ ░█──░█ ░█▄▄█ //
// ░█──░█ ░█─░█ ▄█▄ ░█──▀█    ░█▄▄█ ░█▄▄▄█ ░█▄▄▄█ ░█─── //
//------------------------------------------------------//

    function loop() {

        // Run player join code when a player joins
        local p = null
        while (p = Entities.FindByClassname(p, "player")) {
            if (p.ValidateScriptScope()) {
                local script_scope = p.GetScriptScope()
                // If player hasn't joined yet / hasn't been spawned / colored yet
                if (!("Colored" in script_scope)) {
                    // Run player join code
                    OnPlayerJoin(p, script_scope)
                }
            }
        }

        AllMapsCode(true, false, false, false) // Run map loops

        CreatePropsForLevel(false, false, true) // Create the gmod generated props in the level

        // Cache original spawn position
            if (cacheoriginalplayerposition == 0 && Entities.FindByClassname(null, "player")) {
                // OldPlayerPos = the blues inital spawn position
                OldPlayerPos <- Entities.FindByName(null, "blue").GetOrigin()
                cacheoriginalplayerposition <- 1
            }

        // Display waiting for players until player exits spawn zone
        try {
            if (DoneWaiting == false) {
                // Check if client is in spawn zone
                if (Entities.FindByNameWithin(null, "blue", OldPlayerPos, 35)) {
                    DoEntFire("onscreendisplaympmod", "display", "", 0.0, null, null)
                } else {
                    DoneWaiting <- true
                    GeneralOneTime()
                }
            }
        } catch(exception) {}

        // Delete all cached models
        if (DoneCacheing==true) {
            // If model has cached successfully delete it from the level
            foreach (index, CustomGameModel in CachedModels)  {
                // Find all entities with the model name
                local ent = null
                while (ent = Entities.FindByModel(ent, CustomGameModel)) {
                    try {
                        // If it's a prop_dynamic_create entity delete it
                    if (ent.GetName().slice(0, 17)!="genericcustomprop") {
                        ent.Destroy()
                    }
                    } catch(exception) {
                        ent.Destroy()
                    }
                }
            }
        }
        if (canclearcache==true) {
            foreach (index, CustomGameModel in CachedModels)  {
                CachedModels.remove(index)
            }
        }

        try {
        // Detect death
        if (HasSpawned==true) {
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                if (!Entities.FindByNameWithin(null, p.GetName(), OldPlayerPos, 45) && !Entities.FindByNameWithin(null, p.GetName(), OrangeOldPlayerPos, 45))  {
                    foreach (index, item in IsInSpawnZone)  {
                        if (item == p.GetRootMoveParent().entindex().tostring())  {
                            IsInSpawnZone.remove(index)
                        }
                    }
                }

            ContinueDeathCode <- true
            foreach (Name in IsInSpawnZone) {
                if (Name==p.GetRootMoveParent().entindex().tostring()) {
                    ContinueDeathCode <- false
                }
            }

            if (ContinueDeathCode==true) {
                if (Entities.FindByNameWithin(null, p.GetName(), OldPlayerPos, 45) || Entities.FindByNameWithin(null, p.GetName(), OrangeOldPlayerPos, 45)) {
                    // ON DEATH
                    if(PluginLoaded==true) {
                        printl("Player " + getPlayerName(p.entindex()-1) + " Has Respawned")
                    }
                    // Show player color again
                    foreach (index, item in PlayerColorCached)  {
                        if (item == p.GetRootMoveParent().entindex().tostring())  {
                            PlayerColorCached.remove(index)
                        }
                    }
                    // END OF ON DEATH
                    IsInSpawnZone.push(p.GetRootMoveParent().entindex().tostring())
                    }
                }
            }
        }

        // Display the current player color in the bottom right of their screen upon spawning
        if (HasSpawned==true) {
            // Find all players
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                // Check if client had the message put on there screen
                CanTag <- true
                // Check if client's color is cached
                foreach (Name in PlayerColorCached) {
                    if (Name==p.GetRootMoveParent().entindex().tostring()) {
                        CanTag <- false
                    }
                }
                // Show player color
                currentnametag <- p.GetRootMoveParent().entindex().tostring()
                if (CanTag==true) {
                        RGB <- "255 255 255"; COLORMESSAGE <- "Random Color";
                        switch (p.GetRootMoveParent().entindex()) {
                            // These are the colors of the players
                            case 1 : RGB <- "255 255 255"; COLORMESSAGE <- "White"     ; break;
                            case 2 : RGB <- "120 255 120"; COLORMESSAGE <- "Green"     ; break;
                            case 3 : RGB <- "120 140 255"; COLORMESSAGE <- "Blue"      ; break;
                            case 4 : RGB <- "255 170 120"; COLORMESSAGE <- "Orange"    ; break;
                            case 5 : RGB <- "255 100 100"; COLORMESSAGE <- "Red"       ; break;
                            case 6 : RGB <- "255 110 255"; COLORMESSAGE <- "Pink"      ; break;
                            case 7 : RGB <- "255 255 180"; COLORMESSAGE <- "Yellow"    ; break;
                            case 8 : RGB <- "0 255 240"  ; COLORMESSAGE <- "Aqua"      ; break;
                            case 9 : RGB <- "75 75 75"   ; COLORMESSAGE <- "Black"     ; break;
                            case 10: RGB <- "100 80 0"   ; COLORMESSAGE <- "Brown"     ; break;
                            case 11: RGB <- "0 80 100"   ; COLORMESSAGE <- "Dark Cyan" ; break;
                            case 12: RGB <- "120 155 25" ; COLORMESSAGE <- "Dark Lime" ; break;
                            case 13: RGB <- "0 0 100"    ; COLORMESSAGE <- "Dark Blue" ; break;
                            case 14: RGB <- "80 0 0"     ; COLORMESSAGE <- "Dark Red"  ; break;
                            case 15: RGB <- "0 75 0"     ; COLORMESSAGE <- "Dark Green"; break;
                            case 16: RGB <- "0 75 75"    ; COLORMESSAGE <- "Dark Aqua" ; break;
                        }
                        try {
                        Entities.FindByName(null, "colordisplay" + currentnametag).__KeyValueFromString("message", "Player Color: " + COLORMESSAGE)
                        Entities.FindByName(null, "colordisplay" + currentnametag).__KeyValueFromString("color", RGB)
                        } catch(exception) {

                        }
                        // Cache player color
                        EntFireByHandle(Entities.FindByName(null, "colordisplay" + currentnametag), "display", "", 0.0, p, p)
                        PlayerColorCached.push(currentnametag);
                }
            }
        }
        } catch(exception) {
            // If there is an error set the players position to the original position
            printl("Death Detection Screwed Up (Player Probably Crashed) (Setting OrangeOldPlayerPos To BlueOldPlayerPos To Remedy The Issue)")
            OrangeOldPlayerPos <- OldPlayerPos
        }

        // Disconnect player if trying to play singleplayer
        if (GBIsMultiplayer==0) {
            SendToConsole("disconnect \"You cannot play singleplayer when Portal 2 is launched from the Multiplayer Mod Launcher. Please restart the game from Steam\"")
        }

        // Singleplayer loop
        if (GetMapName().slice(0, 7) != "mp_coop") {
            SingleplayerSupport(false, true, false)
        }

        // Make every clients' collision more elastic
        //local j = "solid "
        local k = "CollisionGroup "

        //EntFire("player", "addoutput", j + 4)
        EntFire("player", "addoutput", k + 2)

        if (DevMode==true) {

        }
    }

//---------------------------------------------------------------//
// ░█▀▀▀ ░█▄─░█ ░█▀▀▄   ░█▀▀▀█ ░█▀▀▀   ░█─── ░█▀▀▀█ ░█▀▀▀█ ░█▀▀█ //
// ░█▀▀▀ ░█░█░█ ░█─░█   ░█──░█ ░█▀▀▀   ░█─── ░█──░█ ░█──░█ ░█▄▄█ //
// ░█▄▄▄ ░█──▀█ ░█▄▄▀   ░█▄▄▄█ ░█───   ░█▄▄█ ░█▄▄▄█ ░█▄▄▄█ ░█─── //
//---------------------------------------------------------------//

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █░█ █▀█ █▀█ █▄▀   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// █▀█ █▄█ █▄█ █░█   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

//////////////////////////////
// Runs When A Player Joins //
//////////////////////////////

function OnPlayerJoin(p, script_scope) {
// Get player's index and store it
PlayerID <- p.GetRootMoveParent()
PlayerID <- PlayerID.entindex()

// Set viewmodel targetnames so we can tell them apart
local ent = null
while (ent=Entities.FindByClassname(ent, "predicted_viewmodel")) {
    EntFireByHandle(ent, "addoutput", "targetname viewmodel_player" + ent.GetRootMoveParent().entindex(), 0, null, null)
    printl("renamed predicted_viewmodel to viewmodel_player" + ent.GetRootMoveParent().entindex())
    // printl("" + ent.GetRootMoveParent().entindex() + " rotation " + ent.GetAngles())
    // printl("" + ent.GetRootMoveParent().entindex() + "    origin " + ent.GetOrigin())
}

// load plugin
if (UsePlugin==true) {
    if (LoadPlugin==true) {
        printl("Loading Plugin... Restarting Map")
        // load plugin
        EntFireByHandle(pluginloadcommand, "Command", "plugin_load pl", 0, null, null)
        // Wait for plugin to load and then restart map
        EntFireByHandle(pluginloadcommand, "Command", "changelevel mp_coop_lobby_3", 0, null, null)
        LoadPlugin <- false
    }
}

// Set some cvars on every client
SendToConsole("sv_timeout 3")
SendToConsole("gameinstructor_enable 1")
EntFireByHandle(clientcommand, "Command", "gameinstructor_enable 1", 0, p, p)
EntFireByHandle(clientcommand, "Command", "bind tab +score", 0, p, p)
EntFireByHandle(clientcommand, "Command", "stopvideos", 0, p, p)
EntFireByHandle(clientcommand, "Command", "r_portal_fastpath 0", 0, p, p)
EntFireByHandle(clientcommand, "Command", "r_portal_use_pvs_optimization 0", 0, p, p)

// Say join message on HUD
if (PluginLoaded==true) {
    JoinMessage <- getPlayerName(PlayerID-1) + " Joined The Game"
} else {
    JoinMessage <- "Player " + PlayerID + " Joined The Game"
}
// Set join message to player name
JoinMessage = JoinMessage.tostring()
joinmessagedisplay.__KeyValueFromString("message", JoinMessage)
EntFireByHandle(joinmessagedisplay, "display", "", 0.0, null, null)
if (PlayerID >= 2) {
    onscreendisplay.__KeyValueFromString("y", "0.075")
}
// Assign every client a targetname keyvalue
if (PlayerID >= 3) {

    p.__KeyValueFromString("targetname", "player" + PlayerID)
}

// Set a random color for clients that join after 16 have joined
if (PlayerID != 1) {
    R <- RandomInt(0, 255), G <- RandomInt(0, 255), B <- RandomInt(0, 255)
}

// Create an entity to display player color at the bottom left of every clients' screen
colordisplay <- Entities.CreateByClassname("game_text")
    // Set the entity's targetname to colordisplay + player's index
colordisplay.__KeyValueFromString("targetname", "colordisplay" + PlayerID)
    // Set the entity's origin to the bottom left of the screen
colordisplay.__KeyValueFromString("x", "0")
colordisplay.__KeyValueFromString("y", "1")
    // Set the entity's holdtime to infinity
colordisplay.__KeyValueFromString("holdtime", "100000")
    // Set the fade time to none
colordisplay.__KeyValueFromString("fadeout", "0")
colordisplay.__KeyValueFromString("fadein", "0")
    // Set the channel to top
colordisplay.__KeyValueFromString("channel", "0")

// Set preset colors for up to 16 clients
switch (PlayerID) {
    case 1 : R <- 255; G <- 255; B <- 255; break;
    case 2 : R <- 180, G <- 255, B <- 180; break;
    case 3 : R <- 120, G <- 140, B <- 255; break;
    case 4 : R <- 255, G <- 170, B <- 120; break;
    case 5 : R <- 255, G <- 100, B <- 100; break;
    case 6 : R <- 255, G <- 180, B <- 255; break;
    case 7 : R <- 255, G <- 255, B <- 180; break;
    case 8 : R <-   0, G <- 255, B <- 240; break;
    case 9 : R <-  75, G <-  75, B <-  75; break;
    case 10: R <- 100, G <-  80, B <-   0; break;
    case 11: R <-   0, G <-  80, B <- 100; break;
    case 12: R <- 120, G <- 155, B <-  25; break;
    case 13: R <-   0, G <-   0, B <- 100; break;
    case 14: R <-  80, G <-   0, B <-   0; break;
    case 15: R <-   0, G <-  75, B <-   0; break;
    case 16: R <-   0, G <-  75, B <-  75; break;
}

// Set color of player's in-game model
script_scope.Colored <- true
EntFireByHandle(p, "Color", (R + " " + G + " " + B), 0, null, null)

// Run general map code after a player loads into the game
if (PlayerID==1) {
    AllMapsCode(false, false, true, false)
}

return
}

////////////////////////////////////
// Runs once on fist global spawn //
////////////////////////////////////

function GeneralOneTime() {

    canclearcache <- true

    HasSpawned <- true

    SendToConsole("hud_saytext_time 12")

    // Inform user that we changed hud_saytext_time to 12
    SendToConsole("echo Changed Hud Saytext Time For Now")

    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        if (p.GetTeam()==2) {
            OrangeOldPlayerPos <- p.GetOrigin()
        }
    }

    try {
        if (OrangeOldPlayerPos) { }
    } catch(exeption) {
        printl("OrangeOldPlayerPos Not Set (Blue Probably Moved Before Orange Could Load in) Setting OrangeOldPlayerPos To BlueOldPlayerPos")
        OrangeOldPlayerPos <- OldPlayerPos
    }

    // Create props after cache
    CreatePropsForLevel(false, true, false)

    AllMapsCode(false, true, false, false)

    SingleplayerSupport(false, false, true)
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █▀▄▀█ ▄▀█ █▀█   █▀ █░█ █▀█ █▀█ █▀█ █▀█ ▀█▀
// █░▀░█ █▀█ █▀▀   ▄█ █▄█ █▀▀ █▀▀ █▄█ █▀▄ ░█░

// Run all required map code
function AllMapsCode(AMCLoop, AMCOneTimeRun, AMCPostInit, AMCInstantRun) {


    /////////////////
    // INSTANT RUN //
    /////////////////


    if (AMCInstantRun == true) {
        //## GELOCITY 1 INSTANT RUN ##//
        try {
            if (GetMapName().slice(28, 50) == "mp_coop_gelocity_1_v02") {
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "red_dropper-door_eixt"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "blue_dropper-item_door"))

                local ent = null
                while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                    ent.Destroy() // 20 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "beam_spotlight")) {
                    ent.Destroy() // 85 entities removed
                }
            }
        } catch(exeption) { }

        //## GELOCITY 2 INSTANT RUN##//
        try {
            if (GetMapName().slice(28, 50) == "mp_coop_gelocity_2_v01") {
                // set the gelocity 2 map
                local ent = null
                while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                    ent.Destroy() // 20 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "beam_spotlight")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "env_glow")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "light_spot")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "keyframe_rope")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "move_rope")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "info_overlay")) {
                    ent.Destroy() // 85 entities removed
                }
            }
        } catch(exeption) { }

        //## GELOCITY 3 INSTANT RUN ##//
        try {
            if (GetMapName().slice(28, 50) == "mp_coop_gelocity_3_v02") {
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "red_dropper-door_eixt"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "blue_dropper-item_door"))


                local ent = null
                while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                    ent.Destroy() // 20 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "beam_spotlight")) {
                    ent.Destroy() // 85 entities removed
                }
            }
         } catch(exeption) { }

        //## MP_COOP_CREDITS INSTANT RUN ##//
        if (GetMapName() == "mp_coop_credits") {
            // Remove selected pods
            function CreditsRemovePod() {
                try {
                    local ent = null
                    while (ent = Entities.FindByNameNearest("chamber*", Vector(-64, 217, 72), 100)) {
                        ent.Destroy()
                    }
                } catch(exeption) { }

                try {
                    while (ent = Entities.FindByNameNearest("bubbles*", Vector(-64, 217, 72), 100)) {
                        ent.Destroy()
                    }
                } catch(exeption) { }
            }
        }

        // Fix void camera glitch
        function FixCreditsCameras() {
            // Disable useless cameras
            EntFireByHandle(Entities.FindByName(null, "camera_SP"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera_O"), "disable", "", 0, null, null)

            // Reload main camera with new params
            Entities.FindByName(null, "camera").__KeyValueFromString("target_team", "-1")
            EntFireByHandle(Entities.FindByName(null, "camera"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera"), "enable", "", 0, null, null)
        }

        // Replace females with P-body's
        function CreditsSetModelPB(ent) {
            FixCreditsCameras()

            // Count how many credits come on screen to change to humans
            MPMCredits <- MPMCredits + 1

            // Preset animation
            local RandomAnimation = RandomInt(0, CRAnimationTypesPB)

            // Remove pod if needed
            HasRemovedPod <- 0
            foreach (anim in NOTubeAnimsPB) {
                if (AnimationsPB[RandomAnimation] == anim && HasRemovedPod == 0) {
                    HasRemovedPod <- 1
                    CreditsRemovePod()
                }
            }

            // Set model
            ent.SetModel("models/player/eggbot/eggbot.mdl")

            // Set color
            EntFireByHandle(ent, "Color", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)), 0, null, null)

            // Set position
            ent.SetOrigin(Vector(0, 0, 7.5))

            // Set animation
            EntFireByHandle(ent, "setanimation", AnimationsPB[RandomAnimation], 0, null, null)
        }

        // Replace males with Atlas's
        function CreditsSetModelAL(ent) {
            FixCreditsCameras()

            // Count how many credits come on screen to change to humans
            MPMCredits <- MPMCredits + 1

            // Preset animation
            local RandomAnimation = RandomInt(0, CRAnimationTypesAL)

            // Set model
            ent.SetModel("models/player/ballbot/ballbot.mdl")

            // Set color
            EntFireByHandle(ent, "Color", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)), 0, null, null)

            // Set position
            ent.SetOrigin(Vector(-10, 0, 25.5))

            // Set animation
            EntFireByHandle(ent, "setanimation", AnimationsAL[RandomAnimation], 0, null, null)

            // Remove pod if needed
            HasRemovedPod <- 0
            foreach (anim in NOTubeAnimsAL) {
                if (AnimationsAL[RandomAnimation] == anim && HasRemovedPod == 0) {
                    HasRemovedPod <- 1
                    CreditsRemovePod()
                    ent.SetOrigin(Vector(0, 0, 7.5))
                }
            }
        }

        // Set credits animations
            // Pbody animations
            AnimationsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "noGun_airwalk", "noGun_airwalk", "portalgun_drowning", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]

            // Atlas animations
            AnimationsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "portalgun_jump_spring", "portalgun_thrash_fall", "noGun_crouch_idle", "noGun_airwalk", "noGun_airwalk"]

            // Pbody animations out of tube
            NOTubeAnimsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]

            // Atlas animations out of tube
            NOTubeAnimsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "noGun_crouch_idle"]

            // Credit run counter
            MPMCredits <- 0

            // Set the amount of pbody animations
            CRAnimationTypesPB <- -1
            foreach (value in AnimationsPB) {
                CRAnimationTypesPB <- CRAnimationTypesPB + 1
            }

            // Set the amount of atlas animations
            CRAnimationTypesAL <- -1
            foreach (value in AnimationsAL) {
                CRAnimationTypesAL <- CRAnimationTypesAL + 1
            }

            // Set the amount of credits
            MPModCreditNumber <- -1
            foreach (value in MPMCoopCreditNames) {
                MPModCreditNumber <- MPModCreditNumber + 1
            }

            // Mount list of credits to credits
            foreach (Name in MPMCoopCreditNames) {
                AddCoopCreditsName(Name)
            }

        //## MP_COOP_PAINT_CONVERSION INSTANT RUN ##//
        if (GetMapName() == "mp_coop_paint_conversion") {
            Entities.FindByName(null, "disassembler_1_door_blocker").Destroy()
            Entities.FindByName(null, "disassembler_2_door_blocker").Destroy()

            Entities.FindByName(null, "disassembler_1_door_2").Destroy()
            Entities.FindByName(null, "disassembler_1_door_1").Destroy()

            Entities.FindByName(null, "disassembler_2_door_2").Destroy()
            Entities.FindByName(null, "disassembler_2_door_1").Destroy()
        }

        //## MP_COOP_TRIPLEAXIS INSTANT RUN ##//
        if (GetMapName() == "mp_coop_tripleaxis") {
            Entities.FindByName(null, "outro_math_counter").Destroy()
        }

        //## MP_COOP_SEPARATION_1 INSTANT RUN ##//
        if (GetMapName() == "mp_coop_separation_1") {
            EntFireByHandle(Entities.FindByName(null, "left_1st_room_spawn-initial_blue_spawn"), "SetAsActiveSpawn", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "right_1st_room_spawn-initial_orange_spawn"), "SetAsActiveSpawn", "", 0, null, null)
            Entities.FindByName(null, "split_counter").Destroy()
        }
    }


    ///////////
    // LOOPS //
    ///////////


    if(AMCLoop == true) {
        if (GetMapName() == "mp_coop_lobby_3") {
            local PLent = null
            while(PLent = Entities.FindByClassnameWithin(PLent, "player", Vector(2367, -8126, -54), 30)) {
                local APLent = null
                while(APLent = Entities.FindByClassname(APLent, "player")) {
                    APLent.SetOrigin(Vector(2495, -7451, 410))
                }
            }

            // Art therapy left chute enabler
            local vectorEEL
            vectorEEL = Vector(5727, 3336, -441)
            local EELent = null
            while(EELent = Entities.FindByClassnameWithin(EELent, "player", vectorEEL, 12)) {
                local LCatEn = null
                while(LCatEn = Entities.FindByName(LCatEn, "left-enable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, LCatEn)
                    DoEntFire("!self", "trigger", "", 0.0, null, LCatEn)
                }
            }

            // Art therapy left chute teleporter
            TeleportPlayerWithinDistance(Vector(5729, 3336, 1005), 30, Vector(3194, -1069, 1676))

            // Art therapy right chute enabler
            local vectorEER
            vectorEER = Vector(5727, 3192, -441)
            local EERent = null
            while(EERent = Entities.FindByClassnameWithin(EERent, "player", vectorEER, 12)) {
                local RCatEn = null
                while(RCatEn = Entities.FindByName(RCatEn, "right-enable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, RCatEn)
                    DoEntFire("!self", "trigger", "", 0.0, null, RCatEn)
                }
            }

            // Art therapy right chute teleporter
            TeleportPlayerWithinDistance(Vector(5727, 3180, 1005), 30, Vector(3191, -1228, 1682))

            // Disable art therapy chutes
            local vectorE
            vectorE = Vector(3201, -1152, 1272)
            local Aent = null
            while(Aent = Entities.FindByClassnameWithin(Aent, "player", vectorE, 150)) {
                local LCatDis = null
                while(LCatDis = Entities.FindByName(LCatDis, "left-disable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, LCatDis)
                    DoEntFire("!self", "trigger", "", 0.0, null, LCatDis)
                }
                local RCatDis = null
                while(RCatDis = Entities.FindByName(RCatDis, "right-disable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, RCatDis)
                    DoEntFire("!self", "trigger", "", 0.0, null, RCatDis)
                }
            }

            // Teleport exiting player out of art therapy
            TeleportPlayerWithinDistance(Vector(3584, -1669, 466), 30, Vector(3919, 3352, 158))
        }

    //## MP_COOP_CREDITS LOOP ##//
        if (GetMapName() == "mp_coop_credits") {
            // If mod credits aren't finished change humans to robots
        if (MPMCredits <= MPModCreditNumber) {
            // Change males to Atlases
            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male.mdl")) {
                CreditsSetModelAL(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male01.mdl")) {
                CreditsSetModelAL(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male_02.mdl")) {
                CreditsSetModelAL(ent)
            }

            // Change females to Pbodys
            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_01.mdl")) {
                CreditsSetModelPB(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_02.mdl")) {
                CreditsSetModelPB(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_03.mdl")) {
                CreditsSetModelPB(ent)
            }
        }
        }

        //## MP_COOP_WALL_5 ##//
        if (GetMapName() == "mp_coop_wall_5") {
            TeleportPlayerWithinDistance(Vector(1224, -1984, 565), 100, Vector(1208, -1989, 315))
            // Open areaportal
            EntFire("portal_close_second_puzzle", "open", "", 0, null)
        }

        //## MP_COOP_2PAINTS_1BRIDGE ##//
        if (GetMapName() == "mp_coop_2paints_1bridge") {
            EntFireByHandle(Entities.FindByName(null, "bridge_2"), "enable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "bridge_1"), "enable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "paint_sprayer_blue_1"), "start", "", 0, null, null)
        }
    }


    //////////////////
    // ONE TIME RUN //
    //////////////////


    if (AMCOneTimeRun == true) {

        //## GENERAL ONE TIME RUN ##//
        local DoorEntities = [
            "airlock_1-door1-airlock_entry_door_close_rl",
            "airlock_2-door1-airlock_entry_door_close_rl",
            "last_airlock-door1-airlock_entry_door_close_rl",
            "airlock_1-door1-door_close",
            "airlock1-door1-door_close",
            "camera_door_3-relay_doorclose",
            "entry_airlock-door1-airlock_entry_door_close_rl",
            "door1-airlock_entry_door_close_rl",
            "airlock-door1-airlock_entry_door_close_rl",
            "orange_door_1-ramp_close_start",
            "blue_door_1-ramp_close_start",
            "orange_door_1-airlock_player_block",
            "blue_door_1-airlock_player_block",
            "airlock_3-door1-airlock_entry_door_close_rl",  //mp_coop_sx_bounce (Sixense map)
        ]

        foreach (DoorType in DoorEntities) {
            try {
                Entities.FindByName(null, DoorType).Destroy()
            } catch(exception) {
            }
        }

        //## MP_COOP_SEPARATION_1 ##//
        if (GetMapName() == "mp_coop_separation_1") {
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopMapStart()", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(1)", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(2)", 0, null, null)

            local ent = null
            while(ent = Entities.FindByName(ent, "split_exit_arms")) {
                EntFireByHandle(ent, "setanimation", "90up", 0, null, null)
            }

            local ent = null
            while(ent = Entities.FindByName(ent, "split_entrance_arms")) {
                EntFireByHandle(ent, "setanimation", "90down", 0, null, null)
            }

            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "func_areaportalwindow", OldPlayerPos, 5000)) {
                EntFireByHandle(ent, "SetFadeEndDistance", "10000", 0, null, null)
            }

            local loopTimes = 0
            while (loopTimes <= 0) {
                Entities.FindByName(null, "split_exit_fake_collision").Destroy()
                local loopTimes = loopTimes + 1
            }
        }

        //## MP_COOP_LOBBY_3 ONE TIME RUN ##//
        if (GetMapName() == "mp_coop_lobby_3") {
            // Enable the hub entirely
            try {
                // Enable team building course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_teambuilding"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_teambuilding"))

                // Enable tbeam course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_tbeam"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_tbeam"))

                // Enable paint course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_paint"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_paint"))

                // Enable fling course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_fling"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_fling"))

                // Enable extra course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_extra"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_extra"))

                // Enable all finished course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_all_finished"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_all_finished"))

                // Enable music
                DoEntFire("!self", "invalue", "7", 0.0, null, Entities.FindByName(null, "@music_lobby_7"))
                // Entities.FindByName(null, "brush_spawn_blocker_red").Destroy()
                // Entities.FindByName(null, "brush_spawn_blocker_blue").Destroy()
            } catch(exception) {}

            // Remove useless entities so that
            // the entity limit does not crash
            // the game

            // Remove func_portal_bumper's from the map
            local ent = null
            while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                ent.Destroy() // 165 entities removed
            }
            // Remove env_sprite's from the map
            local ent = null
            while(ent = Entities.FindByClassname(ent, "env_sprite")) {
                ent.Destroy() // 31 entities removed
            }

            // Fix art therapy tube glitches
            Entities.FindByName(null, "dlc_room_fall_push_right").Destroy()
            Entities.FindByName(null, "dlc_room_fall_push_left").Destroy()

            // Fix track 5
            // Entry door fix
            Entities.FindByName(null, "track5-door_paint-trigger_hurt_door").Destroy()
            Entities.FindByName(null, "track5-door_paint-collide_door").Destroy()

            // Light fix
            Entities.FindByName(null, "@light_shadowed_paintroom").Destroy()

            // Remove orange exit door
            local ent = null
            while(ent = Entities.FindByName(ent, "track5-orangeiris_door_elevator_pit")) {
                ent.Destroy()
            }

            Entities.FindByName(null, "track5-orangeescape_elevator_clip").Destroy()

            // Remove blue exit door
            local ent = null
            while(ent = Entities.FindByName(ent, "track5-iris_door_elevator_pit")) {
                ent.Destroy()
            }

            Entities.FindByName(null, "track5-escape_elevator_clip").Destroy()

            // Remove the bottom of droppers in Course 5
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                local ent = null
                while (ent = Entities.FindByClassnameWithin(ent, "prop_dynamic", OldPlayerPos, 500)) {
                    if (ent.GetModelName() == "models/props_underground/underground_boxdropper.mdl") {
                        EntFireByHandle(ent, "SetAnimation", "open_idle", 0.0, null, null)
                    }

                    if (ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                        EntFireByHandle(ent, "SetAnimation", "item_dropper_idle", 0.0, null, null)
                    }
                }
            }
        }

        //## MP_COOP_SEPARATION_1 ONETIME ##//
        if (GetMapName() == "mp_coop_separation_1") {
                EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopMapStart()", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(1)", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(2)", 0, null, null)

            local ent = null
            while(ent = Entities.FindByName(ent, "split_exit_arms")) {
                EntFireByHandle(ent, "setanimation", "90up", 0, null, null)
            }

            local ent = null
            while(ent = Entities.FindByName(ent, "split_entrance_arms")) {
                EntFireByHandle(ent, "setanimation", "90down", 0, null, null)
            }

            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "func_areaportalwindow", OldPlayerPos, 5000)) {
                EntFireByHandle(ent, "SetFadeEndDistance", "10000", 0, null, null)
            }

            local loopTimes = 0
            while (loopTimes <= 0) {
                Entities.FindByName(null, "split_exit_fake_collision").Destroy()
                local loopTimes = loopTimes + 1
            }
        }
    }

    ///////////////
    // Post Init //
    ///////////////
    if (AMCPostInit==true) {
        // Cache Props
        CreatePropsForLevel(true, false, false)
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █▀ █ █▄░█ █▀▀ █░░ █▀▀ █▀█ █░░ ▄▀█ █▄█ █▀▀ █▀█ 
// ▄█ █ █░▀█ █▄█ █▄▄ ██▄ █▀▀ █▄▄ █▀█ ░█░ ██▄ █▀▄ 

// █▀ █░█ █▀█ █▀█ █▀█ █▀█ ▀█▀
// ▄█ █▄█ █▀▀ █▀▀ █▄█ █▀▄ ░█░

//////////////////////////
//SINGLEPLAYER FUNCTIONS//
//////////////////////////

    function disablewheatleyplayerpickup() {
        printl("Player Picked Up Wheatley. Disabling Pickup!")
        EntFire("@sphere", "disablepickup", "", 0, null)
        EntFire("@sphereDummy", "enablepickup", "", 0, null)
    }
    function enablewheatleyplayerpickup() {
        printl("Player Picked Up Wheatley. Enabling Pickup!")
        EntFire("@sphere", "enablepickup", "", 0, null)
        EntFire("@sphereDummy", "enablepickup", "", 0, null)
    }

    function wheatleyhitground() {
        EntFire("@sphere", "disablepickup", "", 1.05, null)
        EntFire("@sphere", "enablepickup", "", 8, null)
        EntFire("spherebot_1_top_swivel_1", "deactivate", "", 1.01, null)
    }

    function SPSkipPanel() {
        printl("message")
        EntFire("InstanceAuto9-sphere_socket", "setanimation", "bindpose", 2.7, null)
        myexplode2 <- Entities.CreateByClassname("npc_personality_core")
        myexplode2.__KeyValueFromString("targetname", "myexplode2")
        myexplode2.SetOrigin(Vector(-822, -523, 1269))

        myexplode <- Entities.CreateByClassname("env_ar2explosion")
        myexplode.__KeyValueFromString("targetname", "myexplode")
        myexplode.__KeyValueFromString("material", "particle/particle_noisesphere")
        myexplode.SetOrigin(Vector(-822, -523, 1269))
        EntFire("myexplode", "explode", "", 2.5, null)
        EntFire("myexplode2", "explode", "", 2.5, null)
        EntFire("myexplode2", "explode", "", 3.0, null)

        Entities.FindByName(null, "@sphere").__KeyValueFromString("targetname", "@sphereDummy")
        local mysphere = Entities.FindByName(null, "@spheredummy")

        self.PrecacheSoundScript( "sphere03.sp_a2_wheatley_ows01" )
        self.PrecacheSoundScript( "sphere03.sp_a2_wheatley_ows02" )
        self.PrecacheSoundScript( "sphere03.sphere_flashlight_tour67" )
        self.PrecacheSoundScript( "sphere03.sp_a1_wakeup_hacking09" )
        self.PrecacheSoundScript( "sphere03.sp_a1_wakeup_hacking12" )
        self.PrecacheSoundScript( "sphere03.sp_a1_wakeup_hacking10" )
        self.PrecacheSoundScript( "sphere03.bw_finale4_hackworked01" )
        self.PrecacheSoundScript( "Portal.elevator_chime" )
        self.PrecacheSoundScript( "sphere03.GloriousFreedom03" )
        self.PrecacheSoundScript( "sphere03.bw_fire_lift03" )

        self.PrecacheSoundScript( "sphere03.sp_a1_intro7_hoboturret01" )
        self.PrecacheSoundScript( "sphere03.sp_a1_intro7_hoboturret08" )
        self.PrecacheSoundScript( "sphere03.sp_a1_intro7_hoboturret07" )
        self.PrecacheSoundScript( "sphere03.sp_a1_intro7_hoboturret05" )
        self.PrecacheSoundScript( "sphere03.sp_a1_intro7_hoboturret06" )

        EntFire("myexplode2", "addoutput", "targetname playline1", 2.65, null)
        EntFire("playline1", "addoutput", "targetname myexplode2", 2.76, null)

        EntFire("myexplode2", "addoutput", "targetname playline2", 6.55, null)
        EntFire("playline2", "addoutput", "targetname myexplode2", 6.66, null)

        EntFire("myexplode2", "addoutput", "targetname playline3", 12.75, null)
        EntFire("playline3", "addoutput", "targetname myexplode2", 12.86, null)

        EntFire("myexplode2", "addoutput", "targetname playline4", 16.75, null)
        EntFire("playline4", "addoutput", "targetname myexplode2", 16.86, null)

        EntFire("myexplode2", "addoutput", "targetname playline5", 18.00, null)
        EntFire("playline5", "addoutput", "targetname myexplode2", 18.11, null)

        EntFire("myexplode2", "addoutput", "targetname playline6", 24.00, null)
        EntFire("playline6", "addoutput", "targetname myexplode2", 24.11, null)

        EntFire("myexplode2", "addoutput", "targetname playline7", 25.50, null)
        EntFire("playline7", "addoutput", "targetname myexplode2", 25.61, null)

        EntFire("bts_panel_door-LR_heavydoor_open", "trigger", "", 25.50, null)

    }

// Run mapspawn.nut
try {
Entities.First().ConnectOutput("OnUser1", "init")
} catch(exception) {}
try {
DoEntFire("worldspawn", "FireUser1", "", 0.0, null, null)
} catch(exception) {}

/////////////////////////////////
//SINGLEPLAYER MAP SUPPORT CODE//
/////////////////////////////////

function SingleplayerSupport(SSInstantRun, SSLoop, SSOneTimeRun) {

    //## SP_A1_INTRO2 ##//
    if (GetMapName() == "sp_a1_intro2") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            SendToConsole("commentary 0")
            Entities.FindByName(null, "@entry_door-door_close_relay").Destroy()
            Entities.FindByName(null, "@exit_door-door_close_relay").Destroy()
            Entities.FindByName(null, "Fizzle_Trigger").Destroy()
        }

        if (SSLoop) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}

            local portalgun = null
            while ( portalgun = Entities.FindByClassname(portalgun, "weapon_portalgun")) {
                portalgun.Destroy()
            }

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-320, 1248, -656), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro3")
            }

            try {
                Entities.FindByName(null, "block_boxes").Destroy()
            } catch(exception) {}
        }
    }


    //## SP_A1_INTRO3 ##//
    if (GetMapName() == "sp_a1_intro3") {

        if (SSInstantRun == true) {
            Entities.FindByName(null, "door_0-door_close_relay").Destroy()
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "player_clips").Destroy()
            // Destroy pusher x4
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "door_3-door_close_relay").Destroy()
            Entities.FindByName(null, "portal_orange_2").Destroy()
            Entities.FindByName(null, "emitter_orange_2").Destroy()
            Entities.FindByName(null, "backtrack_brush").Destroy()
            Entities.FindByName(null, "portal_orange_mtg").Destroy()
            Entities.FindByName(null, "emitter_orange_mtg").Destroy()
        }

        if (SSLoop) {
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1344, 4304, -784), 45)) {
            SendToConsole("commentary 1")
            SendToConsole("changelevel sp_a1_intro4")
            }

            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}

            // Remove Portal Gun
            if (hasgotportalgunSPMP == 0) {
                local portalgun = null
                while (portalgun = Entities.FindByClassname(portalgun, "weapon_portalgun")) {
                    portalgun.Destroy()
                }
            }

            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A1_INTRO4 ##//
    if (GetMapName() == "sp_a1_intro4") {

        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-door_close_relay").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(464, 136, 72), 1024).Destroy()
            EntFireByHandle(Entities.FindByName(null, "glass_pane_intact_model"), "kill", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "glass_pane_fractured_model"), "enable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "glass_pane_1_door_1"), "open", "", 0, null, null)
            Entities.FindByName(null, "glass_pane_1_door_1_blocker").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(878, -528, 137), 1024).Destroy()
            Entities.FindByName(null, "glass_shard").Destroy()
            Entities.FindByName(null, "section_2_trigger_portal_spawn_a2_rm3a").Destroy()
            Entities.FindByName(null, "portal_a_lvl3").Destroy()
            Entities.FindByName(null, "section_2_portal_a1_rm3a").Destroy()
            Entities.FindByName(null, "section_2_portal_a2_rm3a").Destroy()
            Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
            Entities.FindByName(null, "room_2_portal_activate_rl").Destroy()
            Entities.FindByName(null, "room_3_portal_activate_rl").Destroy()
            Entities.FindByName(null, "door_2-close_door_rl").Destroy()
        }

        if (SSLoop) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(806, -528, 64), 150)) {
                EntFire("projected_texture_03", "TurnOn", "", 0, null)
            }
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector( 2151, -527, -499), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro5")
            }
        }
    }

    //## SP_A1_INTRO5 ##//
    if (GetMapName() == "sp_a1_intro5") {

        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(-64, 824, 320), 1024).Destroy()
        }

        if (SSLoop) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-67, 1319, -102), 60)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro6")
            }
        }
    }

    //## SP_A1_INTRO6 ##//
    if (GetMapName() == "sp_a1_intro6") {

        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "room_1_entry_door-close_door_rl").Destroy()
            Entities.FindByName(null, "room_1_fling_portal_activate_rl").Destroy()
            Entities.FindByName(null, "fling_safety_catapult").Destroy()
            Entities.FindByName(null, "room_1_fling_portal_emitter").Destroy()
            Entities.FindByName(null, "room_2_fling_portal_activate_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(648, 0, 176), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(1200, -136, 188), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2504, -160, 448), 1024).Destroy()
            local fallenautoportal = CreateProp("prop_dynamic", Vector(-325, 24, 0), "models/props/portal_emitter.mdl", 0)
            fallenautoportal.SetAngles(-90, 69, 0)
        }

        if (SSLoop == true) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(3015, -174, -125), 60)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro7")
            }
        }
    }

    //## SP_A1_INTRO7 ##//
    if (GetMapName() == "sp_a1_intro7") {

        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-open"), "trigger", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
            Entities.FindByName(null, "InstanceAuto9-socket_trigger").Destroy()
            Entities.FindByName(null, "bts_panel_door-LR_heavydoor_close").Destroy()
            Entities.FindByName(null, "heavy_door_backtrack_clip").Destroy()
            Entities.FindByName(null, "bts_panel_door-heavydoor_open_clip").Destroy()
            Entities.FindByName(null, "transition_airlock_door_close_rl").Destroy()
            Entities.FindByName(null, "transition_trigger").Destroy()
            Entities.FindByName(null, "portal_detector").__KeyValueFromString("CheckAllIDs", "1")
        }

        if (SSLoop == true) {
            WheatleySeq1 <- false

            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_top_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            // Make Wheatley non stealable
            try {
            Entities.FindByName(null, "@sphere").ConnectOutput("OnPlayerPickup","disablewheatleyplayerpickup")
            Entities.FindByName(null, "@sphere").ConnectOutput("OnPlayerDrop","enablewheatleyplayerpickup")
            // Disable sentaint arm and disable pickup until spchill is over
            Entities.FindByName(null, "sphere_impact_trigger").ConnectOutput("OnStartTouch","wheatleyhitground")
            // Skip panel bit
            Entities.FindByName(null, "@plug_open_rl").ConnectOutput("OnTrigger","SPSkipPanel")
            } catch(exception) { }

            // Voice Lines
            if(Entities.FindByName(null, "playline1")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a2_wheatley_ows01.wav")
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a2_wheatley_ows02.wav")
                printl("played line1")
            }

            if(Entities.FindByName(null, "playline2")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sphere_flashlight_tour67.wav")
                printl("played line2")
            }

            if(Entities.FindByName(null, "playline3")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_wakeup_hacking09.wav")
                printl("played line3")
            }

            if(Entities.FindByName(null, "playline4")) {
                Entities.FindByName(null, "InstanceAuto9-sphere_socket").EmitSound("vo\\wheatley\\sp_a1_wakeup_hacking12.wav")
                printl("played line4")
            }

            if(Entities.FindByName(null, "playline5")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_wakeup_hacking10.wav")
                printl("played line5")
            }

            if(Entities.FindByName(null, "playline6")) {
                Entities.FindByName(null, "InstanceAuto9-sphere_socket").EmitSound("ambient\\alarms\\portal_elevator_chime.wav")
                printl("played line6")
            }

            if(Entities.FindByName(null, "playline7")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\bw_finale4_hackworked01.wav")
                printl("played line7")
            }

            if(Entities.FindByName(null, "playline8")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret01.wav")
                printl("played line8")
            }

            if(Entities.FindByName(null, "playline9")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret08.wav")
                printl("played line9")
            }

            if(Entities.FindByName(null, "playline10")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret07.wav")
                printl("played line10")
            }

            if(Entities.FindByName(null, "playline11")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret05.wav")
                printl("played line11")
            }

            if(Entities.FindByName(null, "playline12")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret06.wav")
                printl("played line12")
            }

            if (!Entities.FindByName(null, "seq1finished")) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-1117, -416, 1280), 100)) {
                    Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "seq1finished")
                    printl("Seq1 Done")
                    Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\gloriousfreedom03.wav")
                    EntFire("offrails_airlock_door_1_open_rl", "trigger", "", 0, null)
                }
            }

            if (!Entities.FindByName(null, "seq2finished")) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-2692, -404, 1280), 100)) {
                    Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "seq2finished")
                    printl("Seq2 Done")

                    EntFire("@glados", "runscriptcode", "sp_a1_intro7_HoboTurretScene()", 0, null)

                    EntFire("myexplode2", "addoutput", "targetname playline8", 0.00, null)
                    EntFire("playline8", "addoutput", "targetname myexplode2", 0.11, null)

                    EntFire("myexplode2", "addoutput", "targetname playline9", 1.50, null)
                    EntFire("playline9", "addoutput", "targetname myexplode2", 1.51, null)

                    EntFire("myexplode2", "addoutput", "targetname playline10", 3.10, null)
                    EntFire("playline10", "addoutput", "targetname myexplode2", 3.11, null)

                    EntFire("myexplode2", "addoutput", "targetname playline11", 4.80, null)
                    EntFire("playline11", "addoutput", "targetname myexplode2", 4.81, null)

                    EntFire("myexplode2", "addoutput", "targetname playline12", 7.20, null)
                    EntFire("playline12", "addoutput", "targetname myexplode2", 7.25, null)
                }
            }

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-2207, 384, 1280), 200)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_wakeup")
            }
        }
    }

    //## SP_A2_LASER_INTRO ##//
    if (GetMapName() == "sp_a2_laser_intro") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "@exit_door-close_door_rl").Destroy()
        }

        if (SSLoop == true) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1224, 8, -590), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_stairs")
            }
        }
    }

    //## SP_A2_LASER_STAIRS ##//
    if (GetMapName() == "sp_a2_laser_stairs") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "door_1-close_door_rl").Destroy()
        }

        if (SSLoop) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(148, 1126, -396), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_dual_lasers")
            }
        }
    }




    /////////////////////////////////////
    //          AFTER THEMES           //
    /////////////////////////////////////

    //## SP_A2_INTRO ##//
    if (GetMapName()=="sp_a2_intro") {

        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "incinerator_death_fade").Destroy()
            Entities.FindByName(null, "camera_ghostAnim").Destroy()
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "incinerator_window_brush").Destroy()
            Entities.FindByName(null, "incinerator_portal").__KeyValueFromString("FadeStartDist", "1750")
            Entities.FindByName(null, "incinerator_portal").__KeyValueFromString("FadeDist", "1950")
            Entities.FindByName(null, "incinerator_portal").__KeyValueFromString("targetname", "incinerator_portal_custom")
            EntFire("@enable_arms", "trigger", "", 0, null)
            Entities.FindByName(null, "InstanceAuto13-dangle_ceiling-disable_arms").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2704, -1260, 112), 1024).Destroy()
            NoContinueFallCamera <- true
        }

        if (SSOneTimeRun==true) {
            printl("RAN")
            Intro2Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
            Intro2Viewcontrol.__KeyValueFromString("targetname", "Intro2Viewcontrol")
            Intro2Viewcontrol.__KeyValueFromString("target_team", "-1")
            Intro2Viewcontrol.SetOrigin(Entities.FindByName(null, "ghostAnim").GetOrigin())
            EntFire("Intro2Viewcontrol", "setparent", "ghostAnim", 0, null)
            EntFire("Intro2Viewcontrol", "setparentattachment", "attach_1", 0, null)
            EntFire("Intro2Viewcontrol", "enable", "", 0, null)
            EntFire("Intro2ViewcontrolTele", "disable", "", 20.75, null)
            EntFire("Intro2Viewcontrol", "addoutput", "targetname Intro2ViewcontrolTele", 0.25, null)
            EntFire("Intro2ViewcontrolTele", "addoutput", "targetname Intro2ViewcontrolDone", 20.80, null)
            self.PrecacheSoundScript( "ScriptedSequence.IncineratorFall" )
            local TempEnt = Entities.CreateByClassname("prop_dynamic")
            TempEnt.__KeyValueFromString("targetname", "TempEnt")
            EntFire("TempEnt", "addoutput", "targetname PlayFallSound", 0, null)
            EntFire("PlayFallSound", "kill", "", 0.11, null)
        }

        if (SSLoop==true) {

            if (Entities.FindByName(null, "PlayFallSound")) {
            Entities.FindByName(null, "blue").EmitSound("playonce\\scripted_sequences\\incinerator_fall_01.wav")
            }

            if (Entities.FindByName(null, "Intro2ViewcontrolTele")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    p.SetOrigin(Vector(2704, -1260, 92))
                }
            }

            if (Entities.FindByName(null, "Intro2ViewcontrolDone")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    p.SetOrigin(Vector(-3308, 536, -10737))
                    p.SetAngles(0 0 0)
                }
                EntFire("Intro2ViewcontrolDone", "addoutput", "targetname Intro2ViewcontrolFinished", 0.15, null)
            }

            EntFire("shaft_areaportal_1", "open", "", 0, null)
            EntFire("shaft_areaportal_2", "open", "", 0, null)

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-736, 1594, -11038), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_intro")
            }

            // Remove the player's Portal Gun
            if (Entities.FindByName(null, "player_near_portalgun")) {
                local ent = null
                while (ent = Entities.FindByClassname(ent, "weapon_portalgun")) {
                    ent.Destroy()
                }
            }

            // Give the player a Portal Gun
            if (!Entities.FindByName(null, "player_near_portalgun")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    if (Entities.FindByName(null, "CustomPortalGun")) {
                    } else {
                        PortalGunGiveContinue <- true
                        local ent = null
                        while (ent = Entities.FindByClassnameWithin(ent, "weapon_portalgun", p.GetOrigin(), 2)) {
                            PortalGunGiveContinue <- false
                        }
                        if (PortalGunGiveContinue==true) {
                        portalgun <- Entities.CreateByClassname("weapon_portalgun")
                        portalgun.__KeyValueFromString("StartingTeamNum", "0")
                        portalgun.__KeyValueFromString("targetname", "CustomPortalGun")
                        portalgun.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y, p.GetOrigin().z+20))
                        EntFireByHandle(portalgun, "use", "", 0.25, p, p)
                        EntFireByHandle(portalgun, "kill", "", 1.25, p, p)
                        }
                    }
                }
            }
        }
    }

    //## SP_A2_DUAL_LASERS ##//
    if (GetMapName()=="sp_a2_dual_lasers") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(640, 224, 936), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(488, 216, 960), 1024).Destroy()
        }

        if (SSLoop==true) {
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1063, 210, 277), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_over_goo")
            }

            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

        //## SP_A2_LASER_OVER_GOO ##//
    if (GetMapName()=="sp_a2_laser_over_goo") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "@repair_wall_kill_all").Destroy()
            Entities.FindByName(null, "door_1-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2552, -1056, 142.82), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2432, -1056, 72), 1024).Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(2008, -1055, -328), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_catapult_intro")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_CATAPULT_INTRO ##//
    if (GetMapName()=="sp_a2_catapult_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_1-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-56, -1576, -384), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-64, -1696, -408), 1024).Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-80, -2106, -805), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_trust_fling")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }
    //## SP_A2_TRUST_FLING ##//
    if (GetMapName()=="sp_a2_trust_fling") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-1152, 1616, 120), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-1152, 1680, 40), 1024).Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1151, 2087, -319), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_pit_flings")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_PIT_FLINGS ##//
    if (GetMapName()=="sp_a2_pit_flings") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "walltunnel_1_Cover_clip").Destroy()
            Entities.FindByName(null, "exit_door_lock_counter").Destroy()
        }

        if (SSLoop==true) {
            // Cube ramp disabler
            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "prop_weighted_cube", Vector(-448, -416, -104), 32)) {
                try {
                    Entities.FindByName(null, "ramp_90deg_02-ramp_close").Destroy()
                    Entities.FindByName(null, "ramp_90deg_04-ramp_close").Destroy()
                } catch(exception) { }
            }

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-893, 1223, -362), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_fizzler_intro")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_FIZZLER_INTRO ##//
    if (GetMapName()=="sp_a2_fizzler_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(872, -64, -8), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(928, -64, -24), 1024).Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1351, -71, -503), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_sphere_peek")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

        //## SP_A2_SPHERE_PEEK ##//
    if (GetMapName()=="sp_a2_sphere_peek") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (SSLoop==true) {

            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel LEVELNAME")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_TURRET_INTRO ##//
    if (GetMapName()=="sp_a2_turret_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1351, -71, -503), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_column_blocker")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_COLUMN_BLOCKER ##//
    if (GetMapName()=="sp_a2_column_blocker") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1351, -71, -503), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bridge_the_gap")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_BRIDGE_THE_GAP ##//
    if (GetMapName()=="sp_a2_bridge_the_gap") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1351, -71, -503), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_relays")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_LASER_RELAYS ##//
    if (GetMapName()=="sp_a2_laser_relays") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1351, -71, -503), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_gamer_time")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }
}

///////////////////////
// Copy & paste code //
///////////////////////

/*


    //## MAPNAME ##//
    if (GetMapName()=="MAPNAME") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            //Entities.FindByName(null, "NAME").Destroy()
        }

        if (SSLoop==true) {

            // Elevator code
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 45)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel LEVELNAME")
            }

            // Light fill
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

Entities.FindByClassnameNearest("trigger_once", Vector(878, -528, 137), 1024).Destroy()

Entities.FindByName(null, "NAME").Destroy()

Entities.FindByClassnameNearest("CLASS", Vector(1, 2, 3), 1).Destroy()

local p = null
while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 45)) {
    SendToConsole("commentary 1")
    SendToConsole("changelevel LEVELNAME")
}

local ent = null
while ( ent = Entities.FindByClassname(ent, "CLASSNAME")) {
    ent.Destroy()
}

// Make Wheatley look at nearest player
local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

if (GetMapName() == "MAPNAME") {
    SendToConsole("commentary 0")
}

EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)

try {
    EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
} catch(exception) {}
*/




// ╔═╗╦═╗╔═╗╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔  ╔═╗╔═╗╔╦╗╔═╗
// ╠═╝╠╦╝║ ║╠═╝  ║  ╠╦╝║╣ ╠═╣ ║ ║║ ║║║║  ║  ║ ║ ║║║╣
// ╩  ╩╚═╚═╝╩    ╚═╝╩╚═╚═╝╩ ╩ ╩ ╩╚═╝╝╚╝  ╚═╝╚═╝═╩╝╚═╝
// ╦╔╦╗╔═╗╔═╗╦═╗╔╦╗╔═╗╔╦╗  ╔═╗╦═╗╔═╗╔╦╗  ╔═╗╔╦╗╔═╗╔╦╗
// ║║║║╠═╝║ ║╠╦╝ ║ ║╣  ║║  ╠╣ ╠╦╝║ ║║║║  ║ ╦║║║║ ║ ║║
// ╩╩ ╩╩  ╚═╝╩╚═ ╩ ╚═╝═╩╝  ╚  ╩╚═╚═╝╩ ╩  ╚═╝╩ ╩╚═╝═╩╝

function CreatePropsForLevel(CacheTime, CreateTime, LoopTime) {

}