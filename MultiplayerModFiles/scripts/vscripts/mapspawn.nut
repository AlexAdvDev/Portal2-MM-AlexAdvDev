//********************************************************************************************
//MAPSPAWN.nut is called on newgame or transitions
//********************************************************************************************
CheatsOff <- 0
ReadyCheatsOff <- 0
PlayerJoined <- 0
PlayerID <- 0
GBIsMultiplayer <- 0
ReadyForCustomTargets <- 0
DedicatedServerOneTimeRun <- 1
TryGelocity <- 1
GelocityOneTimeRun <- 1

//Is Dedicated Server
DedicatedServer <- 0

function init(){
    jmessage <- Entities.CreateByClassname("env_instructor_hint")
    timer <- Entities.CreateByClassname("logic_timer");
    timer.__KeyValueFromString("targetname", "timer");
    EntFireByHandle(timer, "AddOutput", "RefireTime 0.1", 0, null, null);
    EntFireByHandle(timer, "AddOutput", "classname move_rope", 0, null, null);
    EntFireByHandle(timer, "AddOutput", "OnTimer worldspawn:RunScriptCode:SetColor():0:-1", 0, null, null);
    EntFireByHandle(timer, "Enable", "", 0.1, null, null);
    //Create An Entity That Sends A Client Command
    clientcommand <- Entities.CreateByClassname("point_clientcommand");
    //Run Lobby Code
    if (GetMapName()=="mp_coop_lobby_3") {
        LobbyOneTimeRun()
    }
}

try {
    if ( ::IsMultiplayer() ){
        GBIsMultiplayer <- 1
    }
} catch(exception) {
    GBIsMultiplayer <- 0
}

