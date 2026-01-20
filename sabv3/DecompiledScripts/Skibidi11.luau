local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v11 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v12 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v15 = require(l_ReplicatedStorage_0.Packages.Timer);
local v16 = require(l_ReplicatedStorage_0.Packages.Trove);
local v17 = require(l_ReplicatedStorage_0.Packages.Net);
local v18 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Name_0 = script.Name;
local v21 = v17:RemoteEvent((("EventService/%*/SpawnSkibidi"):format(l_Name_0)));
local v22 = v17:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v23 = v16.new();
local v24 = false;
local l_identity_0 = CFrame.identity;
local function _(v26) --[[ Line: 37 ]] --[[ Name: easeOutSine ]]
    return (math.sin(v26 * 3.141592653589793 * 0.5));
end;
local function _(v28) --[[ Line: 41 ]] --[[ Name: easeInSine ]]
    return 1 - math.cos(v28 * 3.141592653589793 * 0.5);
end;
local v30 = CFrame.new(0, -2.441, 0.21);
local v31 = {};
local function v48(v32, _, v34) --[[ Line: 49 ]] --[[ Name: spawnSkibidi ]]
    -- upvalues: v16 (copy), v11 (copy), l_ReplicatedStorage_0 (copy), v31 (copy), v30 (copy), l_RunService_0 (copy), l_identity_0 (ref), v24 (ref)
    local v35 = v16.new();
    v11:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Skibidi.Pop, v32.Position, false);
    local v36 = table.remove(v31, 1) or script.Skibidi:Clone();
    local v37 = v36.Parent ~= nil;
    local v38 = 0;
    local v39 = -5.1;
    local v40 = time();
    local l_PrimaryPart_0 = v36.PrimaryPart;
    local l___skibidi_transform_0 = l_PrimaryPart_0.__skibidi_transform;
    l_PrimaryPart_0.Anchored = false;
    if not v37 then
        l___skibidi_transform_0.C1 = v30;
        l___skibidi_transform_0.Part0 = workspace.Terrain;
        l___skibidi_transform_0.Part1 = l_PrimaryPart_0;
        v36.Parent = workspace;
    end;
    v35:Add(l_RunService_0.PostSimulation:Connect(function() --[[ Line: 75 ]]
        -- upvalues: v40 (copy), v38 (ref), v39 (ref), v32 (copy), l___skibidi_transform_0 (copy), l_identity_0 (ref)
        debug.profilebegin("skibidi:update");
        local v43 = time() - v40;
        if v43 <= 0.75 then
            local v44 = math.sin(v43 / 0.75 * 3.141592653589793 * 0.5);
            v38 = math.lerp(0, 12.566370614359172, v44);
            v39 = math.lerp(-5.1, -0.5, v44);
        elseif v43 >= 1.25 then
            local v45 = 1 - math.cos(math.clamp((v43 - 1.25) / 0.75, 0, 1) * 3.141592653589793 * 0.5);
            v38 = math.lerp(12.566370614359172, 25.132741228718345, v45);
            v39 = math.lerp(-0.5, -5.1, v45);
        end;
        local v46 = v32 * CFrame.new(0, v39, 0);
        l___skibidi_transform_0.Transform = CFrame.lookAt(v46.Position, (Vector3.new(l_identity_0.X, v46.Y, l_identity_0.Z))) * CFrame.Angles(0, v38, 0);
        debug.profileend();
    end));
    local v47 = v34 and 0.5 or 2;
    v35:Add(task.delay(v47, function() --[[ Line: 99 ]]
        -- upvalues: v24 (ref), l___skibidi_transform_0 (copy), v31 (ref), v36 (copy), v35 (copy)
        if v24 then
            l___skibidi_transform_0.Transform = CFrame.identity;
            table.insert(v31, v36);
        else
            v36:Destroy();
        end;
        v35:Destroy();
    end));
