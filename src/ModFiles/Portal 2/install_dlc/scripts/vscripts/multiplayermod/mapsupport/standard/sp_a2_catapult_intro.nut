//  ██████╗██████╗             █████╗ ██████╗             █████╗  █████╗ ████████╗ █████╗ ██████╗ ██╗   ██╗██╗     ████████╗           ██╗███╗  ██╗████████╗██████╗  █████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██║     ╚══██╔══╝           ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║  ╚═╝███████║   ██║   ███████║██████╔╝██║   ██║██║        ██║              ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║  ██╗██╔══██║   ██║   ██╔══██║██╔═══╝ ██║   ██║██║        ██║              ██║██║╚████║   ██║   ██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗╚█████╔╝██║  ██║   ██║   ██║  ██║██║     ╚██████╔╝███████╗   ██║   ██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝ ╚════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚══════╝   ╚═╝   ╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.useautospawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_1-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-56, -1576, -384), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-64, -1696, -408), 1024).Destroy()
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        // Elevator changelevel
        local p = null
        while(p = Entities.FindByClassnameWithin(p, "player", Vector(-80, -2106, -805), 50)) {
             
            SendToConsoleP232("changelevel sp_a2_trust_fling")
        }
    }
}