local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = require(script:FindFirstAncestor("Effects").Parent.Types);
local v3 = {};
local v4 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v5 = require(l_ReplicatedStorage_0.Packages.Observers);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = script.Name;
local v8 = {
    Context = "Default", 
    Color = Color3.fromRGB(99, 95, 98)
};
local l_v8_0 = v8;
local v10 = v6.new();
local function v12() --[[ Line: 29 ]] --[[ Name: update ]]
    -- upvalues: v8 (copy), l_ReplicatedStorage_0 (copy), l_v8_0 (ref), v10 (copy)
    local l_v8_1 = v8;
    if l_ReplicatedStorage_0:GetAttribute("2026Event") then
        l_v8_1 = {
            Context = "2026", 
            Color = Color3.fromRGB(82, 98, 136), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("ConcertEvent") then
        l_v8_1 = {
            Context = "Concert", 
            Color = Color3.fromRGB(17, 17, 17)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("RapConcertEvent") then
        l_v8_1 = {
            Context = "RapConcert", 
            Color = Color3.fromRGB(17, 17, 17)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("DulDulDulEvent") then
        l_v8_1 = {
            Context = "DulDulDulEvent", 
            Color = Color3.fromRGB(129, 124, 128)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("MexicoEvent") then
        l_v8_1 = {
            Context = "MexicoEvent", 
            Color = Color3.fromRGB(138, 81, 45)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("IndonesiaEvent") then
        l_v8_1 = {
            Context = "IndonesiaEvent", 
            Color = Color3.fromRGB(95, 44, 0)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("MeowlEvent") then
        l_v8_1 = {
            Context = "MeowlEvent", 
            Color = Color3.fromRGB(111, 71, 30)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("TrickOrTreatEvent") then
        l_v8_1 = {
            Context = "TrickOrTreatEvent", 
            Color = Color3.fromRGB(83, 56, 33)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("GraveyardEvent") then
        l_v8_1 = {
            Context = "GraveyardEvent", 
            Color = Color3.fromRGB(72, 63, 138)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("GingerbreadTownEvent") then
        l_v8_1 = {
            Context = "GingerbreadTownEvent", 
            Color = Color3.fromRGB(99, 42, 16), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("WinterHourEvent") then
        l_v8_1 = {
            Context = "WinterHourEvent", 
            Color = Color3.fromRGB(99, 42, 16), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("WitchingHourEvent") then
        l_v8_1 = {
            Context = "WitchingHourEvent", 
            Color = Color3.fromRGB(99, 95, 98), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("YinYangEvent") then
        l_v8_1 = {
            Context = "YinYangEvent", 
            Color = Color3.fromRGB(204, 204, 204), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("RadioactiveEvent") then
        l_v8_1 = {
            Context = "RadioactiveEvent", 
            Color = Color3.fromRGB(42, 42, 42), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("CursedEvent") then
        l_v8_1 = {
            Context = "CursedEvent", 
            Color = Color3.fromRGB(65, 0, 0), 
            TweenTime = 0
        };
    end;
    if l_v8_0.Context == l_v8_1.Context then
        return;
    else
        l_v8_0 = l_v8_1;
        v10:Fire();
        return;
    end;
end;
v3.OnStart = function(_) --[[ Line: 123 ]] --[[ Name: OnStart ]]
    -- upvalues: v12 (copy)
    v12();
end;
v3.OnUpdate = function(_) --[[ Line: 127 ]] --[[ Name: OnUpdate ]]
    -- upvalues: v12 (copy)
    v12();
end;
v3.OnLoad = function(_) --[[ Line: 131 ]] --[[ Name: OnLoad ]]
    -- upvalues: v5 (copy), v4 (copy), l_v8_0 (ref), v10 (copy)
    v5.observeTag("WallBottom", function(v16) --[[ Line: 132 ]]
        -- upvalues: v4 (ref), l_v8_0 (ref), v10 (ref)
        local v17 = nil;
        local function v18() --[[ Line: 135 ]] --[[ Name: runTween ]]
            -- upvalues: v17 (ref), v4 (ref), v16 (copy), l_v8_0 (ref)
            if v17 then
                v17:Cancel();
            end;
            v17 = v4(v16, TweenInfo.new(2), {
                Color = if type(l_v8_0.Color) == "table" then l_v8_0.Color[v16:GetAttribute("Side") or "Left"] or l_v8_0.Color.Left or select(2, next(l_v8_0)) else l_v8_0.Color
            });
        end;
        local v19 = v10:Connect(v18);
        task.spawn(v18);
        return function() --[[ Line: 148 ]]
            -- upvalues: v19 (copy), v17 (ref)
            v19:Disconnect();
            v17:Cancel();
        end;
    end, {
        workspace
    });
end;
return v3;