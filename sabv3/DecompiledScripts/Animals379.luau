local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local _ = require(l_Packages_0.Trove);
local v4 = require(l_Packages_0.Observers);
local v5 = require(l_Packages_0.Trove);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v7 = require(l_Datas_0.Animals);
local v8 = require(l_Datas_0.Game);
local _ = require(l_Datas_0.Rebirth);
local v10 = require(l_Datas_0.Rarities);
local v11 = require(l_Datas_0.Mutations);
local v12 = require(l_Datas_0.Traits);
local l_Animals_0 = l_ReplicatedStorage_0:WaitForChild("Animations").Animals;
local l_MutationSurfaces_0 = l_ReplicatedStorage_0:WaitForChild("MutationSurfaces");
local l_Models_0 = l_ReplicatedStorage_0:WaitForChild("Models");
local l_Animals_1 = l_Models_0.Animals;
local l_Traits_0 = l_Models_0.Traits;
local l_Traits_1 = l_ReplicatedStorage_0:WaitForChild("Vfx").Traits;
local l_Vfx_0 = l_ReplicatedStorage_0:WaitForChild("Vfx");
local v20 = {};
local l_Unit_0 = Vector3.new(-1, 0.25, -1, 0).Unit;
local function v40(v22, v23) --[[ Line: 40 ]] --[[ Name: GetBoundingBox ]]
    local v24 = 1e999;
    local v25 = 1e999;
    local v26 = 1e999;
    local v27 = -1e999;
    local v28 = -1e999;
    local v29 = -1e999;
    for _, v31 in v22:GetDescendants() do
        if v31:IsA("BasePart") and v31.Transparency < 1 and not v23[v31] then
            local l_CFrame_0 = v31.CFrame;
            local v33 = v31.Size * 0.5;
            for v34 = -1, 1, 2 do
                for v35 = -1, 1, 2 do
                    for v36 = -1, 1, 2 do
                        local v37 = l_CFrame_0:PointToWorldSpace((Vector3.new(v33.X * v34, v33.Y * v35, v33.Z * v36)));
                        v24 = math.min(v24, v37.X);
                        v25 = math.min(v25, v37.Y);
                        v26 = math.min(v26, v37.Z);
                        v27 = math.max(v27, v37.X);
                        v28 = math.max(v28, v37.Y);
                        v29 = math.max(v29, v37.Z);
                    end;
                end;
            end;
        end;
    end;
    local v38 = Vector3.new(v27 - v24, v28 - v25, v29 - v26);
    local v39 = Vector3.new((v24 + v27) / 2, (v25 + v28) / 2, (v26 + v29) / 2);
    return CFrame.new(v39), v38;
end;
local function v55(v41, v42, v43, v44, v45, v46) --[[ Line: 76 ]] --[[ Name: FitCam ]]
    -- upvalues: v40 (copy), l_Unit_0 (copy)
    v45 = v45 or 0.8;
    v46 = v46 or 0.5;
    local v47 = {};
    if v42 == "Los Noobinis" then
        v47[v43["Cube.003"]] = true;
    end;
    local l_FakeRootPart_0 = v43:FindFirstChild("FakeRootPart");
    if l_FakeRootPart_0 then
        v47[l_FakeRootPart_0] = true;
    end;
    if v42 == "Tacorita Bicicleta" then
        local l_RootPart_0 = v43:FindFirstChild("RootPart");
        if l_RootPart_0 then
            v47[l_RootPart_0] = true;
        end;
    end;
    local _, v51 = v40(v43, v47);
    if v42 == "Tacorita Bicicleta" then
        v45 = v45 + 0.2;
    elseif v42 == "25" then
        v45 = v45 - 0.6;
    elseif v42 == "Los Jolly Combinasionas" then
        v45 = v45 - 0.4;
    elseif v42 == "Money Money Reindeer" then
        v45 = v45 + 0.2;
    end;
    local v52 = if not (v42 ~= "Tacorita Bicicleta" and v42 ~= "W or L" and v42 ~= "25" and v42 ~= "Cocoa Assassino") or v42 == "Los Jolly Combinasionas" then v43:GetPivot() + Vector3.new(0, v51.Y * 0.5, 0) else v43.PrimaryPart and v43.PrimaryPart.CFrame or v43:GetPivot();
    local v53 = math.max(v51.X, v51.Y, v51.Z);
    local v54 = v53 * 0.5 / math.tan((math.rad(v44 * 0.5))) * v45;
    v41.CFrame = CFrame.new((v52 * CFrame.new(l_Unit_0 * (v54 + v53 * v46))).Position, v52.Position);
end;
v20.GetSellValue = function(_, v57) --[[ Line: 124 ]] --[[ Name: GetSellValue ]]
    -- upvalues: v20 (copy), v8 (copy)
    return (math.ceil(v20:GetPrice(v57) * v8.Animal.SellModifier));
end;
local function _(v58, v59) --[[ Line: 128 ]] --[[ Name: ShouldIgnoreColor ]]
    local l_v58_Attribute_0 = v58:GetAttribute((("%*IgnoreColor"):format(v59)));
    if l_v58_Attribute_0 == false then
        return false;
    else
        return v58:GetAttribute("IgnoreColor") or l_v58_Attribute_0;
    end;