if (GBIsMultiplayer==1) {
//Multiplayer Code

SetColor <- function(){
    local p = null;
    while (p = Entities.FindByClassname(p, "player")){
        loop()
        if (p.ValidateScriptScope()){
            local script_scope = p.GetScriptScope();
            if (!("Colored" in script_scope)){
                PlayerID <- p.GetRootMoveParent()
                PlayerID <- PlayerID.entindex()
                PlayerJoined <- 1
                local coj = "Player " + PlayerID + " Joined The Game"
                coj = coj.tostring()
                PID <- "player" + PlayerID
                PID <- PID.tostring()
                //Say Join Message
                SendToConsole("gameinstructor_enable 1")
                EntFireByHandle(clientcommand, "Command", "gameinstructor_enable 1", 0, p, p)
                jmessage.__KeyValueFromString("hint_icon_onscreen", "icon_caution");
                jmessage.__KeyValueFromString("targetname", "jmessagetarget");
                jmessage.__KeyValueFromString("hint_caption", coj);
                jmessage.__KeyValueFromString("hint_color", "255 200 0");
                jmessage.__KeyValueFromString("hint_timeout", "3");
                DoEntFire("jmessagetarget", "showhint", "", 0.0, null, p)
                printl("Player " + PlayerID + " Joined The Game")
                //Assign Playerdata
                if (ReadyForCustomTargets == 1) {
                    p.__KeyValueFromString("targetname", PID);
                //VeiwControl Teleport
                }
                //Set Random Color If Over 16
                if (PlayerID != 1) {
                    R <- RandomInt(0, 255), G <- RandomInt(0, 255), B <- RandomInt(0, 255);
                    ReadyCheatsOff <- 1
                }
                //Set Preset Colors Up To 16
                if (PlayerID == 1) {
                    R <- 255, G <- 255,  B <- 255;
                }
                if (PlayerID == 2) {
                    R <- 180, G <- 255,  B <- 180;
                    ReadyForCustomTargets <- 1
                }
                if (PlayerID == 3) {
                    R <- 120, G <- 140,  B <- 255;
                }
                if (PlayerID == 4) {
                    R <- 255, G <- 170,  B <- 120;
                }
                if (PlayerID == 5) {
                    R <- 255, G <- 100,  B <- 100;
                }
                if (PlayerID == 6) {
                    R <- 255, G <- 180,  B <- 255;
                }
                if (PlayerID == 7) {
                    R <- 255, G <- 255,  B <- 180;
                }
                if (PlayerID == 8) {
                    R <- 0, G <- 255,  B <- 240;
                }
                if (PlayerID == 9) {
                    R <- 75, G <- 75,  B <- 75;
                }
                if (PlayerID == 10) {
                    R <- 120, G <- 155,  B <- 25;
                }
                if (PlayerID == 11) {
                    R <- 0, G <- 80,  B <- 100;
                }
                if (PlayerID == 12) {
                    R <- 100, G <- 80,  B <- 0;
                }
                if (PlayerID == 13) {
                    R <- 0, G <- 0,  B <- 100;
                }
                if (PlayerID == 14) {
                    R <- 80, G <- 0,  B <- 0;
                }
                if (PlayerID == 15) {
                    R <- 0, G <- 75,  B <- 0;
                }
                if (PlayerID == 16) {
                    R <- 0, G <- 75,  B <- 75;
                }
                script_scope.Colored <- true;
                EntFireByHandle(p, "Color", (R+" "+G+" "+B), 0, null, null);
                return
            }
        }
    }
}


function loop() {
//Run All Required Loops
    if (GetMapName()=="mp_coop_lobby_3") {
        ArtTherapyLobby()
    }
    //Run Credits Code
    if (GetMapName()=="mp_coop_credits") {
        CreditsLoop()
    }
    //Run Gelocity Code 
    //=========================
    if (TryGelocity==1) {
        try {
            if (GetMapName().slice(28,50)=="mp_coop_gelocity_1_v02") {
                Gelocity()
            }
        } catch(exception) {
            printl("Map Not Gelocity 1 Handling")
            TryGelocity<-0
        }
    }
    //=========================
    //Run Dedicated Server Code
    if (DedicatedServer==1) {
        DedicatedServerFunc()
    }
//Disable Collision
    //local j = "solid ";
	local k = "CollisionGroup ";
	//EntFire("player", "addoutput", j+4);
	EntFire("player", "addoutput", k+2);
    
//sv_cheats 0
    //check if ready to turn cheats off
    if (ReadyCheatsOff==1) {
        if (CheatsOff==0) {
            //SendToConsole("sv_cheats 0")
            CheatsOff <- 1
        }
    }

//r_portal_fastpath 0 Fix
    local p = null;
    while (PlayerJoined==1) {
        while (p = Entities.FindByClassname(p, "player")) {
            EntFireByHandle(clientcommand, "Command", "r_portal_fastpath 0", 0, p, p)
            PlayerJoined <- 0
        }
    } 
}

//Lobby setup code
function LobbyOneTimeRun() {
//Remove Entities
    //Fix Edicts Error
    local ent = null;
    while(ent = Entities.FindByClassname(ent, "func_portal_bumper"))
    {
        ent.Destroy() // 165 entities removed
    }
    
//Fix Art Therapy Tube Glitches
    Entities.FindByName(null,"dlc_room_fall_push_right").Destroy()
    Entities.FindByName(null,"dlc_room_fall_push_left").Destroy()

//Fix Track 5
    //Entry Door Fix
    Entities.FindByName(null,"track5-door_paint-trigger_hurt_door").Destroy()
    Entities.FindByName(null,"track5-door_paint-collide_door").Destroy()
    //Light Fix
    Entities.FindByName(null,"@light_shadowed_paintroom").Destroy()
    //Door Remover
        //Orange Exit Door
    local ent = null;
    while(ent = Entities.FindByName(ent, "track5-orangeiris_door_elevator_pit"))
    {
        ent.Destroy()
    }
    Entities.FindByName(null,"track5-orangeescape_elevator_clip").Destroy()
        //Blue Exit Door
    local ent = null;
    while(ent = Entities.FindByName(ent, "track5-iris_door_elevator_pit"))
    {
        ent.Destroy()
    }
    Entities.FindByName(null,"track5-escape_elevator_clip").Destroy()

}

function ArtTherapyLobby() {
//Art Therapy Left Chute Enabler
    local vectorEEL;
    vectorEEL = Vector(5727, 3336, -441);
    local EELent = null;
    while(EELent = Entities.FindByClassnameWithin(EELent, "player", vectorEEL, 12)) 
    {
        printl("Enabled Left Chute")
        local LCatEn = null;
        while(LCatEn = Entities.FindByName(LCatEn, "left-enable_cats")) {
            DoEntFire("!self", "enable", "", 0.0, null, LCatEn) 
            DoEntFire("!self", "trigger", "", 0.0, null, LCatEn) 
        }
    } 
//Art Therapy Left Chute Teleporter
    local vectorLCT;
    vectorLCT = Vector(5729, 3336, 1005);
    local LCTent = null;
    while(LCTent = Entities.FindByClassnameWithin(LCTent, "player", vectorLCT, 30)) {
        printl("Teleported Player To Art Therapy")
        LCTent.SetOrigin(Vector(3194, -1069, 1676))
        LCTent.SetAngles(0, 0, 0)
    }
//Art Therapy Right Chute Enabler
    local vectorEER;
    vectorEER = Vector(5727, 3192, -441);
    local EERent = null;
    while(EERent = Entities.FindByClassnameWithin(EERent, "player", vectorEER, 12)) 
    {
        printl("Enabled Left Chute")
        local RCatEn = null;
        while(RCatEn = Entities.FindByName(RCatEn, "right-enable_cats")) {
            DoEntFire("!self", "enable", "", 0.0, null, RCatEn) 
            DoEntFire("!self", "trigger", "", 0.0, null, RCatEn) 
        }
    } 
//Art Therapy Right Chute Teleporter
    local vectorRCT;
    vectorRCT = Vector(5727, 3180, 1005);
    local RCTent = null;
    while(RCTent = Entities.FindByClassnameWithin(RCTent, "player", vectorRCT, 30)) {
        printl("Teleported Player To Art Therapy")
        RCTent.SetOrigin(Vector(3191, -1228, 1682))
        RCTent.SetAngles(0, 0, 0)
    }
//Disable Art Therapy Chutes
    local vectorE;
    vectorE = Vector(3201, -1152, 1272);
    local Aent = null;
    while(Aent = Entities.FindByClassnameWithin(Aent, "player", vectorE, 150)) 
    {
        local LCatDis = null;
        while(LCatDis = Entities.FindByName(LCatDis, "left-disable_cats")) {
        printl("Disabled Right Chute")
            DoEntFire("!self", "enable", "", 0.0, null, LCatDis) 
            DoEntFire("!self", "trigger", "", 0.0, null, LCatDis)
        }
        local RCatDis = null;
        while(RCatDis = Entities.FindByName(RCatDis, "right-disable_cats")) {
            printl("Disabled Right Chute")
            DoEntFire("!self", "enable", "", 0.0, null, RCatDis) 
            DoEntFire("!self", "trigger", "", 0.0, null, RCatDis)
        }
    }   
//Teleport Exiting Player Out Of Art Therapy
    local vectorEx;
    vectorEx = Vector(3584, -1669, 466);
    local AEent = null;
    while(AEent = Entities.FindByClassnameWithin(AEent, "player", vectorEx, 30)) 
    {
        AEent.SetOrigin(Vector(3919, 3352, 158))
    } 
}

//Gelocity 1 Code
function Gelocity() {
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door2_player2"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door2_player1"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"start_clip_1"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"start_clip_2"))
    if (GelocityOneTimeRun==1) {
        local ent = null;
        //Remove Entities
        while(ent = Entities.FindByClassname(ent, "func_portal_bumper"))
        {
            ent.Destroy() // 20 entities removed
        }
        while(ent = Entities.FindByClassname(ent, "beam_spotlight"))
        {
            ent.Destroy() // 85 entities removed
        }
        printl("Portal 2 Multiplayer Mod: Removed 20 Portal Bumpers")
        GelocityOneTimeRun <- 0
    }
}

