// █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

//## Replace Plugin Functions ##//
// if the plugin isnt loaded
// then we make some replacements
function MakePluginReplacementFunctions() {
    function GetPlayerName(entinx) {
        return "player" + entinx
    }
    function AddChatCallback(func) {
        printl("plugin not loaded NOT adding chat callback")  
    }
}

function GetHighest(inpvec) {
    local highest = -99999999
    local highesttemp = -99999999
    if (UnNegative(inpvec.x) > highesttemp) {
        highesttemp = UnNegative(inpvec.x)
        highest = inpvec.x
    }
    if (UnNegative(inpvec.y) > highesttemp) {
        highesttemp = UnNegative(inpvec.y)
        highest = inpvec.y
    }
    if (UnNegative(inpvec.z) > highesttemp) {
        highesttemp = UnNegative(inpvec.z)
        highest = inpvec.z
    }
    return highest
}

function ForceRespawnAll() {
    // GlobalSpawnClass Teleport
    if (GlobalSpawnClass.useautospawn == true) {
        local p = null
        while (p = Entities.FindByClassname(p, "player")) {
            TeleportToSpawnPoint(p, null)
        }
    }
}

function ToggleCheats() {
    if (CheatsOn == null || CheatsOn == false) {
        CheatsOn = true
    } else {
        CheatsOn = false
    }
}

function SetCheats() {
    CheatsOn = Entities.FindByModel(null, "models/cheatdetectionp232.mdl")
    if (CheatsOn == null || CheatsOn == false) {
        CheatsOn = false
    } else {
        CheatsOn = true
        Entities.FindByModel(null, "models/cheatdetectionp232.mdl").Destroy()
    }
    printl("===== Cheat Detection =====")
    printl("           " + CheatsOn)
    printl("===========================")
}

function SetCosmetics(p) {
    if (PluginLoaded == true) {
        // Get Nessasary Data
        local pname = GetPlayerName(p.entindex())

        //## Kyle Customization ##//
        if (pname == "kyleraykbs") {
            SetPlayerModel(p, "models/info_character/info_character_player.mdl")
        }

        // //## Dreadnox Customization ##//
        if (pname == "Dreadnox") {
            printl("Dreadnox is here!")
            SetPlayerModel(p, "models/props_underground/underground_weighted_cube.mdl")
        }

        //## Sear Customization ##//
        if (pname == "sear") {
            SetPlayerModel(p, "models/car_wrecked_dest/car_wrecked_b.mdl")
        }

        //## Mellow Customization ##//
        if (pname == "Mellow1238") {
            SetPlayerModel(p, "models/props_moon/moonrock_med08.mdl")
        }

        //## Nano Customization ##//
        if (pname == "Nanoman2525") {
            SetPlayerModel(p, "models/props_foliage/mall_tree_medium01.mdl")
        }

        // //## Bumpy Customization ##//
        // if (pname == "Bumpy") {
        //     SetPlayerModel(p, "models/gibs/hgibs.mdl")
        // }

        // //## nintendude Customization ##//
        // if (pname == "nintendude") {
        //     SetPlayerModel(p, "props/food_can/food_can_open")
        // }
    }
}

function RandomColor() {
    local rcr = RandomInt(0, 255)
    local rcg = RandomInt(0, 255)
    local rcb = RandomInt(0, 255)
    local ColorBal = RandomInt(0, 2)
    // Balance The Color
    if (rcr > rcg && rcr > rcb) {
        rcr = rcr * 2
        if (rcr > 255) {
            rcr = 255
        }
        if (ColorBal == 1) {
            rcg = rcg / 2
            rcb = rcb / 2
        }
        if (ColorBal == 2) {
            rcg = rcg * 2
            if (rcg > 255) {
                rcg = 255
            }
        rcb = rcb / 3
        }
    } else {
        if (rcg > rcr && rcg > rcb) {
            rcg = rcg * 2
            if (rcg > 255) {
                rcg = 255
            }
            if (ColorBal == 1) {
                rcr = rcr / 2
            }
            if (ColorBal == 2) {
                rcr = rcr * 2
                if (rcr > 255) {
                    rcr = 255
                }
            }
            rcg = rcg / 2
        } else {
            if (rcb > rcr && rcb > rcg) {
                rcb = rcb * 2
                if (rcb > 255) {
                    rcb = 255
                }
                rcr = rcr / 2
                rcg = rcg / 2
                if (ColorBal == 2) {
                    rcr = R / 2
                    rcg = rcg * 2
                    if (rcg > 255) {
                    rcg = 255
                    }
                }
            }
        }
    }
    
    if (RandomInt(1, 7)==3) {
        rcg = RandomInt(1, 30)
        rcb = RandomInt(1, 30)
        rcr = RandomInt(170, 255)
    }
    if (RandomInt(1, 9)==4) {
        rcg = RandomInt(150, 255)
        rcb = RandomInt(1, 30)
        rcr = RandomInt(170, 255)
    }

    class ColorBar {
        r = rcr
        g = rcg
        b = rcb
    }
    return ColorBar
}

function TeleportPlayerToClass(player, curclass) {
    player.SetOrigin(curclass.pos)
    player.SetAngles(curclass.rot.x, curclass.rot.y, curclass.rot.z)
}

function p232fogswitch(fogname) {
    printl("Switching to fog: " + fogname)
    foreach (fogclass in fogs) {
        if (fogclass.fogname == fogname) {
            printl("Found fog: " + fogclass.fogname)
            // go through each player and set their fog to the new fog
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                EntFireByHandle(p, "setfogcontroller", fogname, fogclass.fogdelay, null, null)
            }
            defaultfog <- fogname
        }
    }
}