end;
v7.OnStart = function(_) --[[ Line: 110 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v23 (copy), v24 (ref), v31 (copy), v8 (copy), v11 (copy), v12 (copy), l_Lighting_0 (copy), v15 (copy), v48 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy), l_identity_0 (ref)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("SkibidiEventSeed");
    local function _(v52) --[[ Line: 116 ]] --[[ Name: calculateCurrentSeed ]]
        -- upvalues: l_l_ReplicatedStorage_0_Attribute_0 (copy), l_v10_ActiveEventData_0 (copy)
        return l_l_ReplicatedStorage_0_Attribute_0 + (v52 - l_v10_ActiveEventData_0.startedAt) // 5;
    end;
    l_ReplicatedStorage_0:SetAttribute("SkibidiEvent", true);
    v23:Add(function() --[[ Line: 121 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("SkibidiEvent", nil);
    end);
    v24 = true;
    v23:Add(function() --[[ Line: 126 ]]
        -- upvalues: v24 (ref), v31 (ref)
        v24 = false;
        task.defer(function() --[[ Line: 129 ]]
            -- upvalues: v31 (ref)
            for _, v55 in v31 do
                v55:Destroy();
            end;
            table.clear(v31);
        end);
    end);
    v8:Activate("Blink");
    v11:UpdateOST();
    v12:Update();
    v23:Add(function() --[[ Line: 141 ]]
        -- upvalues: v8 (ref), v11 (ref), v12 (ref)
        v8:Activate("Blink");
        v11:UpdateOST();
        v12:Update();
    end);
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v23:Add(function() --[[ Line: 150 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v23:Clone(script.Atmosphere).Parent = l_Lighting_0;
    v23:Clone(script.MapVFX).Parent = workspace;
    local v57 = l_l_ReplicatedStorage_0_Attribute_0 + (workspace:GetServerTimeNow() - l_v10_ActiveEventData_0.startedAt) // 5;
    local v58 = Random.new(v57);
    local l_Children_0 = workspace.Events.Skibidi.Ground:GetChildren();
    local l_Children_1 = workspace.Events.Skibidi.WallTop:GetChildren();
    @native
    local function v66(v61) --[[ Line: 165 ]] --[[ Name: generateRandomTargetPosition ]]
        -- upvalues: l_Children_1 (copy), l_Children_0 (copy), v58 (ref)
        local v62 = if v61 == "WallTop" then l_Children_1 else l_Children_0;
        local v63 = v62[v58:NextInteger(1, #v62)];
        local l_CFrame_0 = v63.CFrame;
        local l_Size_0 = v63.Size;
        return l_CFrame_0 * CFrame.new(v58:NextNumber(-l_Size_0.X * 0.5, l_Size_0.X * 0.5), l_Size_0.Y * 0.5, v58:NextNumber(-l_Size_0.Z * 0.5, l_Size_0.Z * 0.5));
    end;
    v23:Add(v15.Simple(0.1, function() --[[ Line: 178 ]]
        -- upvalues: l_l_ReplicatedStorage_0_Attribute_0 (copy), l_v10_ActiveEventData_0 (copy), v57 (ref), v58 (ref), v66 (copy), v48 (ref)
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v68 = l_l_ReplicatedStorage_0_Attribute_0 + (l_workspace_ServerTimeNow_0 - l_v10_ActiveEventData_0.startedAt) // 5;
        if v57 ~= v68 then
            v57 = v68;
            v58 = Random.new(v68);
        end;
        local v69 = v66("Ground");
        v48(v69, "Ground");
        local v70 = v66("WallTop");
        v48(v70, "WallTop");
    end));
    local l_Character_0 = l_LocalPlayer_0.Character;
    v23:Add(l_LocalPlayer_0.CharacterAdded:Connect(function(v72) --[[ Line: 194 ]]
        -- upvalues: l_Character_0 (ref)
        l_Character_0 = v72;
    end));
    v23:Add(l_RunService_0.PostSimulation:Connect(function() --[[ Line: 198 ]]
        -- upvalues: l_identity_0 (ref), l_Character_0 (ref)
        l_identity_0 = l_Character_0:GetPivot();
    end));
end;
v7.OnStop = function(_) --[[ Line: 203 ]] --[[ Name: OnStop ]]
    -- upvalues: v23 (copy)
    v23:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 207 ]] --[[ Name: OnLoad ]]
    -- upvalues: v21 (copy), v48 (copy), v9 (copy), v22 (copy), v23 (copy), v18 (copy), l_Debris_0 (copy), v11 (copy), l_ReplicatedStorage_0 (copy)
    v21.OnClientEvent:Connect(function(v75) --[[ Line: 208 ]]
        -- upvalues: v48 (ref), v9 (ref)
        if typeof(v75) == "CFrame" then
            v48(v75, "Ground");
            return;
        else
            local v76 = v9:GetAnimals()[v75];
            if not v76 then
                return;
            else
                local l_AnimalModel_0 = v76.AnimalModel;
                local v78 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
                local l_Instance_0 = v76.Instance;
                if not l_Instance_0 or not l_Instance_0.PrimaryPart or not v78 then
                    return;
                else
                    v48(l_Instance_0:GetPivot(), "Ground", true);
                    return;
                end;
            end;
        end;
    end);
    v22.OnClientEvent:Connect(function(v80) --[[ Line: 233 ]]
        -- upvalues: v9 (ref), v23 (ref), v18 (ref), l_Debris_0 (ref), v11 (ref), l_ReplicatedStorage_0 (ref)
        local v81 = v9:GetAnimals()[v80];
        if not v81 then
            return;
        else
            local l_AnimalModel_1 = v81.AnimalModel;
            local v83 = l_AnimalModel_1 and l_AnimalModel_1.PrimaryPart;
            local l_Instance_1 = v81.Instance;
            local v85 = l_Instance_1 and l_Instance_1.PrimaryPart;
            if not v85 or not v83 then
                return;
            else
                local v86 = v23:Clone(script.Burst);
                v86:PivotTo(v85.CFrame * CFrame.new(0, (v86.Size.Y + l_AnimalModel_1:GetExtentsSize().Y) / 2, 0));
                v86.Parent = l_Instance_1;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v86;
                l_WeldConstraint_0.Part1 = v81.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v86;
                v18.emit(v86);
                l_Debris_0:AddItem(v86, 5);
                v11:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Skibidi.BrainrotHit, v85.CFrame.Position, false);
                return;
            end;
        end;
    end);
end;
return v7;