//Dedicated Server Code
function DedicatedServerFunc() {
    if (DedicatedServerOneTimeRun==1) {
        if (GetMapName() == "mp_coop_lobby_3") {
            Entities.FindByName(null,"brush_spawn_blocker_red").Destroy()
            //Enable Team Building Course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_teambuilding"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_teambuilding"))
            //Enable TBeam Course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_tbeam"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_tbeam"))
            //Enable Paint Course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_paint"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_paint"))
            //Enable Fling Course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_fling"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_fling"))
            //Enable Extra Course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_extra"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_extra"))
            //Enable All Finished Course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_all_finished"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_all_finished"))
            //Enable Music
            DoEntFire("!self", "invalue", "7", 0.0, null, Entities.FindByName(null,"@music_lobby_7"))
        }
        DedicatedServerOneTimeRun <- 0
    }

    local p = null;
    while (p = Entities.FindByClassname(p, "player")) {
        if (p.entindex()==1) {
            p.SetOrigin(Vector(69420,69420,69420))
            SendToConsole("exec DedicatedServerCommands")
        }
    }
}

//==================================
//             CREDITS
//==================================

//Replace Females With Pbodys
function CreditsSetModelPB(ent) {
    //Count How Many Times A Credit Comes On Screen So We Can Change To Humans
    MPMCredits <- MPMCredits + 1
    //Set Model
    ent.SetModel("models/player/eggbot/eggbot.mdl")
    //Set Color
    EntFireByHandle(ent, "Color", (RandomInt(0, 255)+" "+RandomInt(0, 255)+" "+RandomInt(0, 255)), 0, null, null);
    //Set Position
    ent.SetOrigin(Vector(0, 0, 10))
    //Set Animation
    EntFireByHandle(ent, "setanimation", AnimationsPB[RandomInt(0, CRAnimationTimesPB)], 0, null, null)
}

//Replace Males With Atlases
function CreditsSetModelAL(ent) {
    //Count How Many Times A Credit Comes On Screen So We Can Change To Humans
    MPMCredits <- MPMCredits + 1
    //Set Model
    ent.SetModel("models/player/ballbot/ballbot.mdl")
    //Set Color
    EntFireByHandle(ent, "Color", (RandomInt(0, 255)+" "+RandomInt(0, 255)+" "+RandomInt(0, 255)), 0, null, null);
    //Set Position
    ent.SetOrigin(Vector(-2, 0, 7.5))
    //Set Animation
    EntFireByHandle(ent, "setanimation", AnimationsAL[RandomInt(0, CRAnimationTimesAL)], 0, null, null)
}