function GetPlayerColor(p, multiply = true) {
    local PlayerID = p.entindex()
    try {
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
    } catch(e) { }
    if (PlayerID > 16) {
        R <- 255; G <- 255; B <- 255;
    }

    if (multiply == true) {
        // Multiply the color 
        R <- R - 100
        G <- G - 100
        B <- B - 100
        // cap the color at 255
        if (R > 255) {
            R <- 255
        }
        if (G > 255) {
            G <- 255
        }
        if (B > 255) {
            B <- 255
        }
    }

    return class {
        r = R
        g = G
        b = B
    }
}

function CreateTrigger(desent, x1, y1, z1, x2, y2, z2){
	if(DevMode == true){
		DebugDrawBox(Vector(x1, y1, z1), Vector(0, 0, 0), Vector(x2-x1, y2-y1, z2-z1), 255, 100, 8, 20, TickSpeed*1.17);
	}

    local TransitionVarible = 0
    if (x1 >= x2) {
        TransitionVarible = x2
        x2 = x1
        x1 = TransitionVarible
    }

    local TransitionVarible = 0
    if (y1 >= y2) {
        TransitionVarible = y2
        y2 = y1
        y1 = TransitionVarible
    }

    local TransitionVarible = 0
    if (z1 >= z2) {
        TransitionVarible = z2
        z2 = z1
        z1 = TransitionVarible
    }

    local plist = []
    local p = null
    local outputp = null
    if (desent == null) {
        while (p = Entities.FindInSphere(p, Vector(0, 0, 0), 16384)) {
            local pos = p.GetOrigin()
            if (pos.x >= x1 && pos.x <= x2){
                if (pos.y >= y1 && pos.y <= y2){
                    if (pos.z >= z1 && pos.z <= z2){
                        plist.push(p)
                    }
                }
            }
        }
    } else {
        while (p = Entities.FindByClassname(p, desent)) {
            local pos = p.GetOrigin()
            if (pos.x >= x1 && pos.x <= x2){
                if (pos.y >= y1 && pos.y <= y2){
                    if (pos.z >= z1 && pos.z <= z2){
                        plist.push(p)
                    }
                }
            }
        }
    }
    return plist
}

function MinifyModel(mdl) {
// Add the models/ to the side of the model name if it's not already there
    if (mdl.slice(0, 7) == "models/") {
        mdl = mdl.slice(7, mdl.len())
    }
    // Add the .mdl to the end of the model name if it's not already there
    if (mdl.slice(mdl.len() - 4, mdl.len()) == ".mdl") {
        mdl = mdl.slice(0, mdl.len() - 4)
    }
    return mdl
}

AssignedPlayerModels <- []
function SetPlayerModel(p, mdl) {
    PrecacheModelNoDelay(mdl)
    local mdl2 = MinifyModel(mdl)
    EntFire("p232servercommand", "command", "script Entities.FindByName(null, \"" + p.GetName() + "\").SetModel(\"" + mdl + "\")", 1)
    local pmodelclass = class {
        player = p
        model = mdl
    }
    AssignedPlayerModels.push(pmodelclass)
}

PrecachedProps <- []
function PrecacheModel(mdl) {
    SendToConsole("script PrecacheModelNoDelay(\"" + mdl + "\")")
}
function PrecacheModelNoDelay(mdl) {
        // Add the models/ to the side of the model name if it's not already there
    if (mdl.slice(0, 7) != "models/") {
        mdl = "models/" + mdl
    }
    // Add the .mdl to the end of the model name if it's not already there
    if (mdl.slice(mdl.len() - 4, mdl.len()) != ".mdl") {
        mdl = mdl + ".mdl"
    }

    // Remove the models/ from the left side and the .mdl from the right side
    local minimdl = MinifyModel(mdl)
    
    // Check if the model is already precached
    local NotPrecached = true
    foreach (precached in PrecachedProps) {
        if (precached == minimdl) {
            NotPrecached = false
        }
    }

    if (!Entities.FindByModel(null, mdl) && NotPrecached == true) {
        PrecachedProps.push(minimdl)
        if (CheatsOn == false) {
            SendToConsole("sv_cheats 1; prop_dynamic_create " + minimdl)
        } else {
            SendToConsole("sv_cheats 1; prop_dynamic_create " + minimdl)
        }
        EntFire("p232servercommand", "command", "script Entities.FindByModel(null, \"" + mdl + "\").Destroy()", 0.4)
        printl("Precached model: " + minimdl + " AKA " + mdl)
    } else {
        printl("Model: " + mdl + " already precached!")
    }
}

function FindPlayerClass(plyr) {
    foreach (curclass in playerclasses) {
        if (curclass.player == plyr) {
            return curclass
        }
    }
}

function FindEntityClass(ent, createclassifnone = true) {
    foreach (curclass in entityclasses) {
        if (curclass.entity == ent) {
            return curclass
        }
    }
    printl("Could not find entity class for entity: " + ent)
    if (createclassifnone) {
        CreateEntityClass(ent)
        foreach (curclass in entityclasses) {
            if (curclass.entity == ent) {
                return curclass
            }
        }
    }
}

function MultiplyVector(vec, mult) {
    return Vector(vec.x * mult, vec.y * mult, vec.z * mult)
}

function CreateEntityClass(ent) {
    printl("Creating new entity class for entity: " + ent)
    local newclass = class {
        entity = ent
    }
    entityclasses.push(newclass)
}