end;
v20.ApplyMutation = function(_, v63, v64, v65, v66) --[[ Line: 138 ]] --[[ Name: ApplyMutation ]]
    -- upvalues: v5 (copy), v11 (copy), l_MutationSurfaces_0 (copy), l_ReplicatedStorage_0 (copy), l_Vfx_0 (copy)
    local v67 = v5.new();
    if v66 then
        v67:Add(v63.Destroying:Connect(function() --[[ Line: 141 ]]
            -- upvalues: v67 (copy)
            v67:Destroy();
        end));
    else
        v67:Add(v63.AncestryChanged:Connect(function(_, v69) --[[ Line: 145 ]]
            -- upvalues: v67 (copy)
            if v69 then
                return;
            else
                v67:Destroy();
                return;
            end;
        end));
    end;
    local v70 = v11[v65];
    local l_l_MutationSurfaces_0_FirstChild_0 = l_MutationSurfaces_0:FindFirstChild(v64);
    local v72 = tonumber(v63:GetAttribute((("%*Palette"):format(v65))) or v63:GetAttribute("Palette") or 1) or 1;
    if not v70 or not v70.Palettes[v72] then
        v72 = 1;
    end;
    local v73 = {};
    if v65 == "Rainbow" then
        v67:Add(function() --[[ Line: 164 ]]
            -- upvalues: v63 (copy)
            v63:RemoveTag("RainbowModel");
        end);
        for _, v75 in v63:GetDescendants() do
            if v75:IsA("BasePart") and not v75:GetAttribute("IgnoreRainbowColor") then
                local l_SurfaceAppearance_0 = v75:FindFirstChildOfClass("SurfaceAppearance");
                if l_SurfaceAppearance_0 then
                    v67:Add(function() --[[ Line: 175 ]]
                        -- upvalues: v75 (copy), l_SurfaceAppearance_0 (copy)
                        local l_SurfaceAppearance_1 = v75:FindFirstChildOfClass("SurfaceAppearance");
                        if l_SurfaceAppearance_1 then
                            l_SurfaceAppearance_1:Destroy();
                        end;
                        l_SurfaceAppearance_0:Clone().Parent = v75;
                    end);
                else
                    local l_Color_0 = v75.Color;
                    v67:Add(function() --[[ Line: 185 ]]
                        -- upvalues: v75 (copy), l_Color_0 (copy)
                        v75.Color = l_Color_0;
                    end);
                    local l_MaterialVariant_0 = v75.MaterialVariant;
                    if l_MaterialVariant_0 == "Strawberry Stud Light" or l_MaterialVariant_0 == "Strawberry Stud Dark" then
                        v75.MaterialVariant = "";
                        v67:Add(function() --[[ Line: 192 ]]
                            -- upvalues: v75 (copy), l_MaterialVariant_0 (copy)
                            v75.MaterialVariant = l_MaterialVariant_0;
                        end);
                    end;
                end;
            end;
        end;
        v63:AddTag("RainbowModel");
    else
        for _, v81 in v63:GetDescendants() do
            if v81:IsA("BasePart") then
                local l_v81_Attribute_0 = v81:GetAttribute((("%*IgnoreColor"):format(v65)));
                if not (l_v81_Attribute_0 ~= false and (v81:GetAttribute("IgnoreColor") or l_v81_Attribute_0)) then
                    local v83 = v70.Palettes[v72];
                    l_v81_Attribute_0 = v70.Palettes[v72];
                    local v84 = tonumber(v81:GetAttribute((("%*Color"):format(v65))) or v81:GetAttribute("Color") or 1) or 1;
                    local v85 = l_v81_Attribute_0[v84] or v83[v84] or l_v81_Attribute_0[math.clamp(v84, 1, #l_v81_Attribute_0)];
                    if v81:GetAttribute("Neon") then
                        local l_Color_1 = v81.Color;
                        v81.Material = Enum.Material.Neon;
                        local l_l_Color_1_0 = l_Color_1 --[[ copy: 19 -> 23 ]];
                        v67:Add(function() --[[ Line: 215 ]]
                            -- upvalues: v81 (copy), l_l_Color_1_0 (copy)
                            v81.Material = l_l_Color_1_0;
                        end);
                    end;
                    local l_SurfaceAppearance_2 = v81:FindFirstChildOfClass("SurfaceAppearance");
                    if l_SurfaceAppearance_2 then
                        l_SurfaceAppearance_2:Destroy();
                        if l_l_MutationSurfaces_0_FirstChild_0 then
                            local v89 = v67:Clone(l_l_MutationSurfaces_0_FirstChild_0);
                            v89.Color = v85;
                            v89.Parent = v81;
                        end;
                        v67:Add(function() --[[ Line: 230 ]]
                            -- upvalues: v81 (copy), l_SurfaceAppearance_2 (copy)
                            local l_SurfaceAppearance_3 = v81:FindFirstChildOfClass("SurfaceAppearance");
                            if l_SurfaceAppearance_3 then
                                l_SurfaceAppearance_3:Destroy();
                            end;
                            l_SurfaceAppearance_2:Clone().Parent = v81;
                        end);
                    else
                        local l_MaterialVariant_1 = v81.MaterialVariant;
                        if l_MaterialVariant_1 == "Strawberry Stud Light" or l_MaterialVariant_1 == "Strawberry Stud Dark" then
                            v73[v81] = true;
                            v81.MaterialVariant = ("%* Strawberry Stud Light"):format(v65);
                            v67:Add(function() --[[ Line: 243 ]]
                                -- upvalues: v81 (copy), l_MaterialVariant_1 (copy)
                                v81.MaterialVariant = l_MaterialVariant_1;
                            end);
                            if l_MaterialVariant_1 == "Strawberry Stud Light" then
                                continue;
                            end;
                        end;
                        local l_Color_2 = v81.Color;
                        v81.Color = v85;
                        v67:Add(function() --[[ Line: 255 ]]
                            -- upvalues: v81 (copy), l_Color_2 (copy)
                            v81.Color = l_Color_2;
                        end);
                    end;
                end;
            end;
        end;
    end;
    if v65 == "Lava" then
        for _, v94 in v63:GetDescendants() do
            if v94:IsA("BasePart") and not v73[v94] then
                local l_v94_Attribute_0 = v94:GetAttribute((("%*IgnoreColor"):format(v65)));
                if not (l_v94_Attribute_0 ~= false and (v94:GetAttribute("IgnoreColor") or l_v94_Attribute_0)) and (v94:GetAttribute((("%*Color"):format(v65))) or v94:GetAttribute("Color")) == 1 then
                    l_v94_Attribute_0 = v94.Material;
                    v94.Material = Enum.Material.Neon;
                    v67:Add(function() --[[ Line: 272 ]]
                        -- upvalues: v94 (copy), l_v94_Attribute_0 (copy)
                        v94.Material = l_v94_Attribute_0;
                    end);
                end;
            end;
        end;
    elseif v65 == "Galaxy" then
        for _, v97 in v63:GetDescendants() do
            if v97:IsA("BasePart") and not v73[v97] then
                local l_v97_Attribute_0 = v97:GetAttribute((("%*IgnoreColor"):format(v65)));
                if not (l_v97_Attribute_0 ~= false and (v97:GetAttribute("IgnoreColor") or l_v97_Attribute_0)) then
                    if (v97:GetAttribute((("%*Color"):format(v65))) or v97:GetAttribute("Color")) == 1 then
                        l_v97_Attribute_0 = v97.Material;
                        v97.Material = Enum.Material.Neon;
                        local l_l_v97_Attribute_0_0 = l_v97_Attribute_0 --[[ copy: 16 -> 24 ]];
                        v67:Add(function() --[[ Line: 287 ]]
                            -- upvalues: v97 (copy), l_l_v97_Attribute_0_0 (copy)
                            v97.Material = l_l_v97_Attribute_0_0;
                        end);
                    end;
                    l_v97_Attribute_0 = v97.MaterialVariant;
                    v97.MaterialVariant = "Galaxy Stud";
                    v67:Add(function() --[[ Line: 294 ]]
                        -- upvalues: v97 (copy), l_v97_Attribute_0 (copy)
                        v97.MaterialVariant = l_v97_Attribute_0;
                    end);
                end;
            end;
        end;
    elseif v65 == "YinYang" then
        for _, v101 in v63:GetDescendants() do
            if v101:IsA("BasePart") and not v73[v101] then
                local l_v101_Attribute_0 = v101:GetAttribute((("%*IgnoreColor"):format(v65)));
                if not (l_v101_Attribute_0 ~= false and (v101:GetAttribute("IgnoreColor") or l_v101_Attribute_0)) then
                    local v103 = v101:GetAttribute((("%*Color"):format(v65))) or v101:GetAttribute("Color") or 1;
                    l_v101_Attribute_0 = true;
                    if v103 ~= 3 then
                        l_v101_Attribute_0 = v103 == 4;
                    end;
                    if l_v101_Attribute_0 then
                        local l_Material_0 = v101.Material;
                        v101.Material = Enum.Material.Neon;
                        v67:Add(function() --[[ Line: 309 ]]
                            -- upvalues: v101 (copy), l_Material_0 (copy)
                            v101.Material = l_Material_0;
                        end);
                    end;
                end;
            end;
        end;
    elseif v65 == "Radioactive" then
        for _, v106 in v63:GetDescendants() do
            if v106:IsA("BasePart") and not v73[v106] then
                local l_v106_Attribute_0 = v106:GetAttribute((("%*IgnoreColor"):format(v65)));
                if not (l_v106_Attribute_0 ~= false and (v106:GetAttribute("IgnoreColor") or l_v106_Attribute_0)) then
                    local l_MaterialVariant_2 = v106.MaterialVariant;
                    l_v106_Attribute_0 = v106.Material;
                    local v109 = v106:GetAttribute((("%*Color"):format(v65))) or v106:GetAttribute("Color") or 1;
                    if v109 == 2 and v72 == 1 or v109 == 2 and v72 == 4 or (not (v109 ~= 2) or v109 == 6) and v72 == 5 then
                        v106.Material = Enum.Material.Neon;
                        v67:Add(function() --[[ Line: 327 ]]
                            -- upvalues: v106 (copy), l_v106_Attribute_0 (copy)
                            v106.Material = l_v106_Attribute_0;
                        end);
                    end;
                    local l_v106_Attribute_1 = v106:GetAttribute((("%*Stud"):format(v65)));
                    if l_v106_Attribute_1 ~= false and (v106.MaterialVariant == "Custom Stud" or l_v106_Attribute_1 == true) and not v106:GetAttribute((("%*Ignore"):format(v65))) then
                        if v106:GetAttribute((("%*MaterialMode"):format(v65))) == 2 or v63:GetAttribute((("%*MaterialMode"):format(v65))) == 2 then
                            if v106:GetAttribute((("%*Material"):format(v65))) == 2 or v63:GetAttribute((("%*Material"):format(v65))) == 2 then
                                v106.Material = Enum.Material.SmoothPlastic;
                                v106.MaterialVariant = "Radioactive Stud";
                                v67:Add(function() --[[ Line: 339 ]]
                                    -- upvalues: v106 (copy), l_MaterialVariant_2 (copy), l_v106_Attribute_0 (copy)
                                    v106.MaterialVariant = l_MaterialVariant_2;
                                    v106.Material = l_v106_Attribute_0;
                                end);
                            else
                                v106.Material = Enum.Material.SmoothPlastic;
                                v106.MaterialVariant = "Radioactive Stud2";
                                v67:Add(function() --[[ Line: 346 ]]
                                    -- upvalues: v106 (copy), l_MaterialVariant_2 (copy), l_v106_Attribute_0 (copy)
                                    v106.MaterialVariant = l_MaterialVariant_2;
                                    v106.Material = l_v106_Attribute_0;
                                end);
                            end;
                        elseif v109 ~= 2 and v109 ~= 6 then
                            if v106:GetAttribute((("%*Material"):format(v65))) == 2 or v63:GetAttribute((("%*Material"):format(v65))) == 2 then
                                v106.Material = Enum.Material.SmoothPlastic;
                                v106.MaterialVariant = "Radioactive Stud";
                                v67:Add(function() --[[ Line: 355 ]]
                                    -- upvalues: v106 (copy), l_MaterialVariant_2 (copy), l_v106_Attribute_0 (copy)
                                    v106.MaterialVariant = l_MaterialVariant_2;
                                    v106.Material = l_v106_Attribute_0;
                                end);
                            else
                                v106.Material = Enum.Material.SmoothPlastic;
                                v106.MaterialVariant = "Radioactive Stud2";
                                v67:Add(function() --[[ Line: 362 ]]
                                    -- upvalues: v106 (copy), l_MaterialVariant_2 (copy), l_v106_Attribute_0 (copy)
                                    v106.MaterialVariant = l_MaterialVariant_2;
                                    v106.Material = l_v106_Attribute_0;
                                end);
                            end;
                        end;
                    elseif l_v106_Attribute_1 == false then
                        v106.MaterialVariant = "";
                        v67:Add(function() --[[ Line: 370 ]]
                            -- upvalues: v106 (copy), l_MaterialVariant_2 (copy)
                            v106.MaterialVariant = l_MaterialVariant_2;
                        end);
                    end;
                end;
            end;
        end;
    elseif v65 == "Cursed" then
        local l_v63_FirstChild_0 = v63:FindFirstChild("_Trait.Zombie");
        if l_v63_FirstChild_0 then
            l_v63_FirstChild_0:Destroy();
        end;
        for _, v113 in v63:GetDescendants() do
            if v113:IsA("BasePart") and not v73[v113] then
                local l_v113_Attribute_0 = v113:GetAttribute((("%*IgnoreColor"):format(v65)));
                if not (l_v113_Attribute_0 ~= false and (v113:GetAttribute("IgnoreColor") or l_v113_Attribute_0)) then
                    local l_MaterialVariant_3 = v113.MaterialVariant;
                    l_v113_Attribute_0 = v113.Material;
                    local l_Color_3 = v113.Color;
                    local v117 = v113:GetAttribute((("%*Color"):format(v65))) or v113:GetAttribute("Color") or 1;
                    if v117 == 2 and v72 == 1 or v117 == 2 and v72 == 4 or (not (v117 ~= 2) or v117 == 6) and v72 == 5 then
                        v113.Material = Enum.Material.Neon;
                        v67:Add(function() --[[ Line: 395 ]]
                            -- upvalues: v113 (copy), l_v113_Attribute_0 (copy)
                            v113.Material = l_v113_Attribute_0;
                        end);
                    end;
                    local l_v113_Attribute_1 = v113:GetAttribute((("%*Stud"):format(v65)));
                    if l_v113_Attribute_1 ~= false and (v113.MaterialVariant == "Custom Stud" or l_v113_Attribute_1 == true) and not v113:GetAttribute((("%*Ignore"):format(v65))) then
                        if v117 ~= 2 and v117 ~= 6 or l_v113_Attribute_1 == true then
                            v113.Material = Enum.Material.SmoothPlastic;
                            v113.MaterialVariant = "Cursed Stud";
                            v113.Color = Color3.fromRGB(255, 23, 23);
                            v67:Add(function() --[[ Line: 407 ]]
                                -- upvalues: v113 (copy), l_MaterialVariant_3 (copy), l_v113_Attribute_0 (copy), l_Color_3 (copy)
                                v113.MaterialVariant = l_MaterialVariant_3;
                                v113.Material = l_v113_Attribute_0;
                                v113.Color = l_Color_3;
                            end);
                        end;
                    elseif l_v113_Attribute_1 == false then
                        v113.MaterialVariant = "";
                        v67:Add(function() --[[ Line: 415 ]]
                            -- upvalues: v113 (copy), l_MaterialVariant_3 (copy)
                            v113.MaterialVariant = l_MaterialVariant_3;
                        end);
                    end;
                    local l_SurfaceAppearance_4 = v113:FindFirstChildOfClass("SurfaceAppearance");
                    if l_SurfaceAppearance_4 then
                        if not v113:GetAttribute((("%*IgnoreSurfaceColor"):format(v65))) then
                            l_SurfaceAppearance_4.Color = Color3.fromRGB(255, 23, 23);
                        end;
                        if v113:GetAttribute("IgnoreSurface") then
                            l_SurfaceAppearance_4:Destroy();
                        end;
                    end;
                end;
            end;
        end;
        local l_FirstChild_0 = l_ReplicatedStorage_0.Models.TraitsPerAnimal.Zombie:FindFirstChild(v64);
        if l_FirstChild_0 then
            local v121 = v67:Clone(l_FirstChild_0);
            v121.Name = "_Trait.Zombie";
            v121.Parent = v63;
            local v122 = {};
            for _, v124 in v121:GetChildren() do
                v124.Color = Color3.fromRGB(255, 23, 23);
                local l_Attachment_0 = v124:FindFirstChildOfClass("Attachment");
                local v126 = v122[l_Attachment_0.Name] or v63:FindFirstChild(l_Attachment_0.Name, true);
                if not v126 then
                    v124:Destroy();
                else
                    v124:PivotTo(v126.WorldCFrame);
                    v122[l_Attachment_0.Name] = v126;
                    local l_RigidConstraint_0 = Instance.new("RigidConstraint");
                    l_RigidConstraint_0.Attachment0 = l_Attachment_0;
                    l_RigidConstraint_0.Attachment1 = v126;
                    l_RigidConstraint_0.Parent = l_Attachment_0;
                end;
            end;
        end;
    end;
    local l_l_Vfx_0_FirstChild_0 = l_Vfx_0:FindFirstChild(v65);
    local l_VfxInstance_0 = v63:FindFirstChild("VfxInstance");
    if l_l_Vfx_0_FirstChild_0 and l_VfxInstance_0 then
        for _, v131 in l_l_Vfx_0_FirstChild_0:GetChildren() do
            v67:Clone(v131).Parent = l_VfxInstance_0;
        end;
    end;
    return v67:WrapClean();
end;
v20.ApplyTraits = function(_, v133, v134, v135) --[[ Line: 474 ]] --[[ Name: ApplyTraits ]]
    -- upvalues: v5 (copy), l_Models_0 (copy), v12 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_Traits_0 (copy), l_Traits_1 (copy)
    local v136 = v5.new();
    local v137 = {};
    for _, v139 in v135 do
        v137[v139] = true;
    end;
    local v140 = v137.Skibidi and l_Models_0.TraitsPerAnimal.Skibidi:FindFirstChild(v134);
    for _, v142 in v135 do
        local function v154() --[[ Line: 485 ]] --[[ Name: loadSpecificAnimalModel ]]
            -- upvalues: v12 (ref), v142 (copy), l_Models_0 (ref), v134 (copy), v133 (copy), v136 (copy), l_ReplicatedStorage_0 (ref), v4 (ref)
            if not v12[v142] then
                return;
            else
                local l_FirstChild_1 = l_Models_0.TraitsPerAnimal:FindFirstChild(v142);
                if not l_FirstChild_1 then
                    return;
                else
                    local l_l_FirstChild_1_FirstChild_0 = l_FirstChild_1:FindFirstChild(v134);
                    if not l_l_FirstChild_1_FirstChild_0 then
                        return;
                    elseif v133:FindFirstChild((("_Trait.%*"):format(v142))) then
                        return;
                    else
                        local v145 = v136:Clone(l_l_FirstChild_1_FirstChild_0);
                        v145.Name = ("_Trait.%*"):format(v142);
                        for _, v147 in v145:GetChildren() do
                            local l_Attachment_1 = v147:FindFirstChildOfClass("Attachment");
                            if l_Attachment_1 then
                                local l_v133_FirstChild_0 = v133:FindFirstChild(l_Attachment_1.Name, true);
                                if l_v133_FirstChild_0 then
                                    local l_RigidConstraint_1 = Instance.new("RigidConstraint");
                                    l_RigidConstraint_1.Attachment0 = l_Attachment_1;
                                    l_RigidConstraint_1.Attachment1 = l_v133_FirstChild_0;
                                    l_RigidConstraint_1.Parent = v147;
                                end;
                            end;
                        end;
                        v145.Parent = v133;
                        if v142 == "Jackolantern Pet" or v142 == "Reindeer Pet" then
                            local l_v145_FirstChildWhichIsA_0 = v145:FindFirstChildWhichIsA("Animator", true);
                            if l_v145_FirstChildWhichIsA_0 then
                                l_v145_FirstChildWhichIsA_0:SetAttribute("Animation", (("Animations.Traits.%*"):format(v142)));
                                l_v145_FirstChildWhichIsA_0:AddTag("ClientLoadAnimation");
                                local v152 = l_v145_FirstChildWhichIsA_0:LoadAnimation(l_ReplicatedStorage_0.Animations.Traits[v142].Walk);
                                v136:Add(function() --[[ Line: 517 ]]
                                    -- upvalues: v152 (copy)
                                    v152:Stop(0);
                                    v152:Destroy();
                                end);
                                v136:Add(v4.observeAttribute(v133, "Walking", function(v153) --[[ Line: 522 ]]
                                    -- upvalues: v152 (copy)
                                    if v153 then
                                        if not v152.IsPlaying then
                                            v152:Play();
                                        end;
                                    elseif v152.IsPlaying then
                                        v152:Stop();
                                    end;
                                    return nil;
                                end));
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
        local function v170() --[[ Line: 539 ]] --[[ Name: loadModels ]]
            -- upvalues: v12 (ref), v142 (copy), l_Traits_0 (ref), v136 (copy), v133 (copy), v137 (copy), v140 (copy)
            local v155 = v12[v142];
            if not v155 then
                return;
            else
                local l_l_Traits_0_FirstChild_0 = l_Traits_0:FindFirstChild(v142);
                if not l_l_Traits_0_FirstChild_0 then
                    return;
                else
                    local v157 = v136:Clone(l_l_Traits_0_FirstChild_0);
                    v157.Name = ("_Trait.%*"):format(v142);
                    for _, v159 in v157:GetChildren() do
                        local v160 = false;
                        for _, v162 in v159:GetChildren() do
                            if v162:IsA("Attachment") then
                                local l_v133_FirstChild_1 = v133:FindFirstChild(v162.Name, true);
                                if l_v133_FirstChild_1 then
                                    v160 = true;
                                    local v164 = Vector3.new(0, 0, 0, 0);
                                    if (v142 == "10B" or v142 == "26") and v137["10B"] then
                                        v164 = v164 + Vector3.new(0, -1.4589999914169312, 0, 0);
                                    end;
                                    if (v142 == "Taco" or v142 == "10B" or v142 == "26") and v137["RIP Gravestone"] then
                                        v164 = v164 + Vector3.new(0, -3.5820000171661377, 0, 0);
                                    end;
                                    if (v142 == "Taco" or v142 == "10B" or v142 == "26" or v142 == "RIP Gravestone") and v137["Matteo Hat"] then
                                        v164 = v164 + Vector3.new(0, -1.3300000429153442, 0, 0);
                                    end;
                                    if (v142 == "Taco" or v142 == "10B" or v142 == "26" or v142 == "Matteo Hat" or v142 == "RIP Gravestone") and v137["Santa Hat"] then
                                        v164 = v164 + Vector3.new(0, -1.534000039100647, 0, 0);
                                    end;
                                    if (v142 == "Taco" or v142 == "10B" or v142 == "26" or v142 == "Matteo Hat" or v142 == "RIP Gravestone" or v142 == "Santa Hat") and v137["Witch Hat"] then
                                        v164 = v164 + Vector3.new(0, -2.450000047683716, 0, 0);
                                    end;
                                    if (v142 == "Taco" or v142 == "10B" or v142 == "26" or v142 == "Matteo Hat" or v142 == "RIP Gravestone" or v142 == "Santa Hat" or v142 == "Witch Hat") and v137.Sombrero then
                                        v164 = v164 + Vector3.new(0, -2.7279999256134033, 0, 0);
                                    end;
                                    if (v142 == "Taco" or v142 == "10B" or v142 == "26" or v142 == "Matteo Hat" or v142 == "RIP Gravestone" or v142 == "Santa Hat" or v142 == "Witch Hat" or v142 == "Sombrero") and v137.Skibidi then
                                        local l_Name_0 = v162.Name;
                                        if not string.find(l_Name_0, "Forward") then
                                            local v166 = string.find(l_Name_0, "Second");
                                            l_Name_0 = string.find(l_Name_0, "Third") and "ThirdForwardHatAttachment" or v166 and "SecondForwardHatAttachment" or "ForwardHatAttachment";
                                        end;
                                        local l_v140_FirstChild_0 = v140:FindFirstChild(l_Name_0, true);
                                        if l_v140_FirstChild_0 then
                                            v164 = v164 + Vector3.new(0, -(l_v140_FirstChild_0.Parent.Size.Y * 0.5) + l_v140_FirstChild_0.Position.Y, 0);
                                        end;
                                    end;
                                    if v164 ~= Vector3.new(0, 0, 0, 0) then
                                        if v142 == "26" then
                                            v164 = Vector3.new(0, 0, v164.Y);
                                        end;
                                        v162.Position = v162.Position + v164;
                                    end;
                                    local l_RigidConstraint_2 = Instance.new("RigidConstraint");
                                    l_RigidConstraint_2.Attachment0 = v162;
                                    l_RigidConstraint_2.Attachment1 = l_v133_FirstChild_1;
                                    l_RigidConstraint_2.Parent = v159;
                                    if v155.Modify then
                                        v155.Modify(v159, v162, l_v133_FirstChild_1);
                                    end;
                                end;
                            end;
                        end;
                        if not v160 then
                            v159:Destroy();
                        end;
                    end;
                    v157.Parent = v133;
                    if v137.Lightning then
                        local l_v157_FirstChildWhichIsA_0 = v157:FindFirstChildWhichIsA("Animator", true);
                        if l_v157_FirstChildWhichIsA_0 then
                            l_v157_FirstChildWhichIsA_0:SetAttribute("Animation", "Animations.Traits.Lightning");
                            l_v157_FirstChildWhichIsA_0:AddTag("ClientLoadAnimation");
                        end;
                    end;
                    return;
                end;
            end;
        end;
        local function v178() --[[ Line: 643 ]] --[[ Name: loadVfx ]]
            -- upvalues: v12 (ref), v142 (copy), l_Traits_1 (ref), v133 (copy), v136 (copy)
            local v171 = v12[v142];
            if not v171 then
                return;
            else
                local l_l_Traits_1_FirstChild_0 = l_Traits_1:FindFirstChild(v142);
                if l_l_Traits_1_FirstChild_0 then
                    for _, v174 in l_l_Traits_1_FirstChild_0:GetChildren() do
                        local l_v133_FirstChild_2 = v133:FindFirstChild(v174.Name);
                        if l_v133_FirstChild_2 then
                            local v176 = v136:Clone(v174);
                            v176.Massless = true;
                            v176.CanCollide = false;
                            v176.CanQuery = false;
                            v176.CanTouch = false;
                            v176.Transparency = 1;
                            v176.CFrame = l_v133_FirstChild_2.CFrame;
                            local v177 = Instance.new("WeldConstraint", v176);
                            v177.Part0 = l_v133_FirstChild_2;
                            v177.Part1 = v176;
                            v176.Parent = v133;
                            v176.Name = ("_%*"):format(v174.Name);
                            if v171.ModifyVFX then
                                v171.ModifyVFX(v176, l_v133_FirstChild_2);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
        if v142 ~= "Strawberry" or v134 ~= "Strawberry Elephant" then
            v154();
            v170();
            v178();
            if v142 == "Strawberry" then
                for _, v180 in v133:GetDescendants() do
                    if v180:IsA("BasePart") then
                        local l_MaterialVariant_4 = v180.MaterialVariant;
                        local l_Color_4 = v180.Color;
                        if v180:HasTag("Strawberry") then
                            v180.Color = Color3.fromRGB(255, 255, 255);
                            v180.Material = Enum.Material.SmoothPlastic;
                            v180.MaterialVariant = "Strawberry Stud Light";
                            v136:Add(function() --[[ Line: 697 ]]
                                -- upvalues: v180 (copy), l_MaterialVariant_4 (copy), l_Color_4 (copy)
                                v180.MaterialVariant = l_MaterialVariant_4;
                                v180.Color = l_Color_4;
                            end);
                        end;
                        if v180:HasTag("Strawberry2") then
                            v180.Color = Color3.fromRGB(193, 193, 193);
                            v180.Material = Enum.Material.SmoothPlastic;
                            v180.MaterialVariant = "Strawberry Stud Light";
                            v136:Add(function() --[[ Line: 707 ]]
                                -- upvalues: v180 (copy), l_MaterialVariant_4 (copy), l_Color_4 (copy)
                                v180.MaterialVariant = l_MaterialVariant_4;
                                v180.Color = l_Color_4;
                            end);
                        end;
                        if v180:HasTag("Strawberry3") then
                            v180.Color = Color3.fromRGB(147, 147, 147);
                            v180.Material = Enum.Material.SmoothPlastic;
                            v180.MaterialVariant = "Strawberry Stud Light";
                            v136:Add(function() --[[ Line: 717 ]]
                                -- upvalues: v180 (copy), l_MaterialVariant_4 (copy), l_Color_4 (copy)
                                v180.MaterialVariant = l_MaterialVariant_4;
                                v180.Color = l_Color_4;
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v136:WrapClean();
end;
v20.GetAnimatedModel = function(_, v184, v185) --[[ Line: 729 ]] --[[ Name: GetAnimatedModel ]]
    -- upvalues: l_Animals_1 (copy), l_Animals_0 (copy)
    local l_l_Animals_1_FirstChild_0 = l_Animals_1:FindFirstChild(v184);
    if not l_l_Animals_1_FirstChild_0 then
        warn((("Animal not found %* in model folder"):format(v184)));
        return nil;
    else
        local v187 = l_l_Animals_1_FirstChild_0:Clone();
        if v187.PrimaryPart then
            v187.PrimaryPart.Anchored = true;
        end;
        v187.Parent = workspace;
        local l_l_Animals_0_FirstChild_0 = l_Animals_0:FindFirstChild(v184);
        local v189 = l_l_Animals_0_FirstChild_0 and l_l_Animals_0_FirstChild_0:FindFirstChild(v185);
        local v190 = v187:FindFirstChild("AnimationController") or Instance.new("AnimationController", v187);
        local v191 = v190:FindFirstChild("Animator") or Instance.new("Animator", v190);
        if v189 and v191 then
            local v192 = v191:LoadAnimation(v189);
            v192.Looped = true;
            v192:Play();
        end;
        for _, v194 in v187:GetDescendants() do
            if v194:IsA("BasePart") then
                v194.Massless = true;
                v194.CanCollide = false;
                v194.CanQuery = false;
                v194.CanTouch = false;
                v194.Anchored = false;
            end;
        end;
        return v187;
    end;
end;
v20.AttachOnViewportWithOptimizations = function(_, v196, v197, _, v199, _) --[[ Line: 773 ]] --[[ Name: AttachOnViewportWithOptimizations ]]
    -- upvalues: v5 (copy), l_Animals_1 (copy), v20 (copy), v4 (copy), l_Animals_0 (copy), v55 (copy)
    local v201 = v5.new();
    local l_l_Animals_1_FirstChild_1 = l_Animals_1:FindFirstChild(v196);
    if not l_l_Animals_1_FirstChild_1 then
        warn((("Animal not found %* in model folder"):format(v196)));
        return v201;
    else
        local v203 = v201:Clone(l_l_Animals_1_FirstChild_1);
        local v204 = v201:Add(Instance.new("WorldModel"));
        v203.Parent = v204;
        local v205 = true;
        v201:Add(function() --[[ Line: 787 ]]
            -- upvalues: v205 (ref)
            v205 = false;
        end);
        v201:Add(v197.Destroying:Connect(function() --[[ Line: 791 ]]
            -- upvalues: v201 (copy)
            v201:Destroy();
        end));
        if v199 and v199 ~= "Default" then
            v201:Add(v20:ApplyMutation(v203, v196, v199));
        end;
        local function v206() --[[ Line: 799 ]] --[[ Name: unparent ]]
            -- upvalues: v205 (ref), v204 (copy)
            if v205 then
                v204.Parent = nil;
            end;
        end;
        local function v217(v207) --[[ Line: 805 ]] --[[ Name: updateAncestry ]]
            -- upvalues: v206 (copy), v4 (ref), v205 (ref), v204 (copy), v197 (copy), l_Animals_0 (ref), v196 (copy), v203 (copy)
            if not v207 then
                return v206;
            else
                local l_v207_FirstAncestorWhichIsA_0 = v207:FindFirstAncestorWhichIsA("LayerCollector");
                if not l_v207_FirstAncestorWhichIsA_0 then
                    return v206;
                else
                    local l_GuiObject_0 = l_v207_FirstAncestorWhichIsA_0:FindFirstChildWhichIsA("GuiObject");
                    if not l_GuiObject_0 then
                        return v206;
                    else
                        return v4.observeProperty(l_v207_FirstAncestorWhichIsA_0, "Enabled", function(v210) --[[ Line: 820 ]]
                            -- upvalues: v206 (ref), v4 (ref), l_GuiObject_0 (copy), v205 (ref), v204 (ref), v197 (ref), l_Animals_0 (ref), v196 (ref), v203 (ref)
                            if not v210 then
                                return v206;
                            else
                                return v4.observeProperty(l_GuiObject_0, "Visible", function(v211) --[[ Line: 825 ]]
                                    -- upvalues: v206 (ref), v205 (ref), v204 (ref), v197 (ref), l_Animals_0 (ref), v196 (ref), v203 (ref)
                                    if not v211 then
                                        return v206;
                                    else
                                        if v205 then
                                            v204.Parent = v197;
                                        end;
                                        task.spawn(function() --[[ Line: 836 ]]
                                            -- upvalues: v205 (ref), l_Animals_0 (ref), v196 (ref), v203 (ref)
                                            if not v205 then
                                                return;
                                            else
                                                local l_l_Animals_0_FirstChild_1 = l_Animals_0:FindFirstChild(v196);
                                                local v213 = l_l_Animals_0_FirstChild_1 and l_l_Animals_0_FirstChild_1:FindFirstChild("Idle");
                                                local v214 = v203:FindFirstChild("AnimationController") or Instance.new("AnimationController", v203);
                                                local v215 = v214:FindFirstChild("Animator") or Instance.new("Animator", v214);
                                                if v213 and v215 then
                                                    local v216 = v215:LoadAnimation(v213);
                                                    v216.Looped = true;
                                                    v216:Play(0);
                                                end;
                                                return;
                                            end;
                                        end);
                                        return v206;
                                    end;
                                end);
                            end;
                        end);
                    end;
                end;
            end;
        end;
        local v218 = nil;
        local function _(v219) --[[ Line: 860 ]] --[[ Name: requestUpdateAncestry ]]
            -- upvalues: v218 (ref), v217 (copy)
            if type(v218) == "function" then
                v218();
            end;
            v218 = v217(v219);
        end;
        v201:Add(v197.AncestryChanged:Connect(function(_, v222) --[[ Line: 868 ]]
            -- upvalues: v218 (ref), v217 (copy)
            if type(v218) == "function" then
                v218();
            end;
            v218 = v217(v222);
        end));
        if v197.Parent then
            local l_Parent_0 = v197.Parent;
            if type(v218) == "function" then
                v218();
            end;
            v218 = v217(l_Parent_0);
        end;
        local v224 = v201:Add(Instance.new("Camera"));
        v224.FieldOfView = 50;
        v224.Parent = v197;
        v197.CurrentCamera = v224;
        v55(v224, v196, v203, v224.FieldOfView, 0.75, 0.7);
        return v201, v203;
    end;
end;
v20.AttachOnViewport = function(_, v226, v227, _, v229, _) --[[ Line: 887 ]] --[[ Name: AttachOnViewport ]]
    -- upvalues: v20 (copy)
    return v20:AttachOnViewportWithOptimizations(v226, v227, nil, v229);
end;
v20.GetListOfRarity = function(_, v232) --[[ Line: 964 ]] --[[ Name: GetListOfRarity ]]
    -- upvalues: v7 (copy)
    local v233 = {};
    for v234, v235 in v7 do
        if v235.Rarity == v232 then
            table.insert(v233, v234);
        end;
    end;
    return v233;
end;
v20.GetList = function(_, v237, v238) --[[ Line: 975 ]] --[[ Name: GetList ]]
    -- upvalues: v7 (copy), v10 (copy)
    local v239 = {};
    for v240, v241 in v7 do
        if not v241.IsEnabled or v241.IsEnabled() then
            table.insert(v239, v240);
        end;
    end;
    if v237 == "Rarity" then
        table.sort(v239, function(v242, v243) --[[ Line: 986 ]]
            -- upvalues: v7 (ref), v10 (ref), v238 (copy)
            local v244 = v7[v242];
            local v245 = v7[v243];
            local v246 = v244 and v244.Rarity;
            local v247 = v245 and v245.Rarity;
            local v248 = v246 and v10[v246] and v10[v246].Weight or 0;
            local v249 = v247 and v10[v247] and v10[v247].Weight or 0;
            if v238 then
                return v248 < v249;
            else
                return v249 < v248;
            end;
        end);
        return v239;
    elseif v237 == "Price" then
        table.sort(v239, function(v250, v251) --[[ Line: 1002 ]]
            -- upvalues: v7 (ref), v238 (copy)
            local v252 = v7[v250];
            local v253 = v7[v251];
            local v254 = v252 and v252.Price or 0;
            local v255 = v253 and v253.Price or 0;
            if v238 then
                return v254 < v255;
            else
                return v255 < v254;
            end;
        end);
        return v239;
    else
        if v237 == "Generation" then
            table.sort(v239, function(v256, v257) --[[ Line: 1015 ]]
                -- upvalues: v7 (ref), v238 (copy)
                local v258 = v7[v256];
                local v259 = v7[v257];
                local v260 = v258 and v258.Generation or 0;
                local v261 = v259 and v259.Generation or 0;
                if v238 then
                    return v260 < v261;
                else
                    return v261 < v260;
                end;
            end);
        end;
        return v239;
    end;
end;
v20.GetGeneration = function(_, v263, v264, v265, v266) --[[ Line: 1033 ]] --[[ Name: GetGeneration ]]
    -- upvalues: v7 (copy), v8 (copy), v11 (copy), v12 (copy), l_ReplicatedStorage_0 (copy)
    local v267 = 0;
    local v268 = v7[v263];
    if not v268 then
        return v267;
    else
        v267 = if v268.Generation then v267 + v268.Generation else v267 + v268.Price * v8.Game.AnimalGanerationModifier;
        local v269 = 1;
        if v264 then
            v269 = v269 + v11[v264].Modifier;
        end;
        local v270 = false;
        if v265 then
            for _, v272 in v265 do
                local v273 = v12[v272];
                if v273 then
                    if v272 == "Sleepy" then
                        v270 = true;
                    else
                        v269 = v269 + v273.MultiplierModifier;
                    end;
                end;
            end;
        end;
        v267 = v267 * v269;
        if v270 then
            v267 = v267 * 0.5;
        end;
        if v266 then
            v267 = v267 * require(l_ReplicatedStorage_0.Shared.Game):GetPlayerCashMultiplayer(v266);
        end;
        return (math.round(v267));
    end;
end;
v20.GetPrice = function(_, v275, _) --[[ Line: 1084 ]] --[[ Name: GetPrice ]]
    -- upvalues: v7 (copy)
    return v7[v275].Price;
end;
v20.GetRarityStringFormat = function(_, v278) --[[ Line: 1091 ]] --[[ Name: GetRarityStringFormat ]]
    -- upvalues: v10 (copy)
    local v279 = v10[v278];
    if v278 == "OG" then
        return "<og>%s</og>";
    elseif v278 == "Festive" then
        return "<greenred>%s</greenred>";
    elseif v278 == "Admin" or v278 == "Taco" or v278 == "Spooky" then
        return "<yellowred>%s</yellowred>";
    elseif v278 == "Secret" then
        return "<zebra>%s</zebra>";
    elseif v278 == "Brainrot God" then
        return "<rainbow>%s</rainbow>";
    elseif v279 then
        return (("<font color=\"#%*\">%%s</font>"):format((v279.Color:ToHex())));
    else
        return "%s";
    end;
end;
return v20;