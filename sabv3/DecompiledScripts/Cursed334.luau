local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
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
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local _ = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v16 = v12.new();
v6.OnStart = function(_) --[[ Line: 24 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), l_Lighting_0 (copy), v16 (copy), v7 (copy), v11 (copy), v10 (copy), v8 (copy)
    assert((v9:GetActiveEventData(l_Name_0)));
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v16:Add(function() --[[ Line: 31 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.AtmosphereCursed).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v16:Add(function() --[[ Line: 40 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.SkyCursed).Parent = l_Lighting_0;
    local v20 = true;
    v16:Add(function() --[[ Line: 48 ]]
        -- upvalues: v20 (ref)
        v20 = false;
    end);
    v7:Activate("Blink");
    v16:Add(function() --[[ Line: 53 ]]
        -- upvalues: v7 (ref)
        v7:Activate("Blink");
    end);
    v7:Run("CursedEvent", "GrassRecolor");
    v16:Add(function() --[[ Line: 58 ]]
        -- upvalues: v7 (ref)
        v7:Stop("CursedEvent", "GrassRecolor");
    end);
    v7:Run("CursedEvent", "WallRecolor");
    v16:Add(function() --[[ Line: 63 ]]
        -- upvalues: v7 (ref)
        v7:Stop("CursedEvent", "WallRecolor");
    end);
    v7:Run("CursedEvent", "WallBottomRecolor");
    v16:Add(function() --[[ Line: 68 ]]
        -- upvalues: v7 (ref)
        v7:Stop("CursedEvent", "WallBottomRecolor");
    end);
    v16:Clone(script.CursedMap).Parent = workspace;
    v16:Add(v11.observeTag("HideInCursed", function(v21) --[[ Line: 75 ]]
        local l_Parent_0 = v21.Parent;
        v21.Parent = script;
        return function() --[[ Line: 78 ]]
            -- upvalues: v21 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 79 ]]
                -- upvalues: v21 (ref), l_Parent_0 (ref)
                v21.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v10:Update();
    v8:UpdateOST();
end;
v6.OnStop = function(_) --[[ Line: 89 ]] --[[ Name: OnStop ]]
    -- upvalues: v16 (copy)
    v16:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 93 ]] --[[ Name: OnLoad ]]

end;
return v6;