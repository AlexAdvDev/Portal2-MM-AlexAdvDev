//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ██████╗ ██╗██████╗  ██████╗ ███████╗           ██╗███╗  ██╗████████╗██████╗  █████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██║██╔══██╗██╔════╝ ██╔════╝           ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝██████╔╝██║██║  ██║██║  ██╗ █████╗             ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗██╔══██╗██║██║  ██║██║  ╚██╗██╔══╝             ██║██║╚████║   ██║   ██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝██║  ██║██║██████╔╝╚██████╔╝███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝  ╚═════╝ ╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.useautospawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_52-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(0, 760, 56), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(0, 832, 40), 1024).Destroy()
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        // Make Wheatley look at nearest player
        local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
        EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

        // Elevator changelevel
        local p = null
        while(p = Entities.FindByClassnameWithin(p, "player", Vector(0, 1255, -297), 50)) {
            SendToConsoleP232("changelevel sp_a2_bridge_the_gap")
        }
    }
}