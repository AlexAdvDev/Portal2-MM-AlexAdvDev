//  ██████╗██████╗             █████╗ ██████╗            ██╗      █████╗  ██████╗███████╗██████╗             ██████╗████████╗ █████╗ ██╗██████╗  ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██╔════╝╚══██╔══╝██╔══██╗██║██╔══██╗██╔════╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ╚█████╗    ██║   ███████║██║██████╔╝╚█████╗ 
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗            ╚═══██╗   ██║   ██╔══██║██║██╔══██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗██████╔╝   ██║   ██║  ██║██║██║  ██║██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.useautospawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_multiple", Vector(144, 600, 94.82), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(144, 704, 72), 1024).Destroy()
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        local p = null
        while(p = Entities.FindByClassnameWithin(p, "player", Vector(148, 1126, -396), 50)) {
             
            SendToConsoleP232("changelevel sp_a2_dual_lasers")
        }
    }
}