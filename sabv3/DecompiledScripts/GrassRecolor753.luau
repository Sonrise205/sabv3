local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = require(script:FindFirstAncestor("Effects").Parent.Types);
local v3 = {};
local v4 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v5 = require(l_ReplicatedStorage_0.Packages.Observers);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = script.Name;
local v8 = {
    "WitchingHourEvent", 
    "IndonesiaEvent"
};
local v9 = {
    Context = "Default", 
    Top = Color3.fromRGB(31, 128, 29), 
    Bottom = Color3.fromRGB(31, 128, 29), 
    TweenTime = 0, 
    Carpet = Color3.fromRGB(196, 40, 28)
};
local l_v9_0 = v9;
local v11 = v6.new();
local function v13() --[[ Line: 44 ]] --[[ Name: update ]]
    -- upvalues: v9 (copy), l_ReplicatedStorage_0 (copy), l_v9_0 (ref), v11 (copy)
    local l_v9_1 = v9;
    if l_ReplicatedStorage_0:GetAttribute("LanceEvent") then
        l_v9_1 = {
            Context = "Lance", 
            Bottom = Color3.fromRGB(209, 97, 45), 
            Top = Color3.fromRGB(111, 59, 24), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("2026Event") then
        l_v9_1 = {
            Context = "2026", 
            Top = Color3.fromRGB(48, 57, 79), 
            Bottom = Color3.fromRGB(35, 35, 35), 
            TweenTime = 0, 
            Carpet = Color3.fromRGB(60, 60, 60)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("ConcertEvent") then
        l_v9_1 = {
            Context = "Concert", 
            Top = Color3.fromRGB(157, 155, 151), 
            Bottom = Color3.fromRGB(46, 71, 89), 
            TweenTime = 2
        };
    elseif l_ReplicatedStorage_0:GetAttribute("RapConcertEvent") then
        l_v9_1 = {
            Context = "RapConcert", 
            Top = Color3.fromRGB(157, 155, 151), 
            Bottom = Color3.fromRGB(46, 71, 89), 
            TweenTime = 2
        };
    elseif l_ReplicatedStorage_0:GetAttribute("BrazilEvent") then
        l_v9_1 = {
            Context = "Brazil", 
            Top = Color3.fromRGB(215, 92, 31), 
            Bottom = Color3.fromRGB(215, 92, 31), 
            TweenTime = 2
        };
    elseif l_ReplicatedStorage_0:GetAttribute("MexicoEvent") then
        l_v9_1 = {
            Context = "MexicoEvent", 
            Top = Color3.fromRGB(160, 95, 53), 
            Bottom = Color3.fromRGB(175, 126, 67), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("IndonesiaEvent") then
        l_v9_1 = {
            Context = "IndonesiaEvent", 
            Top = Color3.fromRGB(160, 95, 53), 
            Bottom = Color3.fromRGB(56, 109, 63), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("CrabRave") then
        l_v9_1 = {
            Context = "CrabRave", 
            Top = Color3.fromRGB(235, 178, 55), 
            Bottom = Color3.fromRGB(235, 178, 55), 
            TweenTime = 1.95
        };
    elseif l_ReplicatedStorage_0:GetAttribute("WaterEvent") then
        l_v9_1 = {
            Context = "WaterEvent", 
            Top = Color3.fromRGB(226, 155, 64), 
            Bottom = Color3.fromRGB(226, 155, 64), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("StrawberryEvent") then
        l_v9_1 = {
            Context = "StrawberryEvent", 
            Top = Color3.fromRGB(255, 255, 255), 
            Bottom = Color3.fromRGB(255, 255, 255), 
            TweenTime = 0, 
            MaterialVariant = "Strawberry Stud", 
            Carpet = Color3.fromRGB(31, 128, 29)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("MeowlEvent") then
        l_v9_1 = {
            Context = "MeowlEvent", 
            Top = Color3.fromRGB(69, 97, 44), 
            Bottom = Color3.fromRGB(18, 65, 29), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("DulDulDulEvent") then
        l_v9_1 = {
            Context = "DulDulDulEvent", 
            Top = Color3.fromRGB(137, 136, 139), 
            Bottom = Color3.fromRGB(87, 127, 41), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("ChicleteiraBicicleteiraEvent") then
        l_v9_1 = {
            Context = "ChicleteiraBicicleteiraEvent", 
            Top = Color3.fromRGB(85, 67, 67), 
            Bottom = Color3.fromRGB(31, 128, 29), 
            TweenTime = 0, 
            Carpet = Color3.fromRGB(61, 53, 57)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("TrickOrTreatEvent") then
        l_v9_1 = {
            Context = "TrickOrTreatEvent", 
            Top = Color3.fromRGB(56, 109, 60), 
            Bottom = Color3.fromRGB(56, 109, 60), 
            TweenTime = 0, 
            Carpet = Color3.fromRGB(27, 42, 53)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("GraveyardEvent") then
        l_v9_1 = {
            Context = "GraveyardEvent", 
            Top = Color3.fromRGB(47, 102, 72), 
            Bottom = Color3.fromRGB(255, 255, 255), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("GingerbreadTownEvent") then
        l_v9_1 = {
            Context = "GingerbreadTownEvent", 
            Top = Color3.fromRGB(145, 161, 168), 
            Bottom = Color3.fromRGB(145, 161, 168), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("WinterHourEvent") then
        l_v9_1 = {
            Context = "WinterHourEvent", 
            Top = Color3.fromRGB(145, 161, 168), 
            Bottom = Color3.fromRGB(145, 161, 168), 
            Carpet = Color3.fromRGB(87, 153, 166), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("WitchingHourEvent") then
        l_v9_1 = {
            Context = "WitchingHourEvent", 
            Top = Color3.fromRGB(39, 10, 59), 
            Bottom = Color3.fromRGB(39, 10, 59), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("YinYangEvent") then
        l_v9_1 = {
            Context = "YinYangEvent", 
            Top = Color3.fromRGB(204, 204, 204), 
            Bottom = Color3.fromRGB(0, 0, 0), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("RadioactiveEvent") then
        l_v9_1 = {
            Context = "RadioactiveEvent", 
            Top = Color3.fromRGB(31, 128, 29), 
            Bottom = Color3.fromRGB(27, 42, 53), 
            TweenTime = 0, 
            Carpet = Color3.fromRGB(196, 147, 0)
        };
    elseif l_ReplicatedStorage_0:GetAttribute("CursedEvent") then
        l_v9_1 = {
            Context = "CursedEvent", 
            Top = Color3.fromRGB(0, 0, 0), 
            Bottom = Color3.fromRGB(42, 17, 0), 
            TweenTime = 0
        };
    elseif l_ReplicatedStorage_0:GetAttribute("GalaxyEvent") then
        l_v9_1 = {
            Context = "GalaxyEvent", 
            Top = Color3.fromRGB(42, 99, 255), 
            Bottom = Color3.fromRGB(42, 99, 255), 
            TweenTime = 2
        };
    elseif l_ReplicatedStorage_0:GetAttribute("ExtinctEvent") then
        l_v9_1 = {
            Context = "ExtinctEvent", 
            Top = Color3.fromRGB(108, 83, 58), 
            Bottom = Color3.fromRGB(108, 83, 58), 
            TweenTime = 0.5
        };
    elseif l_ReplicatedStorage_0:GetAttribute("MoltenEvent") then
        l_v9_1 = {
            Context = "Molten", 
            Top = Color3.fromRGB(0, 0, 0), 
            Bottom = Color3.fromRGB(0, 0, 0), 
            TweenTime = 0.5
        };
    elseif l_ReplicatedStorage_0:GetAttribute("Snow") then
        l_v9_1 = {
            Context = "Snow", 
            Top = Color3.fromRGB(190, 190, 190), 
            Bottom = Color3.fromRGB(190, 190, 190), 
            TweenTime = 8
        };
    end;
    if l_v9_0.Context == l_v9_1.Context then
        return;
    else
        l_v9_0 = l_v9_1;
        v11:Fire();
        return;
    end;
end;
v3.OnStart = function(_) --[[ Line: 238 ]] --[[ Name: OnStart ]]
    -- upvalues: v13 (copy)
    v13();
end;
v3.OnUpdate = function(_) --[[ Line: 242 ]] --[[ Name: OnUpdate ]]
    -- upvalues: v13 (copy)
    v13();
end;
v3.OnLoad = function(_) --[[ Line: 246 ]] --[[ Name: OnLoad ]]
    -- upvalues: v5 (copy), l_v9_0 (ref), v4 (copy), v11 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v9 (copy)
    v5.observeTag("Grass", function(v17) --[[ Line: 247 ]]
        -- upvalues: l_v9_0 (ref), v4 (ref), v11 (ref)
        local v18 = nil;
        local function v20() --[[ Line: 250 ]] --[[ Name: runTween ]]
            -- upvalues: v18 (ref), v17 (copy), l_v9_0 (ref), v4 (ref)
            if v18 then
                v18:Cancel();
            end;
            v17.MaterialVariant = l_v9_0.MaterialVariant or "";
            local v19 = v17:GetAttribute("Bottom") and "Bottom" or "Top";
            v18 = v4(v17, TweenInfo.new(l_v9_0.TweenTime), {
                Color = if type(l_v9_0[v19]) == "table" then l_v9_0[v19][v17:GetAttribute("Side") or "Left"] or l_v9_0[v19].Left or select(2, next(l_v9_0[v19])) else l_v9_0[v19]
            });
        end;
        local v21 = v11:Connect(v20);
        task.spawn(v20);
        return function() --[[ Line: 267 ]]
            -- upvalues: v21 (copy), v18 (ref)
            v21:Disconnect();
            v18:Cancel();
        end;
    end, {
        workspace
    });
    v5.observeTag("Carpet", function(v22) --[[ Line: 273 ]]
        -- upvalues: v8 (ref), l_ReplicatedStorage_0 (ref), v4 (ref), l_v9_0 (ref), v9 (ref), v11 (ref)
        local v23 = nil;
        local function v27() --[[ Line: 276 ]] --[[ Name: runTween ]]
            -- upvalues: v23 (ref), v8 (ref), l_ReplicatedStorage_0 (ref), v22 (copy), v4 (ref), l_v9_0 (ref), v9 (ref)
            if v23 then
                v23:Cancel();
            end;
            local v24 = false;
            for _, v26 in v8 do
                if l_ReplicatedStorage_0:GetAttribute(v26) then
                    v24 = true;
                    break;
                end;
            end;
            v22.Transparency = v24 and 1 or 0;
            v23 = v4(v22, TweenInfo.new(l_v9_0.TweenTime), {
                Color = l_v9_0.Carpet or v9.Carpet
            });
        end;
        local v28 = {
            v11:Connect(v27)
        };
        for _, v30 in v8 do
            table.insert(v28, l_ReplicatedStorage_0:GetAttributeChangedSignal(v30):Connect(v27));
        end;
        task.spawn(v27);
        return function() --[[ Line: 302 ]]
            -- upvalues: v28 (copy), v23 (ref)
            for _, v32 in v28 do
                v32:Disconnect();
            end;
            v23:Cancel();
        end;
    end, {
        workspace
    });
end;
return v3;