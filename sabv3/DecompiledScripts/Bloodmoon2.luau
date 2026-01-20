local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v12 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local _ = script.Name;
local v16 = v12.new();
v6.OnStart = function(_) --[[ Line: 24 ]] --[[ Name: OnStart ]]
    -- upvalues: l_Lighting_0 (copy), v16 (copy), v10 (copy), v8 (copy)
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v16:Add(function() --[[ Line: 28 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.AtmosphereBloodmoon).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v16:Add(function() --[[ Line: 38 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.SkyBloodmoon).Parent = l_Lighting_0;
    v10:Update();
    v8:UpdateOST();
end;
v6.OnStop = function(_) --[[ Line: 49 ]] --[[ Name: OnStop ]]
    -- upvalues: v16 (copy)
    v16:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 53 ]] --[[ Name: OnLoad ]]

end;
return v6;