local l_AssetService_0 = game:GetService("AssetService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Controllers_0 = l_ReplicatedStorage_0.Controllers;
local _ = require(l_Controllers_0.PlayerController);
local l_Datas_0 = l_ReplicatedStorage_0.Datas;
local v8 = require(l_Datas_0.Mutations);
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v10 = require(l_Packages_0.Observers);
local _ = require(l_Packages_0.Signal);
local v12 = require(l_Packages_0.Trove);
local v13 = require(l_Packages_0.FFlags);
local v14 = require(script.SyncAnimators);
local v15 = require(script.CloneAsModel);
local v16 = require(script.ObserveDescendants);
local v17 = require(script.RainbowTextures);
local l_EnumItems_0 = Enum.NormalId:GetEnumItems();
local v19 = {
    FAST_RAINBOW_ENABLED = true, 
    LOW_QUALITY_LEVEL = Enum.SavedQualitySetting.QualityLevel6.Value, 
    POSITION_UPDATE_INTERVAL_LQ = 1, 
    POSITION_UPDATE_INTERVAL_HQ = 0.5, 
    MAX_INVALIDATIONS_PER_FRAME_LQ = 8, 
    MAX_INVALIDATIONS_PER_FRAME_HQ = 16, 
    CAMERA_FACING_TOLERANCE = 0.20943951023931956, 
    NO_FAST_RAINBOW_ANIMALS = {
        "Burrito Bandito"
    }
};
local l_GameSettings_0 = UserSettings().GameSettings;
local _ = v8.Rainbow;
local l_MutationSurfaces_0 = l_ReplicatedStorage_0.MutationSurfaces;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v25 = {
    CornerWedgePart = true, 
    Part = true, 
    MeshPart = true, 
    WedgePart = true, 
    PartOperation = true, 
    UnionOperation = true, 
    NegateOperation = true, 
    IntersectOperation = true
};
local v26 = table.clone(v25);
v26.ParticleEmitter = true;
v26.Beam = true;
v26.SurfaceAppearance = true;
local v27 = {};
local v28 = {};
local v29 = "LQ";
local v30 = {};
local function v31() --[[ Line: 135 ]] --[[ Name: noop ]]

end;
local function _(v32) --[[ Line: 137 ]] --[[ Name: getConfig ]]
    -- upvalues: v19 (copy), v29 (ref)
    return v19[("%*_%*"):format(v32, v29)] or v19[v32];
end;
local function v38() --[[ Line: 141 ]] --[[ Name: bindFFlags ]]
    -- upvalues: v19 (copy), v13 (copy)
    for v34, v35 in (table.clone(v19)) do
        local v36 = ("FastRainbow.%*"):format(v34);
        v19[v34] = v13:GetInstant(v36, v35);
        v13:OnChange(v36, function(v37) --[[ Line: 147 ]]
            -- upvalues: v19 (ref), v34 (copy)
            v19[v34] = v37;
        end);
    end;
end;
local function v47(v39, v40) --[[ Line: 153 ]] --[[ Name: registerRainbowTextureAsync ]]
    -- upvalues: v28 (copy), l_AssetService_0 (copy)
    local v41 = {
        lastUpdate = 0, 
        updateInterval = 0, 
        imageBuffer = v39
    };
    table.insert(v28, v41);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 163 ]]
        -- upvalues: l_AssetService_0 (ref), v40 (copy)
        return l_AssetService_0:CreateEditableImage({
            Size = v40
        });
    end);
    if not l_status_0 or not l_result_0 then
        warn("failed to register optimised rainbow texture:", l_result_0);
        return nil;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 174 ]]
            -- upvalues: l_result_0 (copy)
            local l_Texture_0 = Instance.new("Texture");
            l_Texture_0.Name = "TintTexture";
            l_Texture_0.ColorMapContent = Content.fromObject(l_result_0);
            return l_Texture_0;
        end);
        if not l_status_1 or not l_result_1 then
            warn("failed to register :", l_result_1);
            return nil;
        else
            v41.editable = l_result_0;
            v41.surfaceAppearance = l_result_1;
            l_result_0:WritePixelsBuffer(Vector2.zero, v40, v39);
            return l_result_1, l_result_0;
        end;
    end;
