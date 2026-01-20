local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController);
local v9 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v10 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local _ = script.Name;
local v13 = v10.new();
v6.OnStart = function(_) --[[ Line: 21 ]] --[[ Name: OnStart ]]
    -- upvalues: l_Lighting_0 (copy), v13 (copy), v9 (copy), v7 (copy)
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v13:Add(function() --[[ Line: 25 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v13:Clone(script.AtmosphereCandy).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v13:Add(function() --[[ Line: 35 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v13:Clone(script.SkyCandy).Parent = l_Lighting_0;
    local v17 = script.CandyWeather:Clone();
    v17.Parent = workspace;
    v13:Add(function() --[[ Line: 44 ]]
        -- upvalues: v17 (copy)
        for _, v19 in v17:GetDescendants() do
            if v19:IsA("ParticleEmitter") then
                v19.Enabled = false;
            end;
        end;
        task.wait(4);
        v17:Destroy();
    end);
    v9:Update();
    v7:UpdateOST();
end;
v6.OnStop = function(_) --[[ Line: 60 ]] --[[ Name: OnStop ]]
    -- upvalues: v13 (copy)
    v13:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 64 ]] --[[ Name: OnLoad ]]

end;
return v6;