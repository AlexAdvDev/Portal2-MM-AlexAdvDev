// ██████╗██████╗             █████╗   ██╗██╗           ████████╗██████╗             █████╗  █████╗ ████████╗ █████╗ ██╗  ██╗
//██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ╚══██╔══╝██╔══██╗           ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║  ██║
//╚█████╗ ██████╔╝           ███████║██╔╝ ██║              ██║   ██████╦╝           ██║  ╚═╝███████║   ██║   ██║  ╚═╝███████║
// ╚═══██╗██╔═══╝            ██╔══██║███████║              ██║   ██╔══██╗           ██║  ██╗██╔══██║   ██║   ██║  ██╗██╔══██║
//██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗   ██║   ██████╦╝██████████╗╚█████╔╝██║  ██║   ██║   ╚█████╔╝██║  ██║
//╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝   ╚═╝   ╚═════╝ ╚═════════╝ ╚════╝ ╚═╝  ╚═╝   ╚═╝    ╚════╝ ╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.useautospawn <- true
        PermaPotato <- true
        Entities.FindByName(null, "@exit_door-proxy").__KeyValueFromString("targetname", "moja")
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "music.sp_a4_tb_catch_b0"), "StopSound", "", 0.5, null, null)
        EntFireByHandle(Entities.FindByName(null, "music.sp_a4_tb_catch_b0"), "PlaySound", "", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(704, 1184, 299), 20), "addoutput", "OnPressed moja:OnProxyRelay2", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(704, 1184, 299), 20), "addoutput", "OnUnPressed moja:OnProxyRelay1", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(704, 1184, 299), 20), "addoutput", "OnPressed @glados:RunScriptCode:PuzzleCompleted()", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByName(null, "puzzle_completed_relay").Destroy()
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        // Elevator changelevel
        local p = null
        while(p = Entities.FindByClassnameWithin(p, "player", Vector(1440, 896, 688), 50)) {
             
            SendToConsoleP232("changelevel sp_a4_stop_the_box")
        }
    }
}