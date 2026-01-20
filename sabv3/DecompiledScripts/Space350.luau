local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = require(script:FindFirstAncestor("Effects").Parent.Types);
local v3 = {};
local v4 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v5 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v6 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v7 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local _ = script.Name;
local v10 = v7.new();
local _ = workspace.CurrentCamera;
v3.OnStart = function(_) --[[ Line: 19 ]] --[[ Name: OnStart ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v10 (copy), v5 (copy), v6 (copy), v4 (copy)
    l_ReplicatedStorage_0:SetAttribute("Effect_Space", true);
    v10:Add(function() --[[ Line: 21 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("Effect_Space", nil);
    end);
    v5:UpdateOST();
    v6:Update();
    local v13 = v10:Extend();
    local v14 = true;
    v10:Add(function() --[[ Line: 33 ]]
        -- upvalues: v14 (ref)
        v14 = false;
    end);
    local v15 = nil;
    local function v21() --[[ Line: 39 ]] --[[ Name: runUpdate ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v14 (ref), v15 (ref), v4 (ref), v5 (ref), v6 (ref), v13 (copy)
        local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("NyanCatsEvent");
        local v17 = if not v14 then nil else if l_l_ReplicatedStorage_0_Attribute_0 then script.Nyan else script.Space;
        if v17 == v15 then
            return;
        else
            v15 = v17;
            v4:Activate("Blink");
            v5:UpdateOST();
            v6:Update();
            v13:Destroy();
            if v17 then
                local v18 = v13:Clone(v17);
                v18.Parent = workspace;
                v18.spacemeshbg.Transparency = 0;
                for _, v20 in v18:GetDescendants() do
                    if v20:IsA("ParticleEmitter") or v20:IsA("Beam") then
                        v20.Enabled = true;
                    end;
                end;
            end;
            return;
        end;
    end;
    l_ReplicatedStorage_0:GetAttributeChangedSignal("NyanCatsEvent"):Connect(v21);
    v10:Add(task.spawn(v21));
    v10:Add(v21);
end;
v3.OnStop = function(_) --[[ Line: 75 ]] --[[ Name: OnStop ]]
    -- upvalues: v10 (copy)
    v10:Destroy();
end;
v3.OnLoad = function(_) --[[ Line: 79 ]] --[[ Name: OnLoad ]]

end;
return v3;