function GetDistanceScore(vec1, vec2) {
    local betweenvec = UnNegative(vec1 - vec2)
    local score = betweenvec.x + betweenvec.y + betweenvec.z
    return score
}

function MoveEntityOnTrack(entity, PointList, Speed = "undefined", Distance = "undefined") {
    if (Speed == "undefined") {
        Speed = 1
    }
    if (Distance == "undefined") {
        Distance = (Speed * 1.2) + 1
    }

    local entclass = FindEntityClass(entity)

    try {
        if (entclass.followingpointlist[0].x != PointList[0].x && entclass.followingpointlist[0].y != PointList[0].y && entclass.followingpointlist[0].z != PointList[0].z) {
            entclass.followingpointlist <- PointList
            entclass.followingpointlistindex <- 0
        }
    } catch(e) {
        entclass.followingpointlist <- PointList
        entclass.followingpointlistindex <- 0
    }

    local cindx = -1
    if (GetDistanceScore(entity.GetOrigin(), PointList[entclass.followingpointlistindex]) < Distance) {
        cindx = entclass.followingpointlistindex
        entclass.followingpointlistindex <- entclass.followingpointlistindex + 1
    }

    if (entclass.followingpointlistindex >= PointList.len()) {
        entclass.followingpointlistindex <- 0
        entclass.followingpointlist <- null
        return true
    }

    local offset = MultiplyVector(GetDirectionalOffset(entity.GetOrigin(), PointList[entclass.followingpointlistindex]), Speed)
    entity.SetOrigin(entity.GetOrigin() - offset)

    if (VisualDebug) {
        DebugDrawLine(entity.GetOrigin(), PointList[entclass.followingpointlistindex], 255, 255, 0, true, 0)
        if (entclass.followingpointlistindex == 0) {
            DebugDrawLine(entity.GetOrigin(), PointList[PointList.len() - 1], 0, 255, 0, true, 0)
        } else {
            DebugDrawLine(entity.GetOrigin(), PointList[entclass.followingpointlistindex - 1], 0, 255, 0, true, 0)
        }

        local curindx = 0
        foreach (point in PointList) {
            DebugDrawBox(point, Vector(-5, -5, -5), Vector(5, 5, 5), 255, 255, 255, 100, 0)
            if (curindx != entclass.followingpointlistindex) {
                if (curindx == 0) {
                    DebugDrawLine(PointList[PointList.len() - 1], point, 255, 100, 255, true, 0)
                } else {
                    DebugDrawLine(PointList[curindx - 1], point, 255, 100, 255, true, 0)
                }
            }
            curindx = curindx + 1
        }
    }

    if (cindx == -1) {
        return false
    } else {
        return cindx
    }
}

function FindNearest(origin, radius, entitiestoexclude = [null], specificclass = null) {
    // setup some existing locals
    try {
        entitiestoexclude[0]
    } catch(e) {
        // if this errors out we should probably put the defined ent into a table
        entitiestoexclude = [entitiestoexclude]
    }

    // define some locals
    local bestscore = 999999999
    local nearestent = null
    local ent = null

    // find the nearest entity
    if (specificclass == null) {
        while (ent = Entities.FindInSphere(ent, origin, radius)) {
            // check if the entity is in the list of entities to exclude
            local exclude = false
            // we only need to check if 1 ent equals to excluded that's why i added a break
            foreach (excluded in entitiestoexclude) {
                if (excluded == ent) {
                    exclude = true
                    break
                }
            }
            if (exclude == false) {
                // get the score
                local score = origin - ent.GetOrigin()
                score = UnNegative(score)
                score = score.x + score.y + score.z
                // check if the entity is closer than the current best
                if (score < bestscore) {
                    bestscore = score
                    nearestent = ent
                }
            }
        }
    } else {
        while (ent = Entities.FindByClassnameWithin(ent, specificclass, origin, radius)) {
            // check if the entity is in the list of entities to exclude
            local exclude = false
            // we only need to check if 1 ent equals to excluded that's why i added a break
            foreach (excluded in entitiestoexclude) {
                if (excluded == ent) {
                    exclude = true
                    break
                }
            }
            if (exclude == false) {
                // get the score
                local score = origin - ent.GetOrigin()
                score = UnNegative(score)
                score = score.x + score.y + score.z
                // check if the entity is closer than the current best
                if (score < bestscore) {
                    bestscore = score
                    nearestent = ent
                }
            }
        }
    }

    // return the nearest entity
    return nearestent
}

