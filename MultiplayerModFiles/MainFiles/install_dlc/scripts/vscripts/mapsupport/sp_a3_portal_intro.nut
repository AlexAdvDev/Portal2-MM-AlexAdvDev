// ██████╗██████╗             █████╗ ██████╗            ██████╗  █████╗ ██████╗ ████████╗ █████╗ ██╗                ██╗███╗  ██╗████████╗██████╗  █████╗ 
//██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║                ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
//╚█████╗ ██████╔╝           ███████║ █████╔╝           ██████╔╝██║  ██║██████╔╝   ██║   ███████║██║                ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
// ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╔═══╝ ██║  ██║██╔══██╗   ██║   ██╔══██║██║                ██║██║╚████║   ██║   ██╔══██╗██║  ██║
//██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗██║     ╚█████╔╝██║  ██║   ██║   ██║  ██║███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
//╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝╚═╝      ╚════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun==true) {
        Entities.FindByName(null, "1970s_door1door_lower").__KeyValueFromString("targetname", "moja1")
        Entities.FindByName(null, "1970s_door1door_upper").__KeyValueFromString("targetname", "moja2")
        Entities.FindByName(null, "1970s_door_1_areaportal").__KeyValueFromString("targetname", "moja3")
        Entities.FindByName(null, "1970s_door2_door_lower").__KeyValueFromString("targetname", "moja4")
        Entities.FindByName(null, "1970s_door2_door_upper").__KeyValueFromString("targetname", "moja5")
        Entities.FindByName(null, "1970s_door_2_areaportal").__KeyValueFromString("targetname", "moja6")
        Entities.FindByName(null, "bowl_areaportal").__KeyValueFromString("targetname", "moja7")
        Entities.FindByName(null, "paint_sprayer_2").__KeyValueFromString("targetname", "moja8")
        // Here if we need to ent_fire something
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2505.95, -48, -2384), 20), "addoutput", "OnTrigger moja4:Open", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2505.95, -48, -2384), 20), "addoutput", "OnTrigger moja5:Open", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "sphere_entrance_lift_train_path_2"), "addoutput", "OnPass moja8:Start", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja3"), "Open", "", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja6"), "Open", "", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja7"), "Open", "", 1, null, null)
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "entrance_lift_train"), "StartForward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "abyss_loadsaved").Destroy()
        Entities.FindByName(null, "bowl_areaportal_blackbrush").Destroy()
        Entities.FindByName(null, "damaged_sphere_door_3-door_close").Destroy()
        Entities.FindByName(null, "damaged_sphere_door_4-door_close").Destroy()
        Entities.FindByName(null, "liftshaft_entrance_door-door_close").Destroy()
        Entities.FindByName(null, "transition_trigger").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2400, 1360, -1920), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2416, -128, 640.01), 20).Destroy()
    }

    if (MSPostPlayerSpawn==true) {

    }

    if (MSLoop==true) {
        // Make our own changelevel trigger
        local p = null
        while(p = Entities.FindByClassnameWithin(p, "player", Vector(3839.99, 348.8, 5674.67), 50)) {
            SendToConsole("commentary 1")
            SendToConsole("changelevel sp_a3_end")
        }
    }
}