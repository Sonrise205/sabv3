local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v5 = {};
local v6 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v7 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v11 = require(l_ReplicatedStorage_0.Packages.Trove);
local v12 = require(l_ReplicatedStorage_0.Packages.Net);
local v13 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v15 = v12:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v16 = v11.new();
local function v43(v17, v18, v19) --[[ Line: 26 ]] --[[ Name: growBush ]]
    -- upvalues: v16 (copy), v10 (copy)
    local function v30(v20, v21, v22, v23) --[[ Line: 27 ]] --[[ Name: growPart ]]
        -- upvalues: v16 (ref), v19 (copy), v10 (ref)
        local l_CFrame_0 = v20.CFrame;
        local v25 = Vector3.new(v23 and 0 or v21.X, 0, v23 and 0 or v21.Z);
        local v26 = l_CFrame_0 * CFrame.new(0, -(v21.Y - v25.Y) / 2, 0);
        v20.Size = v25;
        v20.CFrame = v26;
        local l_Transparency_0 = v20.Transparency;
        v20.Transparency = 1;
        v16:Add(task.delay(if v19 then v19(v22) else v22, function() --[[ Line: 38 ]]
            -- upvalues: v20 (copy), l_Transparency_0 (copy), v19 (ref), v22 (copy), v10 (ref), v21 (copy), l_CFrame_0 (copy)
            v20.Transparency = l_Transparency_0;
            local v28 = if v19 then v19(v22 + 1) else 1;
            local v29 = TweenInfo.new(v28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            v10(v20, v29, {
                Size = v21
            });
            v10(v20, v29, {
                CFrame = l_CFrame_0
            });
        end));
    end;
    local v31 = {};
    local v32 = 1e999;
    local v33 = -1e999;
    for _, v35 in v17:GetDescendants() do
        if v35:IsA("BasePart") and v35.Transparency < 1 then
            table.insert(v31, v35);
            v32 = math.min(v32, v35.Position.Y);
            v33 = math.max(v33, v35.Position.Y);
        end;
    end;
    table.sort(v31, function(v36, v37) --[[ Line: 64 ]]
        return v36.Position.Y < v37.Position.Y;
    end);
    local v38 = v33 - v32;
    for _, v40 in v31 do
        local v41 = (v40.Position.Y - v32) / v38 * v18 + 0.25;
        local v42 = v40:FindFirstAncestorOfClass("Model").Name == "strawberry";
        if v42 then
            v41 = v41 + 1;
        end;
        v30(v40, v40.Size, v41, v42);
    end;
end;
v5.OnStart = function(_) --[[ Line: 80 ]] --[[ Name: OnStart ]]
    -- upvalues: v8 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v16 (copy), v6 (copy), l_Lighting_0 (copy), v13 (copy), v43 (copy)
    local l_v8_ActiveEventData_0 = v8:GetActiveEventData(l_Name_0);
    assert(l_v8_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("StrawberryEvent", true);
    v16:Add(function() --[[ Line: 85 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("StrawberryEvent", nil);
    end);
    v6:Activate("Blink");
    v6:Run("StrawberryEvent", "GrassRecolor");
    v16:Add(function() --[[ Line: 91 ]]
        -- upvalues: v6 (ref)
        v6:Stop("StrawberryEvent", "GrassRecolor");
        v6:Activate("Blink");
    end);
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v16:Add(function() --[[ Line: 99 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.Atmosphere).Parent = l_Lighting_0;
    local l_Sky_0 = l_Lighting_0:FindFirstChildOfClass("Sky");
    if l_Sky_0 then
        l_Sky_0.Parent = script;
        v16:Add(function() --[[ Line: 109 ]]
            -- upvalues: l_Sky_0 (copy), l_Lighting_0 (ref)
            l_Sky_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.Sky).Parent = l_Lighting_0;
    local v48 = v16:Clone(script.StrawberryVFX);
    v48.Parent = workspace;
    v13.enable(v48);
    local v49 = v16:Clone(script.Bushes);
    local function _(v50) --[[ Line: 122 ]] --[[ Name: calculateTimeLeftFor ]]
        -- upvalues: l_v8_ActiveEventData_0 (copy)
        return l_v8_ActiveEventData_0.startedAt + v50 - workspace:GetServerTimeNow();
    end;
    local v52 = Random.new();
    for _, v54 in v49:GetChildren() do
        v43(v54, v52:NextNumber(5, 7), function(v55) --[[ Line: 129 ]]
            -- upvalues: l_v8_ActiveEventData_0 (copy)
            return l_v8_ActiveEventData_0.startedAt + v55 - workspace:GetServerTimeNow();
        end);
    end;
    v49.Parent = workspace;
end;
v5.OnStop = function(_) --[[ Line: 137 ]] --[[ Name: OnStop ]]
    -- upvalues: v16 (copy)
    v16:Destroy();
end;
v5.OnLoad = function(_) --[[ Line: 141 ]] --[[ Name: OnLoad ]]
    -- upvalues: v15 (copy), v7 (copy), v16 (copy), v13 (copy), l_Debris_0 (copy), v9 (copy), l_ReplicatedStorage_0 (copy)
    v15.OnClientEvent:Connect(function(v58) --[[ Line: 142 ]]
        -- upvalues: v7 (ref), v16 (ref), v13 (ref), l_Debris_0 (ref), v9 (ref), l_ReplicatedStorage_0 (ref)
        local v59 = v7:GetAnimals()[v58];
        if not v59 then
            return;
        else
            local l_AnimalModel_0 = v59.AnimalModel;
            local v61 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v59.Instance;
            local v63 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v63 or not v61 then
                return;
            else
                local v64 = v16:Clone(script.Burst);
                v64:PivotTo(v63.CFrame * CFrame.new(0, (v64.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v64.Parent = l_Instance_0;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v64;
                l_WeldConstraint_0.Part1 = v59.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v64;
                v13.emit(v64);
                l_Debris_0:AddItem(v64, 5);
                v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Strawberry.BrainrotHit, v63.CFrame.Position, false);
                return;
            end;
        end;
    end);
end;
return v5;