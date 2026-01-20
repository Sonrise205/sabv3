local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v6 = nil;
local v7 = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = nil;
local v18 = {
    IsNight = function(_) --[[ Line: 26 ]] --[[ Name: IsNight ]]
        return workspace:GetServerTimeNow() % 1800 >= 900;
    end, 
    IsDay = function(_) --[[ Line: 31 ]] --[[ Name: IsDay ]]
        return workspace:GetServerTimeNow() % 1800 < 900;
    end, 
    Update = function(_) --[[ Line: 36 ]] --[[ Name: Update ]]
        -- upvalues: v6 (ref), v9 (ref), l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), l_Lighting_0 (copy), v7 (ref), l_TweenService_0 (copy)
        v6 = os.clock();
        local v13 = true;
        local v14 = nil;
        if v9 then
            local v15 = v9:Get("Overrides")[1];
            v14 = if v15 then v15.state else nil;
        end;
        if l_ReplicatedStorage_0:GetAttribute("BloodmoonEvent") then
            v14 = 20;
        end;
        if l_ReplicatedStorage_0:GetAttribute("CandyEvent") then
            v14 = 14;
        end;
        if l_ReplicatedStorage_0:GetAttribute("GalaxyEvent") or l_ReplicatedStorage_0:GetAttribute("YinYangEvent") or l_ReplicatedStorage_0:GetAttribute("RadioactiveEvent") or l_ReplicatedStorage_0:GetAttribute("UFOEvent") or l_ReplicatedStorage_0:GetAttribute("StrawberryEvent") or l_ReplicatedStorage_0:GetAttribute("WitchingHourEvent") or l_ReplicatedStorage_0:GetAttribute("WinterHourEvent") or l_ReplicatedStorage_0:GetAttribute("GingerbreadTownEvent") or l_ReplicatedStorage_0:GetAttribute("SkibidiEvent") then
            v14 = 11;
            v13 = false;
        end;
        if l_ReplicatedStorage_0:GetAttribute("TrickOrTreatEvent") or l_ReplicatedStorage_0:GetAttribute("GraveyardEvent") then
            v14 = 5;
            v13 = false;
        end;
        if l_ReplicatedStorage_0:GetAttribute("Effect_Space") or l_ReplicatedStorage_0:GetAttribute("NyanCatsEvent") or l_ReplicatedStorage_0:GetAttribute("4thOfJulyEvent") or l_ReplicatedStorage_0:GetAttribute("10BVisitsEvent") or l_ReplicatedStorage_0:GetAttribute("GlitchEvent") or l_ReplicatedStorage_0:GetAttribute("MoltenEvent") or l_ReplicatedStorage_0:GetAttribute("BombardiroCrocodiloEvent") or l_ReplicatedStorage_0:GetAttribute("Starfall") or l_ReplicatedStorage_0:GetAttribute("LosMatteosEventNightTime") or l_ReplicatedStorage_0:GetAttribute("SammyniSpyderiniEvent") or l_ReplicatedStorage_0:GetAttribute("MeowlEvent") or l_ReplicatedStorage_0:GetAttribute("CursedEvent") then
            v14 = 0;
        end;
        if l_ReplicatedStorage_0:GetAttribute("ChicleteiraBicicleteiraEvent") then
            v14 = 6;
        end;
        if l_ReplicatedStorage_0:GetAttribute("WaterEvent") then
            v14 = 14.5;
        end;
        if l_ReplicatedStorage_0:GetAttribute("CrabRave") then
            v14 = 14;
        end;
        if l_ReplicatedStorage_0:GetAttribute("2026Event") or l_ReplicatedStorage_0:GetAttribute("ConcertEvent") or l_ReplicatedStorage_0:GetAttribute("RapConcertEvent") or l_ReplicatedStorage_0:GetAttribute("BrazilEvent") then
            v14 = 0;
            v13 = false;
        end;
        if l_ReplicatedStorage_0:GetAttribute("LanceEvent") then
            v14 = 4;
            v13 = false;
        end;
        if l_ReplicatedStorage_0:GetAttribute("NorthPoleEventActive") and l_LocalPlayer_0:GetAttribute("InNorthPole") then
            v14 = 11;
            v13 = false;
        end;
        local v16 = not v14;
        if not v14 then
            local v17 = workspace:GetServerTimeNow() % 1800;
            if v17 < 900 then
                v14 = 6 + v17 / 900 * 12;
            else
                v14 = 18 + (v17 - 900) / 900 * 12;
                if v14 >= 24 then
                    v14 = v14 - 24;
                end;
            end;
            if l_ReplicatedStorage_0:GetAttribute("ClockTimeOverride") then
                v14 = l_ReplicatedStorage_0:GetAttribute("ClockTimeOverride");
            end;
        end;
        if math.abs(v14 - l_Lighting_0.ClockTime) > 1 and v16 ~= v7 then
            l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(5), {
                ClockTime = v14
            }):Play();
            l_TweenService_0:Create(l_Lighting_0.SunRays, TweenInfo.new(1), {
                Intensity = v13 and 0.071 or 0
            });
        else
            l_Lighting_0.ClockTime = v14;
            l_Lighting_0.SunRays.Intensity = v13 and 0.071 or 0;
        end;
        v7 = v16;
    end
};
v18.Start = function(_) --[[ Line: 160 ]] --[[ Name: Start ]]
    -- upvalues: v6 (ref), v18 (copy), v9 (ref), v5 (copy)
    task.spawn(function() --[[ Line: 161 ]]
        -- upvalues: v6 (ref), v18 (ref)
        while true do
            if not v6 or os.clock() - v6 >= 5 then
                v18:Update();
            end;
            task.wait(1);
        end;
    end);
    v9 = v5:Wait("Cycle");
    v9:OnArrayInserted("Overrides", function() --[[ Line: 173 ]]
        -- upvalues: v18 (ref)
        v18:Update();
    end);
    v9:OnArrayRemoved("Overrides", function() --[[ Line: 177 ]]
        -- upvalues: v18 (ref)
        v18:Update();
    end);
end;
return v18;