function ForwardVectorTraceLine(origin, forward, mindist = 0, maxdist = 10000, currentstepped = 4, stepmultiplier = 1, maxreldist = 32, entitiestoexclude = [null], specificclass = null) {
    //maxdist = maxdist / stepmultiplier
    
    // setup some existing locals
    try {
        entitiestoexclude[0]
    } catch(e) {
        // if this errors out we should probably put the defined ent into a table
        entitiestoexclude = [entitiestoexclude]
    }
    
    // define some locals
    local origorigin = origin // preserve
    local origmindist = mindist // preserve
    local origmaxdist = maxdist // preserve
    local originoffset = Vector(forward.x, forward.y, forward.z) // make sure we get outside of the desired min zone
    local fowardstep = forward //Vector(forward.x * currentstepped, forward.y * currentstepped, forward.z * currentstepped) // multiply this se we can get a base step amount
    local outputorigin = Vector(0, 0, 0) // output
    local nearestent = null // output
    local clradd = 0
    local opadd = 0

    //# trace the ray #//
    local loopamt = 0
    while (loopamt < currentstepped) {
        // do some math setup
        local temporigin = origin + originoffset
        // find the nearest ent within our maxdist
        nearestent = FindNearest(temporigin, origmaxdist, entitiestoexclude, specificclass)
        
        // now that we have the nearest ent, we need to see how far it is from the temporigin
        if (nearestent == null) {
            return null
        }
        local score = temporigin - nearestent.GetOrigin()
        score = UnNegative(score)
        // multiply forwards by the lowest value in the score
        local lowest = 0
        if (score.x > lowest) {
            lowest = score.x
        }
        if (score.y > lowest) {
            lowest = score.y
        }
        if (score.z > lowest) {
            lowest = score.z
        }

        fowardstep = Vector((forward.x * lowest), (forward.y * lowest), (forward.z * lowest))
        local deboogdatalarb = lowest - 50
        if (deboogdatalarb < 0) {
            deboogdatalarb = 0
        }

        clradd = clradd + 50
        opadd = opadd + 1
        if (Entities.FindByName(null, "blue") != entitiestoexclude[0]) {
            if (VisualDebug) {
                DebugDrawBox(origin + originoffset, Vector(deboogdatalarb / -1, deboogdatalarb / -1, deboogdatalarb / -1), Vector(deboogdatalarb, deboogdatalarb, deboogdatalarb), 255 - clradd, 0, clradd, 0 + opadd, 0.1)
                DebugDrawBox(origin + originoffset, Vector(-10, -10, -10), Vector(10, 10, 10), 0, 255, 255, 10, 0.1)
            }
        }

        // add the fowardstep to the origin
        originoffset = originoffset + fowardstep

        // after getting the end point, we need to see if we hit anything
        local newnearest = FindNearest(origin + originoffset, maxreldist, entitiestoexclude, specificclass)
        if (newnearest != null) {
            if (VisualDebug) {
                DebugDrawLine(origorigin, origin + originoffset, 0, 255, 0, false, 0.1)
            }
            return newnearest
            break
        }


        // // if we have reached the end of the line break
        // if (fowardstep.x == 0 && fowardstep.y == 0 && fowardstep.z == 0) {
        //     printl("END OF LINE")
        //     break
        // }

        loopamt = loopamt + 1
    }

    outputorigin = origin + originoffset
    if (VisualDebug) {
        DebugDrawLine(origorigin, outputorigin, 0, 255, 0, false, 0.1)
    }
}

function FindPlayerByName(name) {
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        local plrname = GetPlayerName(p.entindex())
        try {
            plrname = plrname.slice(0, name.len())
        } catch(e) {} // if the name is too long
        printl(plrname)
        printl(name)
        if (plrname.tolower()==name.tolower()) {
            return p
        }
    }
    return null
}

function DisplayPlayerColor(player) {
    playercolordisplay <- Entities.CreateByClassname("game_text")
    playercolordisplay.__KeyValueFromString("targetname", "playercolordisplay")
    playercolordisplay.__KeyValueFromString("holdtime", "3")
    playercolordisplay.__KeyValueFromString("fadeout", "0.2")
    playercolordisplay.__KeyValueFromString("fadein", "0.2")
    playercolordisplay.__KeyValueFromString("spawnflags", "0")
    playercolordisplay.__KeyValueFromString("color", "255 200 0")
    playercolordisplay.__KeyValueFromString("channel", "3")
    printl(GetPlayerColor(player))
}

function FindAndReplace(inputstr, findstr, replacestr) {
    local startstrip = inputstr.find(findstr)
    if (startstrip==null) {
        return inputstr
    }
    local endstrip = startstrip + findstr.len()

    local newstr = inputstr.slice(0, startstrip) + replacestr + inputstr.slice(endstrip, inputstr.len())
    return newstr
}

function RemoveAllClassname(classname, delay = 0) {
    local p = null
    while (p = Entities.FindByClassname(p, classname)) {
        if (delay == 0) {
            p.Destroy()
        } else {
            EntFireByHandle(p, "kill", "", delay, null, null)
        }
        TotalRemovedEnts = TotalRemovedEnts + 1
    }
}

function RemoveAllClassnameDistance(classname, pos, dist, delay = 0) {
    local p = null
    while (p = Entities.FindByClassnameWithin(p, classname, pos, dist)) {
        EntFireByHandle(p, "kill", "", delay, null, null)
        TotalRemovedEnts = TotalRemovedEnts + 1
    }
}

function UnNegative(num) {
    try {
        local test = num.x

        if (num.x < 0) {
            num.x = num.x * -1
        }
        if (num.y < 0) {
            num.y = num.y * -1
        }
        if (num.z < 0) {
            num.z = num.z * -1
        }

        num = Vector(num.x, num.y, num.z)
    } catch(e) {
        if (num <= 0) {
            num = num * -1
        }
    }
    return num
}

// Teleport players within a distance
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

function TriggerOnceHook(TriggerName, FunctionName) {

}

// function CacheModel(ModelName) {
//     if (Entities.FindByModel(null, "models/"+ModelName)) {
//             if (GetDeveloperLevel() == 1) {
//                 printl("(P2:MM): Model " + ModelName + " is already cached!")
//             }
//         } else {
//         try {
//             if (servercommand) {
//                 if (GetDeveloperLevel() == 1) {
//                     printl("(P2:MM): point_servercommand to cache props already exists!")
//                 }
//             }
//         } catch(exception) {
//             // Create an entity that sends a server command
//             servercommand <- Entities.CreateByClassname("point_servercommand")
//         }
//         EntFireByHandle(servercommand, "command", "hud_saytext_time 0", 0, null, null)
//         EntFireByHandle(servercommand, "command", "sv_cheats 1", 0, null, null)
//         EntFireByHandle(servercommand, "command", "prop_dynamic_create " + ModelName, 0, null, null)
//         EntFireByHandle(servercommand, "command", "sv_cheats 0", 0, null, null)
//         CachedModels.push("models/"+ModelName)

