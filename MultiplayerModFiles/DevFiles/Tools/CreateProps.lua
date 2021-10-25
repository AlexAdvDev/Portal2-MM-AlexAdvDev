file.Delete("GeneratedPortal2ObjectOutput.txt")
file.Write("GeneratedPortal2ObjectOutput.txt", "")

function GenerateLine(StringDataInput)
    print(StringDataInput)
    file.Append("GeneratedPortal2ObjectOutput.txt", "\n" .. StringDataInput)
end

TeleportInputNode = "models/hunter/blocks/cube1x1x1.mdl"
TeleportOutputNode = "models/maxofs2d/hover_basic.mdl"

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

    if (LoopAmount == 2) then
        GenerateLine("")
        GenerateLine("")
        GenerateLine("    if (LoopTime==true) {")
        GenerateLine("        // Generated Teleports")
        GenerateLine("")
    end

    for k, prop in ipairs(ents.FindByClass("prop_*")) do
        if (!prop:CreatedByMap() && prop:GetClass() ~= "prop_effect" && prop:GetMaterial() ~= "phoenix_storms/stripes") then

            -- reset varibles
            PropType = "prop_dynamic"
            PropCords = prop:GetPos()
            PropModel = prop:GetModel()
            PropAngles = prop:GetAngles()
            PropOutputName = MapName .. "_custom_prop_" .. k
            ContinueModelCache = true
            PropCollisionNumber = 6
            PropEnableDraw = true
            AvragedScale = 1
            AvragingOperation1 = 1
            OutputScale = 1
            PropColor = tostring(prop:GetColor())

            -- store the size of the prop
            for i=0, prop:GetBoneCount() do
                AvragingOperation1 = prop:GetManipulateBoneScale(i).x + prop:GetManipulateBoneScale(i).y + prop:GetManipulateBoneScale(i).z
                AvragedScale = AvragingOperation1 / 3
                OutputScale = AvragedScale
            end

            -- if the prop has no collision store that
            if (prop:GetCollisionGroup() == 20) then
                PropCollisionNumber = 0
            end

            -- if the prop is no drawed store that
            if(prop:GetMaterial() == "models/wireframe") then
                PropEnableDraw = false
            end

            -- if the prop has physics store that
            if (prop:GetClass() == "prop_physics" && prop:GetPhysicsObject():IsMotionEnabled()) then
                PropType = "prop_physics"
            end

            -- print out generated code
            if (PropModel~=TeleportInputNode && PropModel~=TeleportOutputNode) then
                -- cache code
                -- if the current model has been cached do not continue
                if (LoopAmount == 0) then
                    for k, Model in ipairs(CachedModels) do
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
                    -- if the prop is not drawed disable it
                    if (PropEnableDraw == false) then
                        GenerateLine("        " .. "EntFireByHandle(" .. PropOutputName .. ', "disabledraw", "", 0, null, null)')
                    end
                    -- if the prop has a scale then scale it
                    if (OutputScale ~= 1) then
                        GenerateLine("        " .. "EntFireByHandle(" .. PropOutputName .. ', "addoutput", "modelscale ' .. OutputScale .. '", 0, null, null)')
                    end
                    -- if the prop has a stored color then apply it
                    if (PropColor ~= "255 255 255 255") then
                        GenerateLine("        " .. "EntFireByHandle(" .. PropOutputName .. ', "color", "' .. PropColor .. '", 0, null, null)')
                    end
                    GenerateLine("")
                end
            end

            if (LoopAmount == 2) then


                -- make teleport nodes and output nodes
                if (PropModel==TeleportInputNode) then
                    -- create teleport node if model is a teleport node
                    for k, prop2 in ipairs(ents.FindByModel(TeleportOutputNode)) do
                        if (prop:GetColor() == prop2:GetColor()) then
                            -- write out mixed premade code with teleport node properties
                            GenerateLine("     local p = null")
                            GenerateLine('     while (p = Entities.FindByClassnameWithin(p, "player", Vector(' .. PropCords.x .. ", " .. PropCords.y .. ", " .. PropCords.z .. '), ' .. OutputScale * 20 .. ')) {')
                            GenerateLine("         p.SetOrigin(Vector(" .. prop2:GetPos().x .. ", " .. prop2:GetPos().y .. ", " .. prop2:GetPos().z .. "))")
                            GenerateLine("     }")
                        end
                    end
                end
            end
        end
    end

    -- add end caching code
    if (LoopAmount == 0) then
        GenerateLine("        DoneCacheing <- true")
    end

    -- end if looped twice
    if (LoopAmount == 2) then
        Loop = false
    end

    GenerateLine("  }")

    LoopAmount = LoopAmount + 1
end

GenerateLine("}")