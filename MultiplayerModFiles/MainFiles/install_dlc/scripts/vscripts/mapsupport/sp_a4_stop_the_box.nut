// ██████╗██████╗             █████╗   ██╗██╗            ██████╗████████╗ █████╗ ██████╗            ████████╗██╗  ██╗███████╗           ██████╗  █████╗ ██╗  ██╗
//██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗           ╚══██╔══╝██║  ██║██╔════╝           ██╔══██╗██╔══██╗╚██╗██╔╝
//╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ╚█████╗    ██║   ██║  ██║██████╔╝              ██║   ███████║█████╗             ██████╦╝██║  ██║ ╚███╔╝ 
// ╚═══██╗██╔═══╝            ██╔══██║███████║            ╚═══██╗   ██║   ██║  ██║██╔═══╝               ██║   ██╔══██║██╔══╝             ██╔══██╗██║  ██║ ██╔██╗ 
//██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██████╔╝   ██║   ╚█████╔╝██║     ██████████╗   ██║   ██║  ██║███████╗██████████╗██████╦╝╚█████╔╝██╔╝╚██╗
//╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝     ╚═════════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝  ╚════╝ ╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (GetMapName()=="sp_a4_stop_the_box") {
        if (MSInstantRun==true) {
            Entities.FindByName(null, "music.sp_a4_stop_the_box_b1").__KeyValueFromString("targetname", "moja")
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "movelinear_light_track"), "addoutput", "OnFullyOpen moja:PlaySound", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (MSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (MSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(896, -800, 1296), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a4_laser_catapult")
            }
        }
    }
}