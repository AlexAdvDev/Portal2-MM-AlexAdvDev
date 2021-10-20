file.Delete( "GeneratedPortal2ObjectOutput.txt" )
file.Write( "GeneratedPortal2ObjectOutput.txt", "" )

function GenerateLine(StringDataInput)
    print(StringDataInput)
    file.Append("GeneratedPortal2ObjectOutput.txt", "\n" .. StringDataInput )
end

PropType = ""
PropCords = Vector (0, 0, 0)
PropAngles = Vector (0, 0, 0)
PropModel = ""
PropOutputName = ""
LoopAmount = 0
Loop = true
MapName = game.GetMap()
CachedModels = {}
ContinueModelCache = true

LineAmount = MapName:len() + 19
Line = ""

while (LineAmount ~= 0) do
    Line = Line.."="
    LineAmount = LineAmount - 1
end

GenerateLine("//"..Line.."//")
GenerateLine("//CREATE OBJECTS FOR " .. MapName .. "//")
GenerateLine("//"..Line.."//")
GenerateLine("")

GenerateLine('if (GetMapName() == "' .. MapName .. '") {')

while (Loop == true) do 

    if (LoopAmount == 0) then
        GenerateLine("    if (CacheTime==true) {")
        GenerateLine("        // Cache Objects")
        GenerateLine("")
    end

    if (LoopAmount == 1) then
        GenerateLine("")
        GenerateLine("")
        GenerateLine("    if (CreateTime==true) {")
        GenerateLine("        // Create Objects")
        GenerateLine("")
    end

    for k, prop in ipairs( ents.FindByClass( "prop_*" ) ) do
        if (!prop:CreatedByMap() && prop:GetClass() ~= "prop_effect") then
        
            -- reset varibles
            PropType = "prop_dynamic"
            PropCords = prop:GetPos()
            PropModel = prop:GetModel()
            PropAngles = prop:GetAngles()
            PropOutputName = MapName .. "_custom_prop_" .. k
            ContinueModelCache = true
            PropCollisionNumber = 6

            if (prop:GetCollisionGroup() == 20) then
                PropCollisionNumber = 0
            end

            -- if the prop has physics store that
            if (prop:GetClass() == "prop_physics" && prop:GetPhysicsObject():IsMotionEnabled()) then
                PropType = "prop_physics"
            end

            -- print out generated code
            -- cache code
            -- if the current model has been cached do not continue
            if (LoopAmount == 0) then
                for k, Model in ipairs( CachedModels ) do
                    if (Model==PropModel) then
                        ContinueModelCache = false
                    end
                end
                
                -- if uncached cache model
                if (ContinueModelCache == true) then
                    table.insert(CachedModels, PropModel)
                    GenerateLine('        CacheModel("' .. PropModel:sub(8) .. '")')
                    GenerateLine("")
                end
            end
            --create code
            if (LoopAmount == 1) then
                GenerateLine("        local " .. PropOutputName .. ' = CreateProp("' .. PropType .. '", Vector(' .. PropCords.x .. ", " .. PropCords.y .. ", " .. PropCords.z .. '), "' .. PropModel .. '", 0)')
                GenerateLine("        " .. PropOutputName .. ".SetAngles(" .. PropAngles.x .. ", " .. PropAngles.y .. ", " .. PropAngles.z .. ")")
                GenerateLine("        " .. PropOutputName .. '.__KeyValueFromString("solid", "'..PropCollisionNumber..'")')
                GenerateLine("        " .. PropOutputName .. '.__KeyValueFromString("targetname", "genericcustomprop")')
                GenerateLine("")
            end

        end
    end

    -- add end caching code
    if (LoopAmount == 0) then
        GenerateLine("        DoneCacheing <- true")
    end

    -- end if looped twice
    if (LoopAmount == 1) then
        Loop = false
    end

    GenerateLine("    }")

    LoopAmount = LoopAmount + 1
end

GenerateLine("}")

-- modelnumber32
-- modelnumber32.__KeyValueFromString("targetname", "genericcustomprop")