//         if (GetDeveloperLevel() == 1) {
//             printl("(P2:MM): Model " + ModelName + " has been cached sucessfully!")
//         }
//     }
// }

function GetAdminLevel(id) {
    foreach (admin in Admins) {
        // Seperate the playername and the admin level
        local level = split(admin, "[]")[0]
        local playername = split(admin, "]")[1]

        if (playername==GetPlayerName(id)) {
            return level.tointeger()
        }
    }
    if (id == 1) {
        return 6
    }
    return 0
}

// Find player by name
function ExpandName(name) {
    name = name.tolower()
    // go through each player
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        // get the player's name
        local plrname = GetPlayerName(p.entindex())
        // if the name matches the input name
        try {
            if (plrname.slice(0, name.len()).tolower() == name.tolower()) {
                // return the player
                return plrname
            }
        } catch(e) {} // if the name is too long
    }
    return name
}

// Get Directional Offset
function GetDirectionalOffset(org1, org2, multipl = 1) {
    
    local bxoffset = org1 - org2

    // get the highest number in bxoffset
    local highest = UnNegative(GetHighest(bxoffset))
    local wasneg = false
    // if it was originally negative then set the var
    if (GetHighest(bxoffset) < 0) {
        wasneg = true
    }

    // divide it by the highest number
    // bxoffset.x <- bxoffset.x / highest
    // bxoffset.y <- bxoffset.y / highest
    // bxoffset.z <- bxoffset.z / highest
    // if highest is not 0
    if (highest > 0) {
        //i genuinely have no idea if this works, but if js can do it squirrel can too
        
        // if bxoffset.x is negative
        local wasxneg = bxoffset.x < 0

        // if bxoffset.y is negative
        local wasyneg = bxoffset.y < 0

        // if bxoffset.z is negative
        local waszneg = bxoffset.z < 0

        // set the new values
        local newx = bxoffset.x / highest
        if (wasxneg == true && newx > 0) {
            newx = 0
        }
        local newy = bxoffset.y / highest
        if (wasyneg == true && newy > 0) {
            newy = 0
        }
        local newz = bxoffset.z / highest
        if (waszneg == true && newz > 0) {
            newz = 0
        }

        // put the new values back into bxoffset
        bxoffset = Vector(newx*multipl, newy*multipl, newz*multipl)

    }
    
    return bxoffset
}

// Find player by index
function FindByIndex(id)  {
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        if (p.entindex()==id) {
            return p
        }
    }
}

// Potato
function PotatoIfy(plr) {
    if (Entities.FindByName(null, "weapon_portalgun_player" + plr.entindex())) {
        EntFire("weapon_portalgun_player" + plr.entindex(), "SetBodygroup", "1", 0)
    }
    if (Entities.FindByName(null, "viewmodel_player" + plr.entindex())) {
        EntFire("viewmodel_player" + plr.entindex(), "SetBodyGroup", "1", 0)
    }
}

// No Potato
function UnPotatoIfy(plr) {
    if (Entities.FindByName(null, "weapon_portalgun_player" + plr.entindex())) {
        EntFire("weapon_portalgun_player" + plr.entindex(), "SetBodygroup", "0", 0)
    }
    if (Entities.FindByName(null, "viewmodel_player" + plr.entindex())) {
        EntFire("viewmodel_player" + plr.entindex(), "SetBodyGroup", "0", 0)
    }
}

function CanPing(ison = true) {
    local env_global = Entities.CreateByClassname("env_global")
    local env_global2 = Entities.CreateByClassname("env_global")

    env_global.__KeyValueFromString("globalstate", "no_pinging_blue")
    env_global2.__KeyValueFromString("globalstate", "no_pinging_orange")

    // set the targetname
    env_global.__KeyValueFromString("targetname", "mpmod_no_pinging_blue")
    env_global2.__KeyValueFromString("targetname", "mpmod_no_pinging_orange")

    
    local entFireByHandleState = "turnon"
    if (ison){
        entFireByHandleState = "turnoff"
    }
    EntFireByHandle(env_global, entFireByHandleState, "", 0.1, null, null)
    EntFireByHandle(env_global2, entFireByHandleState, "", 0.1, null, null)

    // delete the entities
    EntFireByHandle(env_global, "kill", "", 0.2, null, null)
    EntFireByHandle(env_global2, "kill", "", 0.2, null, null)
}

function CanTaunt(ison = true) {
    local env_global = Entities.CreateByClassname("env_global")
    local env_global2 = Entities.CreateByClassname("env_global")

    env_global.__KeyValueFromString("globalstate", "no_taunting_blue")
    env_global2.__KeyValueFromString("globalstate", "no_taunting_orange")

    // set the targetname
    env_global.__KeyValueFromString("targetname", "mpmod_no_taunting_blue")
    env_global2.__KeyValueFromString("targetname", "mpmod_no_taunting_orange")

    local entFireByHandleState = "turnon"
    if (ison){
        entFireByHandleState = "turnoff"
    }
    EntFireByHandle(env_global, entFireByHandleState, "", 0.1, null, null)
    EntFireByHandle(env_global2, entFireByHandleState, "", 0.1, null, null)

    // delete the entities
    EntFireByHandle(env_global, "kill", "", 0.2, null, null)
    EntFireByHandle(env_global2, "kill", "", 0.2, null, null)
}

