local l_SoundService_0 = game:GetService("SoundService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v5 = require(l_Controllers_0.CycleController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v7 = require(l_Packages_0.Net);
local v8 = require(l_Packages_0.Synchronizer);
local v9 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v11 = require(l_Utils_0.StringUtils);
local v12 = v7:RemoteEvent("SoundService/PlayClientSound");
local v13 = {};
local l_Sounds_0 = workspace:WaitForChild("Sounds");
local v15 = TweenInfo.new(3, Enum.EasingStyle.Linear);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v29 = {
    PlaySound = function(_, v18, v19, v20) --[[ Line: 31 ]] --[[ Name: PlaySound ]]
        -- upvalues: v13 (copy), v11 (copy), l_ReplicatedStorage_0 (copy)
        v20 = v20 ~= false;
        local v21 = nil;
        if typeof(v18) == "Instance" and v18:IsA("Sound") then
            v21 = v18;
        elseif typeof(v18) == "string" then
            local v22 = v13[v18];
            if v22 and v22.Parent then
                v21 = v22;
            else
                v13[v18] = v11:ReadPath(l_ReplicatedStorage_0, v18);
                v21 = v13[v18];
            end;
        end;
        if not v21 then
            return warn((("Sound not found for %*"):format(v18)));
        else
            local l_v21_0 = v21;
            if not v19 then
                local v24 = v21:Clone();
                v24.Parent = workspace;
                l_v21_0 = v24;
                if v20 then
                    local v25 = os.clock();
                    while not v24.IsLoaded and os.clock() - v25 < 2 do
                        task.wait();
                    end;
                    if v24.IsLoaded then
                        v24:Play();
                    else
                        v24:Destroy();
                    end;
                else
                    v24:Play();
                end;
                v24.Ended:Once(function() --[[ Line: 83 ]]
                    -- upvalues: v24 (copy)
                    v24:Destroy();
                end);
                return l_v21_0;
            else
                local l_Part_0 = Instance.new("Part");
                l_Part_0.CanCollide = false;
                l_Part_0.CanQuery = false;
                l_Part_0.CanTouch = false;
                l_Part_0.Massless = true;
                l_Part_0.Anchored = true;
                l_Part_0.Parent = workspace;
                l_Part_0.Transparency = 1;
                l_Part_0.Position = v19;
                local v27 = v21:Clone();
                v27.Parent = l_Part_0;
                l_v21_0 = v27;
                if v20 then
                    local v28 = os.clock();
                    while not v27.IsLoaded and os.clock() - v28 < 2 do
                        task.wait();
                    end;
                    if v27.IsLoaded then
                        v27:Play();
                    else
                        l_Part_0:Destroy();
                    end;
                else
                    v27:Play();
                end;
                v27.Ended:Once(function() --[[ Line: 121 ]]
                    -- upvalues: l_Part_0 (copy)
                    l_Part_0:Destroy();
                end);
                return l_v21_0;
            end;
        end;
    end
};
local v30 = 1;
local function v32() --[[ Line: 130 ]] --[[ Name: updateEventMusicVolume ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v30 (ref), v9 (copy), l_SoundService_0 (copy)
    local v31 = l_ReplicatedStorage_0:GetAttribute("KarkerkarKurkurEvent") and 0 or 1;
    if v30 == v31 then
        return;
    else
        v30 = v31;
        v9(l_SoundService_0.Cutscene.WorkspaceSounds.EventMusic, TweenInfo.new(1), {
            Volume = v31
        });
        return;
    end;
end;
v29.UpdateOST = function(_) --[[ Line: 145 ]] --[[ Name: UpdateOST ]]
    -- upvalues: v32 (copy), l_ReplicatedStorage_0 (copy), l_Sounds_0 (copy), l_LocalPlayer_0 (copy), v5 (copy), l_TweenService_0 (copy), v15 (copy)
    local v34 = nil;
    v32();
    if l_ReplicatedStorage_0:GetAttribute("ConcertEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("RapConcertEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("BrazilEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("LanceEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("MexicoEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("IndonesiaEventPart2") then
        v34 = l_Sounds_0.IndonesiaEventPart2;
    elseif l_ReplicatedStorage_0:GetAttribute("IndonesiaEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("KarkerkarKurkurEvent") then
        v34 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("2026EventSound") then
        v34 = l_Sounds_0["2026"];
    elseif l_ReplicatedStorage_0:GetAttribute("NorthPoleEventActive") and l_LocalPlayer_0:GetAttribute("InNorthPole") then
        l_Sounds_0.NorthPole.SoundId = "rbxassetid://107646084688905";
        v34 = l_Sounds_0.NorthPole;
    elseif l_ReplicatedStorage_0:GetAttribute("GingerbreadTownEvent") then
        l_Sounds_0.GingerbreadTown.SoundId = "rbxassetid://133080791201726";
        v34 = l_Sounds_0.GingerbreadTown;
    elseif l_ReplicatedStorage_0:GetAttribute("WinterHourEvent") then
        l_Sounds_0.WinterHour.SoundId = "rbxassetid://88926435140716";
        v34 = l_Sounds_0.WinterHour;
    else
        v34 = if l_ReplicatedStorage_0:GetAttribute("CrabRave") then l_Sounds_0.CrabRave else if l_ReplicatedStorage_0:GetAttribute("RainingTacosEvent") then l_Sounds_0.RainingTacos else if l_ReplicatedStorage_0:GetAttribute("4thOfJulyEvent") then l_Sounds_0["4thOfJuly"] else if l_ReplicatedStorage_0:GetAttribute("10BVisitsEvent") then l_Sounds_0["10B"] else if l_ReplicatedStorage_0:GetAttribute("NyanCatsEvent") then l_Sounds_0.NyanCats else if l_ReplicatedStorage_0:GetAttribute("SammyniSpyderiniEvent") then l_Sounds_0["Sammyni Spyderini"] else if l_ReplicatedStorage_0:GetAttribute("MatteoEvent") or l_ReplicatedStorage_0:GetAttribute("LosMatteosEvent") then l_Sounds_0.Matteo else if l_ReplicatedStorage_0:GetAttribute("UFOEvent") then l_Sounds_0.UFO else if l_ReplicatedStorage_0:GetAttribute("MeowlEvent") then l_Sounds_0.Meowl else if l_ReplicatedStorage_0:GetAttribute("SkibidiEvent") then l_Sounds_0.Skibidi else if l_ReplicatedStorage_0:GetAttribute("TrickOrTreatEvent") then l_Sounds_0["Trick or Treat"] else if l_ReplicatedStorage_0:GetAttribute("YinYangEvent") then l_Sounds_0.YinYang else if l_ReplicatedStorage_0:GetAttribute("GalaxyEvent") then l_Sounds_0.Galaxy else if l_ReplicatedStorage_0:GetAttribute("MoltenEvent") then l_Sounds_0.Night else if l_ReplicatedStorage_0:GetAttribute("CandyEvent") then l_Sounds_0.Candy else if l_ReplicatedStorage_0:GetAttribute("BloodmoonEvent") then l_Sounds_0.Bloodmoon else if l_ReplicatedStorage_0:GetAttribute("RainbowEvent") then l_Sounds_0.Rainbow else if l_ReplicatedStorage_0:GetAttribute("BombardiroCrocodiloEvent") then l_Sounds_0["Bombardiro Crocodilo"] else if v5:IsNight() or l_ReplicatedStorage_0:GetAttribute("LaVaccaEvent") then l_Sounds_0.Night else l_Sounds_0.Day;
    end;
    for _, v36 in l_Sounds_0:GetChildren() do
        if not v36.Name:match("^Ambience_") and v36 ~= l_Sounds_0.LaVacca and v36 ~= l_Sounds_0.Molten and v36 ~= l_Sounds_0["Bombardiro Crocodilo Ambience"] and v36 ~= l_Sounds_0.Concert and v36 ~= l_Sounds_0.RapConcert and v36 ~= l_Sounds_0.BrazilEvent and v36 ~= l_Sounds_0.LanceEvent1 and v36 ~= l_Sounds_0.LanceEvent2 and v36 ~= l_Sounds_0.MexicoEvent and v36 ~= l_Sounds_0.IndonesiaEvent then
            local l_v36_Attribute_0 = v36:GetAttribute("DefaultVolume");
            if not l_v36_Attribute_0 then
                v36:SetAttribute("DefaultVolume", v36.Volume);
                l_v36_Attribute_0 = v36.Volume;
            end;
            if v36 == v34 then
                if not v36.IsPlaying then
                    v36.Volume = 0;
                    l_TweenService_0:Create(v36, v15, {
                        Volume = l_v36_Attribute_0
                    }):Play();
                    v36:Play();
                end;
            elseif v36.IsPlaying then
                local v38 = l_TweenService_0:Create(v36, v15, {
                    Volume = 0
                });
                v38.Completed:Once(function() --[[ Line: 250 ]]
                    -- upvalues: v36 (copy)
                    v36:Stop();
                end);
                v38:Play();
            end;
        end;
    end;
    if l_ReplicatedStorage_0:GetAttribute("MoltenEvent") == true then
        if not l_Sounds_0.Molten.IsPlaying then
            l_Sounds_0.Molten:Play();
        end;
    elseif l_Sounds_0.Molten.IsPlaying then
        l_Sounds_0.Molten:Stop();
    end;
    if l_ReplicatedStorage_0:GetAttribute("BombardiroCrocodiloEventSoundTrack") == true then
        if not l_Sounds_0["Bombardiro Crocodilo Ambience"].IsPlaying then
            l_Sounds_0["Bombardiro Crocodilo Ambience"]:Play();
        end;
    elseif l_Sounds_0["Bombardiro Crocodilo Ambience"].IsPlaying then
        l_Sounds_0["Bombardiro Crocodilo Ambience"]:Stop();
    end;
    if l_ReplicatedStorage_0:GetAttribute("Effect_Space") == true then
        if not l_Sounds_0.LaVacca.IsPlaying then
            l_Sounds_0.LaVacca:Play();
        end;
    elseif l_Sounds_0.LaVacca.IsPlaying then
        l_Sounds_0.LaVacca:Stop();
    end;
    if l_ReplicatedStorage_0:GetAttribute("GlitchEvent") == true then
        if not l_Sounds_0.Glitch.IsPlaying then
            l_Sounds_0.Glitch:Play();
            l_TweenService_0:Create(l_Sounds_0.Glitch, v15, {
                Volume = 0.1
            }):Play();
            return;
        end;
    elseif l_Sounds_0.Glitch.IsPlaying and l_Sounds_0.Glitch.Volume > 1.0E-4 then
        local v39 = l_TweenService_0:Create(l_Sounds_0.Glitch, v15, {
            Volume = 0
        });
        v39:Play();
        v39.Completed:Once(function() --[[ Line: 296 ]]
            -- upvalues: l_Sounds_0 (ref)
            if l_Sounds_0.Glitch.IsPlaying and l_Sounds_0.Glitch.Volume <= 1.0E-4 then
                l_Sounds_0.Glitch:Stop();
            end;
        end);
    end;
end;
v29.UpdateAmbience = function(_) --[[ Line: 305 ]] --[[ Name: UpdateAmbience ]]
    -- upvalues: l_Sounds_0 (copy), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), v15 (copy)
    local v41 = {
        Rain = l_Sounds_0:FindFirstChild("Ambience_Rain"), 
        Snow = l_Sounds_0:FindFirstChild("Ambience_Snow"), 
        Starfall = l_Sounds_0:FindFirstChild("Ambience_Starfall"), 
        Water = l_Sounds_0:FindFirstChild("Ambience_Water"), 
        Strawberry = l_Sounds_0:FindFirstChild("Ambience_Strawberry"), 
        Extinct = l_Sounds_0:FindFirstChild("Ambience_Extinct"), 
        ["Witching Hour"] = l_Sounds_0:FindFirstChild("Ambience_Witching Hour"), 
        Indonesia = l_Sounds_0:FindFirstChild("Ambience_IndonesiaEvent"), 
        Radioactive = l_Sounds_0:FindFirstChild("Ambience_Radioactive"), 
        Cursed = l_Sounds_0:FindFirstChild("Ambience_Cursed")
    };
    local v42 = nil;
    if l_ReplicatedStorage_0:GetAttribute("LanceEvent") then
        v42 = nil;
    elseif l_ReplicatedStorage_0:GetAttribute("IndonesiaEventAmbience") then
        v42 = v41.Indonesia;
    elseif l_ReplicatedStorage_0:GetAttribute("RadioactiveEvent") then
        v42 = v41.Radioactive;
    elseif l_ReplicatedStorage_0:GetAttribute("CursedEvent") then
        v42 = v41.Cursed;
    elseif l_ReplicatedStorage_0:GetAttribute("Starfall") then
        v42 = v41.Starfall;
    elseif l_ReplicatedStorage_0:GetAttribute("Rain") or l_ReplicatedStorage_0:GetAttribute("LosMatteosEvent") then
        v42 = v41.Rain;
    elseif l_ReplicatedStorage_0:GetAttribute("WaterEvent") then
        v42 = v41.Water;
    elseif l_ReplicatedStorage_0:GetAttribute("Snow") then
        v42 = v41.Snow;
    elseif l_ReplicatedStorage_0:GetAttribute("StrawberryEvent") then
        v42 = v41.Strawberry;
    elseif l_ReplicatedStorage_0:GetAttribute("ExtinctEvent") then
        v42 = v41.Extinct;
    elseif l_ReplicatedStorage_0:GetAttribute("GraveyardEvent") then
        v42 = v41["Witching Hour"];
    elseif l_ReplicatedStorage_0:GetAttribute("WitchingHourEvent") then
        v42 = v41["Witching Hour"];
    end;
    for _, v44 in pairs(v41) do
        if v44 then
            local l_v44_Attribute_0 = v44:GetAttribute("DefaultVolume");
            if not l_v44_Attribute_0 then
                v44:SetAttribute("DefaultVolume", v44.Volume);
                l_v44_Attribute_0 = v44.Volume;
            end;
            if v44 == v42 then
                if not v44.IsPlaying then
                    v44.Volume = 0;
                    v44:Play();
                    l_TweenService_0:Create(v44, v15, {
                        Volume = l_v44_Attribute_0
                    }):Play();
                end;
            elseif v44.IsPlaying then
                local v46 = l_TweenService_0:Create(v44, v15, {
                    Volume = 0
                });
                v46.Completed:Once(function() --[[ Line: 367 ]]
                    -- upvalues: v44 (copy)
                    v44:Stop();
                end);
                v46:Play();
            end;
        end;
    end;
end;
v29.Start = function(_) --[[ Line: 376 ]] --[[ Name: Start ]]
    -- upvalues: v12 (copy), v29 (copy), v8 (copy), l_LocalPlayer_0 (copy), l_SoundService_0 (copy)
    v12.OnClientEvent:Connect(function(...) --[[ Line: 377 ]]
        -- upvalues: v29 (ref)
        v29:PlaySound(...);
    end);
    task.spawn(function() --[[ Line: 381 ]]
        -- upvalues: v29 (ref)
        while task.wait(4) do
            v29:UpdateOST();
            v29:UpdateAmbience();
        end;
    end);
    v8:WaitAndCall(l_LocalPlayer_0, function(v48) --[[ Line: 388 ]]
        -- upvalues: l_SoundService_0 (ref)
        v48:OnChanged("Settings.Music", function(v49) --[[ Line: 389 ]]
            -- upvalues: l_SoundService_0 (ref)
            l_SoundService_0:WaitForChild("Cutscene"):WaitForChild("WorkspaceSounds").Volume = v49 and 1 or 0;
        end, true);
        v48:OnChanged("Settings.Sound Effects", function(v50) --[[ Line: 393 ]]
            -- upvalues: l_SoundService_0 (ref)
            l_SoundService_0:WaitForChild("Sound Effects").Volume = v50 and 1 or 0;
        end, true);
        v48:OnChanged("Settings.Sound Effects", function(v51) --[[ Line: 397 ]]
            -- upvalues: l_SoundService_0 (ref)
            l_SoundService_0:WaitForChild("ToolsSounds").Volume = v51 and 1 or 0;
        end, true);
    end);
end;
return v29;