end;
local function _(v48, v49) --[[ Line: 194 ]] --[[ Name: useDefaultColoring ]]
    table.insert(v48, v49);
    return function() --[[ Line: 196 ]]
        -- upvalues: v48 (copy), v49 (copy)
        table.remove(v48, table.find(v48, v49));
    end;
end;
v30.Start = function(_) --[[ Line: 201 ]] --[[ Name: Start ]]
    -- upvalues: v38 (copy), v47 (copy), v17 (copy), l_AssetService_0 (copy), l_MutationSurfaces_0 (copy), v19 (copy), v29 (ref), l_EnumItems_0 (copy), v10 (copy), v12 (copy), v31 (copy), v16 (copy), v26 (copy), v25 (copy), v15 (copy), v14 (copy), l_RunService_0 (copy), v27 (copy), v13 (copy), l_LocalPlayer_0 (copy), l_CurrentCamera_0 (copy), v28 (copy), l_UserInputService_0 (copy), l_GameSettings_0 (copy)
    v38();
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 208 ]]
        -- upvalues: v52 (ref), v53 (ref), v47 (ref), v17 (ref), v54 (ref), v55 (ref), v56 (ref), l_AssetService_0 (ref)
        local v57, v58 = v47(v17.solid, Vector2.one);
        v52 = v57;
        v53 = v58;
        assert(v52);
        v57, v58 = v47(v17.stud, Vector2.new(64, 64));
        v54 = v57;
        v55 = v58;
        assert(v55);
        v57 = Vector2.zero;
        v58 = v55.Size;
        v56 = l_AssetService_0:CreateEditableImage({
            Size = v55.Size
        });
        v56:DrawImage(Vector2.zero, v55, Enum.ImageCombineType.Overwrite);
    end);
    if not l_status_2 then
        warn((("cannot use FastRainbow optimisation because: %*"):format(l_result_2)));
    end;
    local function _(v61, v62) --[[ Line: 227 ]] --[[ Name: getRainbowTextureForMaterial ]]
        -- upvalues: v54 (ref), v52 (ref)
        if v62 == "Custom Stud" then
            return v54;
        elseif v61 == Enum.Material.SmoothPlastic and v62 == "" then
            return v54;
        elseif v61 == Enum.Material.Plastic then
            return v52;
        elseif v61 == Enum.Material.Neon then
            return v52;
        else
            return nil;
        end;
    end;
    local v105 = {
        MeshPart = function(v64, v65, v66) --[[ Line: 239 ]] --[[ Name: MeshPart ]]
            -- upvalues: l_MutationSurfaces_0 (ref), v19 (ref), v29 (ref), l_status_2 (copy), v54 (ref), v52 (ref), l_EnumItems_0 (ref)
            if v66.Transparency == 1 then
                return;
            else
                local l_SurfaceAppearance_0 = v66:FindFirstChildOfClass("SurfaceAppearance");
                if l_SurfaceAppearance_0 then
                    local l_v66_FirstAncestorOfClass_0 = v66:FindFirstAncestorOfClass("Model");
                    local v69 = l_v66_FirstAncestorOfClass_0 and l_MutationSurfaces_0:FindFirstChild(l_v66_FirstAncestorOfClass_0.Name);
                    do
                        local l_v69_0 = v69;
                        if l_v69_0 then
                            l_v69_0 = l_v69_0:Clone();
                            l_v69_0:AddTag("__rainbow_managed");
                            l_v69_0.Parent = v66;
                            local l_l_SurfaceAppearance_0_0 = l_SurfaceAppearance_0;
                            l_l_SurfaceAppearance_0_0.Parent = l_v69_0;
                            local l_l_l_SurfaceAppearance_0_0_0 = l_l_SurfaceAppearance_0_0 --[[ copy: 6 -> 15 ]];
                            v65:Add(function() --[[ Line: 257 ]]
                                -- upvalues: l_l_l_SurfaceAppearance_0_0_0 (copy), v66 (copy), l_v69_0 (ref)
                                if l_l_l_SurfaceAppearance_0_0_0.Parent ~= nil then
                                    l_l_l_SurfaceAppearance_0_0_0.Parent = v66;
                                end;
                                l_v69_0:Destroy();
                            end);
                            l_SurfaceAppearance_0 = l_v69_0;
                        end;
                    end;
                end;
                if (v19[("FAST_RAINBOW_ENABLED_%*"):format(v29)] or v19.FAST_RAINBOW_ENABLED) and l_status_2 and v64.fastRainbow then
                    if l_SurfaceAppearance_0 then
                        local v73 = v64.addToSubFastCluster(v65, v66);
                        if not v73 then
                            v64.optOutOfFastRainbow();
                            return;
                        else
                            local l_SurfaceAppearance_1 = v73:FindFirstChildOfClass("SurfaceAppearance");
                            assert(l_SurfaceAppearance_1);
                            local function v75() --[[ Line: 283 ]] --[[ Name: updateTransparency ]]
                                -- upvalues: v73 (copy), v66 (copy)
                                v73.Transparency = v66.Transparency;
                            end;
                            v73.Transparency = v66.Transparency;
                            v65:Add(v66:GetPropertyChangedSignal("Transparency"):Connect(v75));
                            v66.LocalTransparencyModifier = 1;
                            table.insert(v64.colorInstances, l_SurfaceAppearance_1);
                            v65:Add(function() --[[ Line: 293 ]]
                                -- upvalues: v66 (copy), v64 (copy), l_SurfaceAppearance_1 (copy)
                                v66.LocalTransparencyModifier = 0;
                                table.remove(v64.colorInstances, table.find(v64.colorInstances, l_SurfaceAppearance_1));
                            end);
                            return;
                        end;
                    else
                        local l_Material_0 = v66.Material;
                        local l_MaterialVariant_0 = v66.MaterialVariant;
                        local v78 = if l_MaterialVariant_0 == "Custom Stud" then v54 else if l_Material_0 == Enum.Material.SmoothPlastic and l_MaterialVariant_0 == "" then v54 else if l_Material_0 == Enum.Material.Plastic then v52 else if l_Material_0 == Enum.Material.Neon then v52 else nil;
                        if v78 then
                            local v79 = {};
                            for _, v81 in l_EnumItems_0 do
                                local v82 = v65:Add(v78:Clone());
                                v82:AddTag("__rainbow_managed");
                                v82.Face = v81;
                                v82.StudsPerTileU = 0.5;
                                v82.StudsPerTileV = 0.5;
                                v82.Parent = v66;
                                table.insert(v79, v82);
                            end;
                            local function v88() --[[ Line: 317 ]] --[[ Name: updateTransparency ]]
                                -- upvalues: v66 (copy), v79 (copy)
                                local l_Transparency_0 = v66.Transparency;
                                if l_Transparency_0 <= 0.01 then
                                    for _, v85 in v79 do
                                        v85.Transparency = 0;
                                    end;
                                    v66.LocalTransparencyModifier = 0;
                                    return;
                                else
                                    for _, v87 in v79 do
                                        v87.Transparency = l_Transparency_0;
                                    end;
                                    v66.LocalTransparencyModifier = 1;
                                    return;
                                end;
                            end;
                            local l_Transparency_1 = v66.Transparency;
                            if l_Transparency_1 <= 0.01 then
                                for _, v91 in v79 do
                                    v91.Transparency = 0;
                                end;
                                v66.LocalTransparencyModifier = 0;
                            else
                                for _, v93 in v79 do
                                    v93.Transparency = l_Transparency_1;
                                end;
                                v66.LocalTransparencyModifier = 1;
                            end;
                            v65:Add(v66:GetPropertyChangedSignal("Transparency"):Connect(v88));
                            v66.MaterialVariant = "";
                            v66.Material = Enum.Material.Plastic;
                            v65:Add(function() --[[ Line: 337 ]]
                                -- upvalues: v66 (copy), l_MaterialVariant_0 (copy), l_Material_0 (copy)
                                v66.LocalTransparencyModifier = 0;
                                v66.MaterialVariant = l_MaterialVariant_0;
                                v66.Material = l_Material_0;
                            end);
                            return;
                        end;
                    end;
                elseif l_SurfaceAppearance_0 then
                    if v64.fastRainbow then
                        v64.optOutOfFastRainbow();
                        return;
                    else
                        local l_colorInstances_0 = v64.colorInstances;
                        local l_l_SurfaceAppearance_0_1 = l_SurfaceAppearance_0;
                        table.insert(l_colorInstances_0, l_l_SurfaceAppearance_0_1);
                        v65:Add(function() --[[ Line: 196 ]]
                            -- upvalues: l_colorInstances_0 (copy), l_l_SurfaceAppearance_0_1 (copy)
                            table.remove(l_colorInstances_0, table.find(l_colorInstances_0, l_l_SurfaceAppearance_0_1));
                        end);
                        return;
                    end;
                end;
                if v64.fastRainbow then
                    v64.optOutOfFastRainbow();
                    return;
                else
                    local l_colorInstances_1 = v64.colorInstances;
                    table.insert(l_colorInstances_1, v66);
                    v65:Add(function() --[[ Line: 196 ]]
                        -- upvalues: l_colorInstances_1 (copy), v66 (copy)
                        table.remove(l_colorInstances_1, table.find(l_colorInstances_1, v66));
                    end);
                    return;
                end;
            end;
        end, 
        BasePart = function(v97, v98, v99) --[[ Line: 361 ]] --[[ Name: BasePart ]]
            if v99.Transparency == 1 then
                return;
            elseif v97.fastRainbow then
                v97.optOutOfFastRainbow();
                return;
            else
                local l_colorInstances_2 = v97.colorInstances;
                table.insert(l_colorInstances_2, v99);
                v98:Add(function() --[[ Line: 196 ]]
                    -- upvalues: l_colorInstances_2 (copy), v99 (copy)
                    table.remove(l_colorInstances_2, table.find(l_colorInstances_2, v99));
                end);
                return;
            end;
        end, 
        VFXInstance = function(v101, v102, v103) --[[ Line: 371 ]] --[[ Name: VFXInstance ]]
            local l_colorSequenceInstances_0 = v101.colorSequenceInstances;
            table.insert(l_colorSequenceInstances_0, v103);
            v102:Add(function() --[[ Line: 196 ]]
                -- upvalues: l_colorSequenceInstances_0 (copy), v103 (copy)
                table.remove(l_colorSequenceInstances_0, table.find(l_colorSequenceInstances_0, v103));
            end);
        end
    };
    v10.observeTag("RainbowModel", function(v106) --[[ Line: 378 ]]
        -- upvalues: v12 (ref), v31 (ref), v16 (ref), v26 (ref), v25 (ref), v105 (copy), v15 (ref), v14 (ref), l_RunService_0 (ref), v27 (ref), v19 (ref), v29 (ref), v13 (ref)
        local v107 = v12.new();
        local v108 = v12.new();
        local v109 = {};
        local v110 = {};
        local l_v106_Attribute_0 = v106:GetAttribute("IncludeParticles");
        local v112 = {
            lastUpdate = 0, 
            position = v106:GetPivot().Position, 
            updateInterval = 0, 
            lastPositionCheck = 0, 
            spawnTime = os.clock(), 
            colorInstances = v109, 
            colorSequenceInstances = v110, 
            fastRainbow = true, 
            defaultColor = if v106:IsA("BasePart") and v106:HasTag("RainbowDarken") then v106.Color else nil, 
            isViewportFrame = v106:FindFirstAncestorOfClass("ViewportFrame") ~= nil, 
            optOutOfFastRainbow = v31
        };
        if v106:FindFirstAncestor("Decorations") then
            local l_v106_FirstAncestorOfClass_0 = v106:FindFirstAncestorOfClass("Model");
            if l_v106_FirstAncestorOfClass_0 then
                v112.staticPosition = l_v106_FirstAncestorOfClass_0:GetPivot().Position;
            end;
        end;
        local v114 = nil;
        local function _() --[[ Line: 422 ]] --[[ Name: bindDescendants ]]
            -- upvalues: v114 (ref), v16 (ref), v106 (copy), v26 (ref), v107 (copy), v25 (ref), v105 (ref), v112 (copy), l_v106_Attribute_0 (copy), v108 (copy)
            v114 = v16(v106, function(v115) --[[ Line: 423 ]]
                -- upvalues: v26 (ref), v107 (ref), v25 (ref), v105 (ref), v112 (ref), l_v106_Attribute_0 (ref)
                if v115:HasTag("__rainbow_managed") or v115:GetAttribute("IgnoreRainbowColor") then
                    return;
                else
                    local l_ClassName_0 = v115.ClassName;
                    if not v26[l_ClassName_0] then
                        return;
                    else
                        local v117 = v107:Extend();
                        if v25[l_ClassName_0] then
                            if l_ClassName_0 == "MeshPart" then
                                v105.MeshPart(v112, v117, v115);
                            else
                                v105.BasePart(v112, v117, v115);
                            end;
                        elseif l_v106_Attribute_0 and (l_ClassName_0 == "Beam" or l_ClassName_0 == "ParticleEmitter") then
                            v105.VFXInstance(v112, v117, v115);
                        end;
                        return v117:WrapClean();
                    end;
                end;
            end);
            v108:Add(v114);
        end;
        local v119 = nil;
        v112.addToSubFastCluster = function(v120, v121) --[[ Line: 454 ]] --[[ Name: addToSubFastCluster ]]
            -- upvalues: v119 (ref), v106 (copy), v114 (ref), v15 (ref), v31 (ref), v14 (ref), v108 (copy)
            if v119 then
                return nil;
            else
                local v122 = v106:QueryDescendants("BasePart > Bone");
                local v123 = {};
                local v124 = {
                    v121
                };
                for _, v126 in v122 do
                    local l_Parent_0 = v126.Parent;
                    if l_Parent_0 and not v123[l_Parent_0] then
                        table.insert(v124, l_Parent_0);
                        v123[l_Parent_0] = true;
                    end;
                end;
                v114(false);
                local v128 = v106:IsA("Model") and v106:GetScale() or 1;
                local v129, v130 = v15(v124, v128);
                for _, v132 in v129:QueryDescendants("ParticleEmitter , Beam , BillboardGui") do
                    v132:Destroy();
                end;
                v114(true);
                local v133 = Instance.new("Humanoid", v129);
                local v134 = Instance.new("Animator", v133);
                v133.Name = "AnimationController";
                v133.Parent = v129;
                local v135 = v106:FindFirstChildOfClass("AnimationController") or v106:FindFirstChildOfClass("Humanoid");
                local l_v31_0 = v31;
                if v135 then
                    local l_Animator_0 = v135:FindFirstChildOfClass("Animator");
                    if l_Animator_0 then
                        l_v31_0 = v14(l_Animator_0, v134);
                    end;
                end;
                local v138 = v130[1];
                v129.Name = "_sub_cluster";
                v129:AddTag("__rainbow_managed");
                v129.Parent = workspace.Debris;
                local v139 = v108:Add(function() --[[ Line: 509 ]]
                    -- upvalues: v129 (copy), v119 (ref), l_v31_0 (ref)
                    v129.Parent = nil;
                    v119 = nil;
                    l_v31_0();
                end);
                v120:Add(function() --[[ Line: 515 ]]
                    -- upvalues: v138 (copy), v129 (copy), v133 (copy), v130 (copy), v139 (copy)
                    v138:Destroy();
                    local v140 = false;
                    for _, v142 in v129:GetChildren() do
                        if v142 ~= v133 and not table.find(v130, v142) then
                            v140 = true;
                        end;
                    end;
                    if not v140 then
                        v139();
                    end;
                end);
                v119 = v129;
                return v138;
            end;
        end;
        v112.optOutOfFastRainbow = function() --[[ Line: 537 ]] --[[ Name: optOutOfFastRainbow ]]
            -- upvalues: v112 (copy), l_RunService_0 (ref), v108 (copy), v27 (ref), v106 (copy), v114 (ref), v16 (ref), v26 (ref), v107 (copy), v25 (ref), v105 (ref), l_v106_Attribute_0 (copy)
            if v112.fastRainbow then
                if l_RunService_0:IsStudio() then

                end;
                v112.fastRainbow = false;
                v108:Destroy();
                task.defer(function() --[[ Line: 544 ]]
                    -- upvalues: v27 (ref), v106 (ref), v112 (ref), v114 (ref), v16 (ref), v26 (ref), v107 (ref), v25 (ref), v105 (ref), l_v106_Attribute_0 (ref), v108 (ref)
                    if v27[v106] == v112 then
                        v114 = v16(v106, function(v143) --[[ Line: 423 ]]
                            -- upvalues: v26 (ref), v107 (ref), v25 (ref), v105 (ref), v112 (ref), l_v106_Attribute_0 (ref)
                            if v143:HasTag("__rainbow_managed") or v143:GetAttribute("IgnoreRainbowColor") then
                                return;
                            else
                                local l_ClassName_1 = v143.ClassName;
                                if not v26[l_ClassName_1] then
                                    return;
                                else
                                    local v145 = v107:Extend();
                                    if v25[l_ClassName_1] then
                                        if l_ClassName_1 == "MeshPart" then
                                            v105.MeshPart(v112, v145, v143);
                                        else
                                            v105.BasePart(v112, v145, v143);
                                        end;
                                    elseif l_v106_Attribute_0 and (l_ClassName_1 == "Beam" or l_ClassName_1 == "ParticleEmitter") then
                                        v105.VFXInstance(v112, v145, v143);
                                    end;
                                    return v145:WrapClean();
                                end;
                            end;
                        end);
                        v108:Add(v114);
                    end;
                end);
            end;
        end;
        if v112.isViewportFrame or table.find(v19[("NO_FAST_RAINBOW_ANIMALS_%*"):format(v29)] or v19.NO_FAST_RAINBOW_ANIMALS, v106.Name) then
            v112.optOutOfFastRainbow();
        end;
        v114 = v16(v106, function(v146) --[[ Line: 423 ]]
            -- upvalues: v26 (ref), v107 (copy), v25 (ref), v105 (ref), v112 (copy), l_v106_Attribute_0 (copy)
            if v146:HasTag("__rainbow_managed") or v146:GetAttribute("IgnoreRainbowColor") then
                return;
            else
                local l_ClassName_2 = v146.ClassName;
                if not v26[l_ClassName_2] then
                    return;
                else
                    local v148 = v107:Extend();
                    if v25[l_ClassName_2] then
                        if l_ClassName_2 == "MeshPart" then
                            v105.MeshPart(v112, v148, v146);
                        else
                            v105.BasePart(v112, v148, v146);
                        end;
                    elseif l_v106_Attribute_0 and (l_ClassName_2 == "Beam" or l_ClassName_2 == "ParticleEmitter") then
                        v105.VFXInstance(v112, v148, v146);
                    end;
                    return v148:WrapClean();
                end;
            end;
        end);
        v108:Add(v114);
        v27[v106] = v112;
        v107:Add(function() --[[ Line: 561 ]]
            -- upvalues: v27 (ref), v106 (copy)
            v27[v106] = nil;
        end);
        v107:Add(v13:OnChange("FastRainbow.FAST_RAINBOW_ENABLED", function(v149) --[[ Line: 565 ]]
            -- upvalues: v112 (copy)
            if not v149 and v112.fastRainbow then
                v112.optOutOfFastRainbow();
            end;
        end));
        v107:Add(v13:OnChange("FastRainbow.NO_FAST_RAINBOW_ANIMALS", function(v150) --[[ Line: 570 ]]
            -- upvalues: v106 (copy), v112 (copy)
            if type(v150) == "table" and table.find(v150, v106.Name) and v112.fastRainbow then
                v112.optOutOfFastRainbow();
            end;
        end));
        return v107:WrapClean();
    end, {
        workspace, 
        l_LocalPlayer_0
    });
    local v151 = {
        [1] = Color3.fromRGB(255, 0, 4), 
        [2] = Color3.fromRGB(255, 0, 242), 
        [3] = Color3.fromRGB(0, 132, 255), 
        [4] = Color3.fromRGB(17, 255, 0)
    };
    local v152 = #v151;
    local v153 = v151[1];
    local v154 = ColorSequence.new(v153);
    local function v165(_) --[[ Line: 621 ]] --[[ Name: adaptiveIntervals ]]
        -- upvalues: l_CurrentCamera_0 (ref), v19 (ref), v29 (ref), v27 (ref)
        local v156 = os.clock();
        local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
        local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
        local v159 = math.rad(l_CurrentCamera_0.FieldOfView / 2) + (v19[("CAMERA_FACING_TOLERANCE_%*"):format(v29)] or v19.CAMERA_FACING_TOLERANCE);
        for v160, v161 in v27 do
            if v161.isViewportFrame then
                v161.updateInterval = 0.022222222222222223;
            elseif v161.staticPosition then
                v161.updateInterval = 0.03333333333333333;
            else
                if v156 - v161.lastPositionCheck > (v19[("POSITION_UPDATE_INTERVAL_%*"):format(v29)] or v19.POSITION_UPDATE_INTERVAL) then
                    v161.position = v160:GetPivot().Position;
                    v161.lastPositionCheck = v156;
                end;
                local v162 = l_Position_0 - v161.position;
                local v163 = math.acos((l_LookVector_0:Dot(v162.Unit)));
                local l_Magnitude_0 = v162.Magnitude;
                if l_Magnitude_0 > 5000 then
                    v161.updateInterval = 60;
                elseif v163 < v159 then
                    v161.updateInterval = 0.5;
                    if not v161.fastRainbow then
                        v161.updateInterval = 2;
                    end;
                else
                    v161.updateInterval = 0.03333333333333333 + l_Magnitude_0 // 25 / 60;
                    if not v161.fastRainbow then
                        v161.updateInterval = v161.updateInterval * 2;
                    end;
                end;
            end;
        end;
    end;
    local v166 = 0;
    local function v198(_) --[[ Line: 674 ]] --[[ Name: updateColors ]]
        -- upvalues: v152 (copy), v153 (ref), v151 (copy), v154 (ref), v27 (ref), v19 (ref), v29 (ref), l_status_2 (copy), v53 (ref), v166 (ref), v28 (ref)
        local v168 = os.clock();
        local v169 = (v168 % v152 + 1) // 1;
        v153 = v151[v169]:Lerp(v151[v169 % v152 + 1], v168 % 1);
        v154 = ColorSequence.new(v153);
        local v170, v171 = v153:ToHSV();
        local _ = ColorSequence.new(v153);
        local v173 = {};
        for _, v175 in v27 do
            table.insert(v173, v175);
        end;
        table.sort(v173, function(v176, v177) --[[ Line: 693 ]]
            -- upvalues: v168 (copy)
            if v176.isViewportFrame and v177.isViewportFrame then
                return v176.spawnTime < v177.spawnTime;
            elseif v176.isViewportFrame or v177.isViewportFrame then
                return v176.isViewportFrame;
            elseif v176.lastUpdate == v177.lastUpdate then
                return v176.spawnTime < v177.spawnTime;
            else
                return v168 - (v176.lastUpdate + v176.updateInterval) > v168 - (v177.lastUpdate + v177.updateInterval);
            end;
        end);
        local v178 = 0;
        local v179 = v19[("MAX_INVALIDATIONS_PER_FRAME_%*"):format(v29)] or v19.MAX_INVALIDATIONS_PER_FRAME;
        for _, v181 in v173 do
            if v168 - v181.lastUpdate >= v181.updateInterval and (v181.fastRainbow and v178 < v179 or not v181.fastRainbow) then
                v181.lastUpdate = os.clock();
                local l_defaultColor_0 = v181.defaultColor;
                for _, v184 in v181.colorInstances do
                    local l_v153_0 = v153;
                    if l_defaultColor_0 then
                        local _, _, v188 = l_defaultColor_0:ToHSV();
                        l_v153_0 = Color3.fromHSV(v170, math.max(v171 - 0.4, 0), (math.min(v188 + 0.2, 1)));
                    end;
                    v184.Color = l_v153_0;
                end;
                for _, v190 in v181.colorSequenceInstances do
                    v190.Color = v154;
                end;
                if v181.fastRainbow then
                    v178 = v178 + 1;
                end;
            end;
        end;
        if not l_status_2 or not v53 then
            return;
        else
            v166 = v166 + 1;
            local function _(v191, v192) --[[ Line: 754 ]] --[[ Name: tintRainbowTexture ]]
                -- upvalues: v153 (ref)
                v191:WritePixelsBuffer(Vector2.zero, v191.Size, v192);
                v191:DrawRectangle(Vector2.zero, v191.Size, v153, 0, Enum.ImageCombineType.Multiply);
            end;
            for v194, v195 in v28 do
                if v195.editable and v195.imageBuffer and v166 % #v28 == v194 - 1 then
                    local l_editable_0 = v195.editable;
                    local l_imageBuffer_0 = v195.imageBuffer;
                    l_editable_0:WritePixelsBuffer(Vector2.zero, l_editable_0.Size, l_imageBuffer_0);
                    l_editable_0:DrawRectangle(Vector2.zero, l_editable_0.Size, v153, 0, Enum.ImageCombineType.Multiply);
                end;
            end;
            return;
        end;
    end;
    local _ = function() --[[ Line: 767 ]] --[[ Name: updateQualityZone ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v19 (ref), v29 (ref)
        if l_UserInputService_0.TouchEnabled and not l_UserInputService_0.KeyboardEnabled then
            local _ = not l_UserInputService_0.MouseEnabled;
        end;
        if l_GameSettings_0.SavedQualityLevel.Value <= (v19[("LOW_QUALITY_LEVEL_%*"):format(v29)] or v19.LOW_QUALITY_LEVEL) then
            v29 = "LQ";
            return;
        else
            v29 = "HQ";
            return;
        end;
    end;
    l_RunService_0.Heartbeat:Connect(function(v201) --[[ Line: 776 ]]
        -- upvalues: v165 (copy), v198 (copy)
        debug.profilebegin("fastrainbow:update");
        debug.profilebegin("fastrainbow:adaptive");
        v165(v201);
        debug.profileend();
        debug.profilebegin("fastrainbow:updateColors");
        v198(v201);
        debug.profileend();
        debug.profileend();
    end);
end;
return v30;