// ██████╗██████╗             █████╗ ██████╗            ██████╗ ██╗████████╗           ███████╗██╗     ██╗███╗  ██╗ ██████╗  ██████╗
//██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██║╚══██╔══╝           ██╔════╝██║     ██║████╗ ██║██╔════╝ ██╔════╝
//╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╔╝██║   ██║              █████╗  ██║     ██║██╔██╗██║██║  ██╗ ╚█████╗
// ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔═══╝ ██║   ██║              ██╔══╝  ██║     ██║██║╚████║██║  ╚██╗ ╚═══██╗
//██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║     ██║   ██║   ██████████╗██║     ███████╗██║██║ ╚███║╚██████╔╝██████╔╝
//╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝     ╚═╝   ╚═╝   ╚═════════╝╚═╝     ╚══════╝╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun==true) {
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "walltunnel_1_Cover_clip").Destroy()
        Entities.FindByName(null, "exit_door_lock_counter").Destroy()
        Entities.FindByName(null, "ramp_90deg_02-ramp_close").Destroy()
        Entities.FindByName(null, "ramp_90deg_04-ramp_close").Destroy()
        Entities.FindByName(null, "ramp_90deg_04-ramp_open").__KeyValueFromString("targetname", "p2mpramp2")
        Entities.FindByName(null, "ramp_90deg_02-ramp_open").__KeyValueFromString("targetname", "p2mpramp1")
        EntFire("door_0-door_open_relay", "addoutput", "OnTrigger p2mpramp1:trigger::1", 1, null)
        EntFire("door_0-door_open_relay", "addoutput", "OnTrigger p2mpramp2:trigger::1", 1, null)
        EntFire("button_1-button", "addoutput", "OnUnpressed button_1-button:pressin::0.02", 1, null)
        EntFire("button_1-button", "pressin", "", 1, null)
    }

    if (MSPostPlayerSpawn==true) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop==true) {
        // Elevator changelevel
        local p = null
        while(p = Entities.FindByClassnameWithin(p, "player", Vector(-893, 1223, -362), 50)) {
            SendToConsole("commentary 1")
            SendToConsole("changelevel sp_a2_fizzler_intro")
        }
    }
}