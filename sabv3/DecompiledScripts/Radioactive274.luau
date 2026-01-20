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
local v13 = require(l_ReplicatedStorage_0.Packages.Spr);
local v14 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v16 = v12.new();
v6.OnStart = function(_) --[[ Line: 24 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), l_Lighting_0 (copy), v16 (copy), v7 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), v14 (copy), v11 (copy), v10 (copy), v8 (copy)
    assert((v9:GetActiveEventData(l_Name_0)));
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v16:Add(function() --[[ Line: 31 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.AtmosphereRadioactive).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v16:Add(function() --[[ Line: 40 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v16:Clone(script.SkyRadioactive).Parent = l_Lighting_0;
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
    v7:Run("RadioactiveEvent", "GrassRecolor");
    v16:Add(function() --[[ Line: 58 ]]
        -- upvalues: v7 (ref)
        v7:Stop("RadioactiveEvent", "GrassRecolor");
    end);
    v7:Run("RadioactiveEvent", "WallRecolor");
    v16:Add(function() --[[ Line: 63 ]]
        -- upvalues: v7 (ref)
        v7:Stop("RadioactiveEvent", "WallRecolor");
    end);
    v7:Run("RadioactiveEvent", "WallBottomRecolor");
    v16:Add(function() --[[ Line: 68 ]]
        -- upvalues: v7 (ref)
        v7:Stop("RadioactiveEvent", "WallBottomRecolor");
    end);
    local v21 = v16:Clone(script.RadioactiveMap);
    v21.Parent = workspace;
    local function v28() --[[ Line: 75 ]] --[[ Name: updateDisplay ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v21 (copy), v20 (ref), v13 (ref)
        local v22 = math.floor(math.clamp(l_ReplicatedStorage_0:GetAttribute("RadioactiveAlpha") or 0, 0, 1) * 10);
        for _, v24 in v21.CaveSign.PowerGui.SurfaceGui.Bar:GetChildren() do
            if v24:IsA("GuiObject") then
                if v20 then
                    local v25 = tonumber(v24.Name);
                    if v25 then
                        local l_Visual_0 = v24:FindFirstChild("Visual");
                        if l_Visual_0 then
                            local l_l_Visual_0_Attribute_0 = l_Visual_0:GetAttribute("DefaultColor");
                            if not l_l_Visual_0_Attribute_0 then
                                l_l_Visual_0_Attribute_0 = l_Visual_0.BackgroundColor3;
                                l_Visual_0:SetAttribute("DefaultColor", l_l_Visual_0_Attribute_0);
                            end;
                            v13.target(l_Visual_0, 1, 2, {
                                BackgroundColor3 = if v22 < v25 then Color3.new(0, 0, 0) else l_l_Visual_0_Attribute_0
                            });
                            task.wait(0.2);
                        end;
                    end;
                else
                    break;
                end;
            end;
        end;
    end;
    task.spawn(function() --[[ Line: 111 ]]
        -- upvalues: v21 (copy)
        for _, v30 in v21.CaveSign.PowerGui.SurfaceGui.Bar:GetChildren() do
            if v30:IsA("GuiObject") then
                if not v30.Visual:GetAttribute("DefaultColor") then
                    local l_BackgroundColor3_0 = v30.Visual.BackgroundColor3;
                    v30.Visual:SetAttribute("DefaultColor", l_BackgroundColor3_0);
                end;
                v30.Visual.BackgroundColor3 = Color3.new(0, 0, 0);
            end;
        end;
    end);
    v16:Add(l_ReplicatedStorage_0:GetAttributeChangedSignal("RadioactiveAlpha"):Connect(v28));
    task.spawn(v28);
    local v32 = script.RadioactiveWeather:Clone();
    v32.Parent = workspace;
    v16:Add(function() --[[ Line: 132 ]]
        -- upvalues: v14 (ref), v32 (copy)
        v14.disable(v32);
        task.wait(4);
        v32:Destroy();
    end);
    v16:Add(v11.observeTag("HideInRadioactive", function(v33) --[[ Line: 138 ]]
        local l_Parent_0 = v33.Parent;
        v33.Parent = script;
        return function() --[[ Line: 141 ]]
            -- upvalues: v33 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 142 ]]
                -- upvalues: v33 (ref), l_Parent_0 (ref)
                v33.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v10:Update();
    v8:UpdateOST();
end;
v6.OnStop = function(_) --[[ Line: 152 ]] --[[ Name: OnStop ]]
    -- upvalues: v16 (copy)
    v16:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 156 ]] --[[ Name: OnLoad ]]

end;
return v6;