function CreditsLoop() {
//If 51 Credits Haven't Passed Change Humans To Robots
if (MPMCredits<=51) {
    //Change Males To Atlases
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male.mdl")) {
        CreditsSetModelAL(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male01.mdl")) {
        CreditsSetModelAL(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male_02.mdl")) {
        CreditsSetModelAL(ent)
    }
    //Change Females To Pbodys
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_01.mdl")) {
        CreditsSetModelPB(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_02.mdl")) {
        CreditsSetModelPB(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_03.mdl")) {
        CreditsSetModelPB(ent)
    }
    }
}

//Credits One Time Run Code
if (GetMapName() == "mp_coop_credits") {
    //Set Credits Animations
    //Pbody Animations
    AnimationsPB <- ["taunt_laugh", "portalgun_jump_spring", "portalgun_thrash_fall", "taunt_teamhug_idle", "noGun_crouch_idle", "portalgun_tractorbeam_float", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "noGun_airwalk", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]
    //Pbody Animation Count
    CRAnimationTimesPB <- -1
    //Atlas Animations
    AnimationsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "portalgun_jump_spring", "portalgun_thrash_fall", "noGun_crouch_idle", "portalgun_tractorbeam_float", "noGun_airwalk"]
    //Atlas Animation Count
    CRAnimationTimesAL <- -1
    //Credit Run counter
    MPMCredits <- 0
    //Set The Amount Of PBody Animations
    foreach (value in AnimationsPB) {
        CRAnimationTimesPB <- CRAnimationTimesPB + 1
    }
    //Set The Amount Of Atlas Animations
    foreach (value in AnimationsAL) {
        CRAnimationTimesAL <- CRAnimationTimesAL + 1
    }
    //Add Teams Name To Credits
    AddCoopCreditsName("Portal 2 Multiplayer Mod: Credits")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("Multiplayer Mod: Team")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("kyleraykbs | Scripting + Team Lead")
    AddCoopCreditsName("Bumpy | Scripting + Script Theory")
    AddCoopCreditsName("Vista | Reverse Engineering")
    AddCoopCreditsName("Wolfe Strider Shooter | Scripting")
    AddCoopCreditsName("Nanoman2525 | Mapping + Entity Help")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("Multiplayer Mod: Contributers")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("Darnias | Jumpstarter Code")
    AddCoopCreditsName("The Pineapple | Hamachi support")
    AddCoopCreditsName("SlingEXE | Optimisations")
    AddCoopCreditsName("Blub/Vecc | Code Cleanup + Commenting")
    AddCoopCreditsName("AngelPuzzle | Translations")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("Multiplayer Mod: Special Thanks")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("MicrosoftWindows")
    AddCoopCreditsName("sear")
    AddCoopCreditsName("Trico_Everfire")
    AddCoopCreditsName("Brawler")
    AddCoopCreditsName("iambread")
    AddCoopCreditsName("hulkstar")
    AddCoopCreditsName("neck")
    AddCoopCreditsName("Sheuron")
    AddCoopCreditsName("SuperSpeed")
    AddCoopCreditsName("goldengamer")
    AddCoopCreditsName("JDWMGB")
    AddCoopCreditsName("Portalboy")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("And my supportive group of friends!")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("")
    AddCoopCreditsName("Nick/KingKong")
    AddCoopCreditsName("Latte/Luna")
    AddCoopCreditsName("Craig is love Craig is life | WOLF BATTLER ")
    AddCoopCreditsName("Bunger from Bugsnax | Ayden")
    AddCoopCreditsName("Bananabread | KaiserInfinitus")
    AddCoopCreditsName("Jazzy/jasmine")
    AddCoopCreditsName("David/Mr. E")
    AddCoopCreditsName("")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("Thank you all so so much!!!")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("")
    AddCoopCreditsName("")
    AddCoopCreditsName("--------------------------")
    AddCoopCreditsName("Valve: Credits")
    AddCoopCreditsName("--------------------------")
}

//Run init Code
Entities.First().ConnectOutput("OnUser1", "init");
DoEntFire("worldspawn", "FireUser1", "", 0.0, null, null);

//Singleplayer Code
} else {
printl("Playing Map In Single Player [Multiplayer Mod Disabled]")
GlobalRunSingleplayer <- 1

SetColor <- function(){
    local p = null;
    while (p = Entities.FindByClassname(p, "player")){
        if (p.ValidateScriptScope()){
            local script_scope = p.GetScriptScope();
            if (GlobalRunSingleplayer==1){
                SendToConsole("script_execute singleplayer")
                GlobalRunSingleplayer <- 0
                return
            }
        }
    }
}
}