function PortalGunSpawn(ison = true) {
    local env_global = Entities.CreateByClassname("env_global")

    env_global.__KeyValueFromString("globalstate", "portalgun_nospawn")

    // set the targetname
    env_global.__KeyValueFromString("targetname", "mpmod_portalgun_nospawn")

    if (ison) {
            EntFireByHandle(env_global, "turnoff", "", 0.1, null, null)
    } else {
            EntFireByHandle(env_global, "turnon", "", 0.1, null, null)
    }

    // delete the entities
    EntFireByHandle(env_global, "kill", "", 0.2, null, null)
}

// Find The Spawn Point For The Map // Returns a class with {red and blue} in each of those subclasses there is {spawnpoint and rotation}
function BestGuessSpawnpoint() {
    printl(GlobalSpawnClass.blue.spawnpoint)
    if (MadeSpawnClass == false) {
        // Box Ents
        BoxEnts <- [
            "@arrival_video_master",
            "@departure_video_master",
            "@end_of_playtest_text",
            "@debug_dump_map_bat_file",
            "@debug_change_to_next_map",
            "@chapter_subtitle_text",
            "@chapter_title_text",
            "@transition_script",
            "@transition_from_map",
        ]

        printl("===========================")
        printl("Box Ents")
        printl("===========================")

        local BestSurrondingBoxEnt = -1
        local CurrentBestStartingEnt = null
        local StartingBoxEnt = null
        foreach (PossibleEnt in BoxEnts) {
            local PossibleSurroundingEnts = 0
            local CurrentBoi = Entities.FindByName(null, PossibleEnt)
            if (CurrentBoi) {
                // If we have found one yet lets tally up the amount of surronding box ents
                local ent = null
                while (ent = Entities.FindInSphere(ent, CurrentBoi.GetOrigin(), 300)) {
                    // if (ent.GetName() in BoxEnts) {
                    //     printl("Found a box ent: " + ent.GetName())
                    //     PossibleSurroundingEnts = PossibleSurroundingEnts + 1
                    // }
                    foreach (TEnt in BoxEnts) {
                        if (ent.GetName() == TEnt) {
                            PossibleSurroundingEnts = PossibleSurroundingEnts + 1
                        }
                    }
                }
                // If this is the best one so far, save it
                if (PossibleSurroundingEnts > BestSurrondingBoxEnt) {
                    BestSurrondingBoxEnt = PossibleSurroundingEnts
                    StartingBoxEnt = CurrentBoi
                }
            }
        }

        local RealPlayerSpawn = null
        if (StartingBoxEnt == null) {
            printl("No starting box ent found")
        } else {
            if (BestSurrondingBoxEnt > 0) {
                printl("Starting box ent found")
                // If we have found a solid starting box ent, lets find the closest one to it
                RealPlayerSpawn = Entities.FindByClassnameNearest("info_player_start", StartingBoxEnt.GetOrigin(), 650)
                if (RealPlayerSpawn == null) {
                    printl("No real player spawn found")
                } else {
                    printl("Real player spawn found")
                    local LandmarkCheck = Entities.FindByClassnameNearest("info_landmark_entry", RealPlayerSpawn.GetOrigin(), 128)
                    // If we have found a landmark, we know we are in the box
                    if (LandmarkCheck == null) {
                        printl("No landmark found")
                    } else {
                        printl("Landmark found")
                        printl("Found info player start!: " + RealPlayerSpawn.GetOrigin())
                        // If EVERY Condition is met, lets set the player spawn
                        if (GlobalSpawnClass.useautospawn == true) {
                            printl("useautospawn = True: Setting player spawn")
                            GlobalSpawnClass.useautospawn <- false
                            GlobalSpawnClass.usesetspawn <- true
                            GlobalSpawnClass.setspawn.position <- RealPlayerSpawn.GetOrigin()
                            GlobalSpawnClass.setspawn.radius <- 200
                            // Get Every Info Player Start And YEET It
                            local ent = null
                            while (ent = Entities.FindByClassname(ent, "info_player_start")) {
                                if (ent != RealPlayerSpawn) {
                                    printl("Found info player start that is not the real player spawn")
                                    ent.Destroy()
                                }
                            }
                        } else {
                            printl("useautospawn = False: Not setting player spawn")
                        }
                    }
                }
            } else {
                printl("Starting box ent found but not enough surrounding box ents")
            }
        }
    }
    if (MadeSpawnClass == false && GlobalSpawnClass.blue.spawnpoint.x == 0 && GlobalSpawnClass.blue.spawnpoint.y == 0) {

        // Setup Some Variables
        local ourclosest = 99999999
        local spawnmiddle = null
        local ent = null
        local FinalSpawnRed = Vector(0, 0, 0)
        local FinalRotationRed = Vector(0, 0, 0)
        local FinalSpawnBlue = Vector(0, 0, 0)
        local FinalRotationBlue = Vector(0, 0, 0)
        
        // Singlepayer Spawn Stuff
        
        // New Aperture
        if (Entities.FindByModel(null, "models/elevator/elevator_tube_opener.mdl")) {
            while (ent = Entities.FindByModel(ent, "models/elevator/elevator_tube_opener.mdl")) {
                local elevator = Entities.FindByName(null, "arrival_elevator-elevator_1")
                // get the nearest elevator
                local elevator_pos = elevator.GetOrigin()
                local ent_pos = ent.GetOrigin()

                local currentscore = elevator_pos - ent_pos
                currentscore = UnNegative(currentscore)
                printl(currentscore)
                currentscore = currentscore.x + currentscore.y + currentscore.z
                if (currentscore < ourclosest) {
                    ourclosest = currentscore
                    spawnmiddle = ent
                }
            }

            // // find the angle of the spawnpoint in xyz using cos
            local spawnmiddle_ang_vec = Entities.FindByName(null, "@arrival_teleport").GetForwardVector()
            local spawnmiddle_ang = Entities.FindByName(null, "@arrival_teleport").GetAngles()
            // local spawntracex = cos(spawnmiddle_ang.x) * sin(spawnmiddle_ang.y)
            // local spawntracey = sin(spawnmiddle_ang.x) * cos(spawnmiddle_ang.y)
            // printl(spawntracex)
            // printl(spawntracey)
            // spawntracex = spawntracex * 282.5
            // spawntracey = spawntracey * 282.5
            local hieght = 180

            spawnmiddle_ang_vec = spawnmiddle_ang_vec * 126.5

            printl(spawnmiddle_ang_vec)

            

            // now get the back front left and right spawnpoints
            local spawnfront = spawnmiddle.GetOrigin() + Vector(spawnmiddle_ang_vec.x, spawnmiddle_ang_vec.y, hieght)
            local spawnback = spawnmiddle.GetOrigin() + Vector(spawnmiddle_ang_vec.x/-1, spawnmiddle_ang_vec.y/-1, hieght)
            local spawnright = spawnmiddle.GetOrigin() + Vector(spawnmiddle_ang_vec.y, spawnmiddle_ang_vec.x/-1, hieght)
            local spawnleft = spawnmiddle.GetOrigin() + Vector(spawnmiddle_ang_vec.y/-1, spawnmiddle_ang_vec.x, hieght)
            printl("spawnMiddle: " + spawnmiddle)
            printl("spawnOrigin: " + spawnmiddle.GetOrigin())
            printl("ourClosest: " + ourclosest)
            
            // output the spawnpoints
            FinalRotationBlue = spawnmiddle_ang + Vector(0, 0, 0)
            FinalSpawnBlue = spawnright
            FinalRotationRed = spawnmiddle_ang + Vector(0, 0, 0)
            FinalSpawnRed = spawnleft 
        }

        // Old Aperture
        if (Entities.FindByModel(null, "models/props_underground/elevator_a.mdl")) {
            local elevator = Entities.FindByName(null, "@test_dome_lift_entry_teleport")
            local spawnmiddle = null
            // Find The Nearst Elevator To The point_teleport
            while (ent = Entities.FindByModel(ent, "models/props_underground/elevator_a.mdl")) {
                if (elevator == null) {
                    elevator = Entities.FindByClassname(null, "point_teleport")
                }
                // get the nearest elevator to the point_teleport
                local elevator_pos = elevator.GetOrigin()
                local ent_pos = ent.GetOrigin()

                local currentscore = elevator_pos - ent_pos
                currentscore = UnNegative(currentscore)
                printl(currentscore)
                currentscore = currentscore.x + currentscore.y + currentscore.z
                if (currentscore < ourclosest) {
                    ourclosest = currentscore
                    spawnmiddle = ent
                }
            }
            
            // Find the highest path track next to the spawnpoint
            local tallestpathtrack = null
            if (spawnmiddle == null) {
                printl("failed to find spawnmiddle")
            } else {
                local pathtracks = null
                while (pathtracks = Entities.FindByClassnameWithin(pathtracks, "path_track", spawnmiddle.GetOrigin(), 600)) {
                    printl("pathtracks: " + pathtracks)
                    if (tallestpathtrack == null) {
                        tallestpathtrack = pathtracks
                    } else {
                        if (tallestpathtrack.GetOrigin().z < pathtracks.GetOrigin().z) {
                            tallestpathtrack = pathtracks
                        }
                    }
                }
            }

            local extrah = 5

            // Set The Origin Of The Spawnpoint Middle
            local spawnpointmiddle = Vector(spawnmiddle.GetOrigin().x, spawnmiddle.GetOrigin().y, tallestpathtrack.GetOrigin().z)
            local spawnpointmiddle_ang_vec = elevator.GetForwardVector()
            local spawnpointmiddle_ang = elevator.GetAngles()

            // Set The Sides Of The Spawnpoint
            spawnpointmiddle_ang_vec = spawnpointmiddle_ang_vec *  100

            local spawnfront = spawnpointmiddle + Vector(spawnpointmiddle_ang_vec.x, spawnpointmiddle_ang_vec.y, extrah)
            local spawnback = spawnpointmiddle + Vector(spawnpointmiddle_ang_vec.x/-1, spawnpointmiddle_ang_vec.y/-1, extrah)
            local spawnright = spawnpointmiddle + Vector(spawnpointmiddle_ang_vec.y, spawnpointmiddle_ang_vec.x/-1, extrah)
            local spawnleft = spawnpointmiddle + Vector(spawnpointmiddle_ang_vec.y/-1, spawnpointmiddle_ang_vec.x, extrah)

            // Finalize The Spawnpoints
            FinalRotationBlue = spawnpointmiddle_ang
            FinalSpawnBlue = spawnright
            FinalRotationRed = spawnpointmiddle_ang
            FinalSpawnRed = spawnleft

        }

        // Override Parts Of The Global Spawn Class
        GlobalSpawnClass.blue.spawnpoint <- FinalSpawnBlue
        GlobalSpawnClass.blue.rotation <- FinalRotationBlue
        GlobalSpawnClass.red.spawnpoint <- FinalSpawnRed
        GlobalSpawnClass.red.rotation <- FinalRotationRed
        
        MadeSpawnClass <- true
        return GlobalSpawnClass
    } else {
        MadeSpawnClass <- true
        return GlobalSpawnClass
    }
}

