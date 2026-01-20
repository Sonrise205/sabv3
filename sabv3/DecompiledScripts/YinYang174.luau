local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Packages.Observers);
local v12 = require(l_ReplicatedStorage_0.Packages.Trove);
local v13 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v15 = v12.new();
v6.OnStart = function(_) --[[ Line: 23 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), l_Lighting_0 (copy), v15 (copy), l_RunService_0 (copy), v7 (copy), v13 (copy), v11 (copy), v10 (copy), v8 (copy)
    assert((v9:GetActiveEventData(l_Name_0)));
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v15:Add(function() --[[ Line: 30 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v15:Clone(script.AtmosphereYinYang).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v15:Add(function() --[[ Line: 39 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    local v19 = v15:Clone(script.SkyYinYang);
    v19.Parent = l_Lighting_0;
    v15:Add(l_RunService_0.PostSimulation:Connect(function(v20) --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        local l_v19_0 = v19;
        l_v19_0.SkyboxOrientation = l_v19_0.SkyboxOrientation + Vector3.new(0, -v20 * 0.36, 0);
    end));
    v7:Activate("Blink");
    v15:Add(function() --[[ Line: 52 ]]
        -- upvalues: v7 (ref)
        v7:Activate("Blink");
    end);
    v7:Run("YinYangEvent", "GrassRecolor");
    v15:Add(function() --[[ Line: 57 ]]
        -- upvalues: v7 (ref)
        v7:Stop("YinYangEvent", "GrassRecolor");
    end);
    v7:Run("YinYangEvent", "WallRecolor");
    v15:Add(function() --[[ Line: 62 ]]
        -- upvalues: v7 (ref)
        v7:Stop("YinYangEvent", "WallRecolor");
    end);
    v7:Run("YinYangEvent", "WallBottomRecolor");
    v15:Add(function() --[[ Line: 67 ]]
        -- upvalues: v7 (ref)
        v7:Stop("YinYangEvent", "WallBottomRecolor");
    end);
    v15:Clone(script.YinYangMap).Parent = workspace;
    local v22 = script.YinYangWeather:Clone();
    v22.Parent = workspace;
    v15:Add(function() --[[ Line: 75 ]]
        -- upvalues: v13 (ref), v22 (copy)
        v13.disable(v22);
        task.wait(4);
        v22:Destroy();
    end);
    v15:Add(v11.observeTag("HideInYinYang", function(v23) --[[ Line: 81 ]]
        local l_Parent_0 = v23.Parent;
        v23.Parent = script;
        return function() --[[ Line: 84 ]]
            -- upvalues: v23 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 85 ]]
                -- upvalues: v23 (ref), l_Parent_0 (ref)
                v23.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v10:Update();
    v8:UpdateOST();
end;
v6.OnStop = function(_) --[[ Line: 95 ]] --[[ Name: OnStop ]]
    -- upvalues: v15 (copy)
    v15:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 99 ]] --[[ Name: OnLoad ]]

end;
return v6;