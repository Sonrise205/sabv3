local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local v13 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local v15 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v17 = v13.new();
v6.OnStart = function(_) --[[ Line: 25 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v17 (copy), l_TweenService_0 (copy), v11 (copy), v15 (copy), v7 (copy), l_Lighting_0 (copy), v10 (copy)
    local l_v9_ActiveEventData_0 = v9:GetActiveEventData(l_Name_0);
    assert(l_v9_ActiveEventData_0);
    task.spawn(function() --[[ Line: 29 ]]
        -- upvalues: v8 (ref)
        v8:PlaySound("Sounds.Events.Molten.LavaActivate");
    end);
    local function _(v20, v21) --[[ Line: 33 ]] --[[ Name: getTimeLeftForSync ]]
        -- upvalues: l_v9_ActiveEventData_0 (copy)
        return l_v9_ActiveEventData_0.startedAt + v20 - (v21 or workspace:GetServerTimeNow());
    end;
    local v23 = l_ReplicatedStorage_0.Models.Events.Molten.Craters:Clone();
    v23.Parent = workspace;
    local l_v23_Children_0 = v23:GetChildren();
    table.sort(l_v23_Children_0, function(v25, v26) --[[ Line: 41 ]]
        return tonumber(v25.Name) < tonumber(v26.Name);
    end);
    local v27 = {};
    for _, v29 in l_v23_Children_0 do
        v27[v29] = v29.PrimaryPart:GetPivot();
    end;
    v17:Add(function() --[[ Line: 50 ]]
        -- upvalues: l_v23_Children_0 (copy), l_TweenService_0 (ref), v27 (copy), v23 (copy)
        for _, v31 in l_v23_Children_0 do
            local l_v31_ExtentsSize_0 = v31:GetExtentsSize();
            l_TweenService_0:Create(v31.PrimaryPart, TweenInfo.new(1 + math.random() + math.random(), Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                CFrame = v27[v31] - Vector3.new(0, l_v31_ExtentsSize_0.Y * 1.1, 0)
            }):Play();
        end;
        task.wait(3);
        v23:Destroy();
    end);
    local v33 = v11.BumpS:Clone();
    v17:Add(v33);
    v33.Sustain = true;
    v17:Add(v11.BindShakeToCamera(v33, workspace.CurrentCamera));
    v33:Start();
    local v34 = l_v9_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow();
    v17:Add(task.delay(v34, function() --[[ Line: 72 ]]
        -- upvalues: v33 (copy)
        v33:StopSustain();
    end));
    local v35 = v17:Clone(script.MoltenWeather);
    v15.disable(v35);
    v35.Parent = workspace;
    v17:Add(task.delay(v34, function() --[[ Line: 80 ]]
        -- upvalues: v7 (ref), l_Lighting_0 (ref), v17 (ref), v15 (ref), v35 (copy)
        v7:Activate("Blink");
        local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
        if l_Atmosphere_0 then
            l_Atmosphere_0.Parent = script;
            v17:Add(function() --[[ Line: 86 ]]
                -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
                l_Atmosphere_0.Parent = l_Lighting_0;
            end);
        end;
        v17:Clone(script.AtmosphereMolten).Parent = l_Lighting_0;
        local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
        if l_Cartoon_0 then
            l_Cartoon_0.Parent = script;
            v17:Add(function() --[[ Line: 96 ]]
                -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
                l_Cartoon_0.Parent = l_Lighting_0;
            end);
        end;
        v17:Clone(script.SkyMolten).Parent = l_Lighting_0;
        v15.enable(v35);
    end));
    v17:Add(function() --[[ Line: 106 ]]
        -- upvalues: v7 (ref)
        v7:Activate("Blink");
    end);
    v7:Run("MoltenEvent", "GrassRecolor");
    v17:Add(function() --[[ Line: 111 ]]
        -- upvalues: v7 (ref)
        v7:Stop("MoltenEvent", "GrassRecolor");
    end);
    local v38 = Random.new();
    for _, v40 in ipairs(l_v23_Children_0) do
        local l_v40_ExtentsSize_0 = v40:GetExtentsSize();
        local l_v40_PrimaryPartCFrame_0 = v40:GetPrimaryPartCFrame();
        v40:PivotTo(l_v40_PrimaryPartCFrame_0 * CFrame.new(0, -l_v40_ExtentsSize_0.Y * 1.1, 0));
        local v43 = {
            CFrame = l_v40_PrimaryPartCFrame_0
        };
        l_TweenService_0:Create(v40.PrimaryPart, TweenInfo.new(v38:NextNumber(3, 7), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v43):Play();
    end;
    v10:Update();
    v8:UpdateOST();
end;
v6.OnStop = function(_) --[[ Line: 135 ]] --[[ Name: OnStop ]]
    -- upvalues: v17 (copy)
    v17:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 139 ]] --[[ Name: OnLoad ]]

end;
return v6;