function TeleportToSpawnPoint(p, SpawnClass) {
    if (SpawnClass == null) {
        SpawnClass = BestGuessSpawnpoint()
    }

    if (p.GetTeam() >= 3) {
        // Blue Team
        p.SetOrigin(SpawnClass.blue.spawnpoint)
        p.SetAngles(SpawnClass.blue.rotation.x, SpawnClass.blue.rotation.y, SpawnClass.blue.rotation.z)
        p.SetVelocity(SpawnClass.blue.velocity)
    } else {
        // Red Team
        p.SetOrigin(SpawnClass.red.spawnpoint)
        p.SetAngles(SpawnClass.red.rotation.x, SpawnClass.red.rotation.y, SpawnClass.red.rotation.z)
        p.SetVelocity(SpawnClass.red.velocity)
    }
}

function CombineList(list, startlength, inbetweenchars = " ") {
    local indx = -1
    local newstr = ""
    foreach (thing in list) {
        indx = indx + 1
        if (indx >= startlength) {
            newstr = newstr + thing + inbetweenchars
        }
    }
    return strip(newstr)
}

function CreateOurEntities() {
    measuremovement <- Entities.CreateByClassname("logic_measure_movement")
    measuremovement.__KeyValueFromString( "measuretype", "1")
    measuremovement.__KeyValueFromString( "measurereference", "" )
    measuremovement.__KeyValueFromString( "measureretarget", "" )
    measuremovement.__KeyValueFromString( "targetscale", "1.0" )
    // Movement Shit
    measuremovement.__KeyValueFromString( "targetname", "p232_logic_measure_movement" )
    measuremovement.__KeyValueFromString( "targetreference", "p232_logic_measure_movement" )
    measuremovement.__KeyValueFromString( "target", "p232_logic_measure_movement" )
    EntFireByHandle(measuremovement, "SetMeasureReference", "p232_logic_measure_movement", 0.0, null, null)
    EntFireByHandle(measuremovement, "enable", "", 0.0, null, null)

    nametagdisplay <- Entities.CreateByClassname("game_text")
    nametagdisplay.__KeyValueFromString("targetname", "p232nametagdisplay")
    nametagdisplay.__KeyValueFromString("x", "-1")
    nametagdisplay.__KeyValueFromString("y", "0.2")
    nametagdisplay.__KeyValueFromString("message", "Waiting for players...")
    //onscreendisplay.__KeyValueFromString("spawnflags", "1")
    nametagdisplay.__KeyValueFromString("holdtime", "0")
    nametagdisplay.__KeyValueFromString("fadeout", "0.1")
    nametagdisplay.__KeyValueFromString("fadein", "0.1")
    nametagdisplay.__KeyValueFromString("channel", "0")
    nametagdisplay.__KeyValueFromString("color", "60 200 60")

    // Create an on screen text message entity
    onscreendisplay <- Entities.CreateByClassname("game_text")
    onscreendisplay.__KeyValueFromString("targetname", "onscreendisplaympmod")
    onscreendisplay.__KeyValueFromString("message", "Waiting for players...")
    onscreendisplay.__KeyValueFromString("holdtime", (0.01 + TickSpeed * 2).tostring())
    onscreendisplay.__KeyValueFromString("fadeout", (0.01 + TickSpeed * 2).tostring())
    onscreendisplay.__KeyValueFromString("fadein", (0.01 + TickSpeed * 2).tostring())
    onscreendisplay.__KeyValueFromString("spawnflags", "1")
    onscreendisplay.__KeyValueFromString("color", "60 200 60")
    onscreendisplay.__KeyValueFromString("channel", "1")
    //onscreendisplay.__KeyValueFromString("x", "-1.1")
    //onscreendisplay.__KeyValueFromString("y", "-1.1")
    
    // dc message
    disconnectmessagedisplay <- Entities.CreateByClassname("game_text")
    disconnectmessagedisplay.__KeyValueFromString("targetname", "pdcm")
    disconnectmessagedisplay.__KeyValueFromString("holdtime", "3")
    disconnectmessagedisplay.__KeyValueFromString("fadeout", "0.2")
    disconnectmessagedisplay.__KeyValueFromString("fadein", "0.2")
    disconnectmessagedisplay.__KeyValueFromString("spawnflags", "1")
    disconnectmessagedisplay.__KeyValueFromString("color", "140 40 40")
    disconnectmessagedisplay.__KeyValueFromString("channel", "3")
    disconnectmessagedisplay.__KeyValueFromString("message", "Player disconnected")
    EntFireByHandle(disconnectmessagedisplay, "display", "", 0.0, null, null)

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

    // Create a player_speedmod entity
    playerspeedmod <- Entities.CreateByClassname("player_speedmod")
    playerspeedmod.__KeyValueFromString("targetname", "p232_player_speedmod")

    // Create an entity that sends a client command
    clientcommand <- Entities.CreateByClassname("point_clientcommand")
    clientcommand.__KeyValueFromString("targetname", "p232clientcommand")
}