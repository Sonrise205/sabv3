local l_Players_0 = game:GetService("Players");
local _ = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Render);
local function _(v4, v5) --[[ Line: 9 ]] --[[ Name: GetOriginal ]]
    local v6 = ("Original%*"):format(v5);
    local l_v4_Attribute_0 = v4:GetAttribute(v6);
    if l_v4_Attribute_0 == nil then
        local v8 = v4[v5];
        v4:SetAttribute(v6, v8);
        l_v4_Attribute_0 = v8;
    end;
    return l_v4_Attribute_0;
end;
local function _(v10, v11, v12) --[[ Line: 20 ]] --[[ Name: Set ]]
    local v13 = ("Original%*"):format(v11);
    local l_v10_Attribute_0 = v10:GetAttribute(v13);
    if l_v10_Attribute_0 == nil then
        local v15 = v10[v11];
        v10:SetAttribute(v13, v15);
        l_v10_Attribute_0 = v15;
    end;
    local l_l_v10_Attribute_0_0 = l_v10_Attribute_0;
    if v12 == nil then
        v12 = l_l_v10_Attribute_0_0;
    end;
    v10[v11] = v12;
end;
local function v28(v18, v19) --[[ Line: 28 ]] --[[ Name: SetGiantSteps ]]
    local l_PrimaryPart_0 = v18.PrimaryPart;
    if not l_PrimaryPart_0 then
        return;
    else
        local v21 = l_PrimaryPart_0:WaitForChild("Running", 30);
        assert(v21:IsA("Sound"));
        local v22 = v19 and "rbxassetid://72918943937811" or nil;
        local l_v21_Attribute_0 = v21:GetAttribute("OriginalSoundId");
        if l_v21_Attribute_0 == nil then
            local l_SoundId_0 = v21.SoundId;
            v21:SetAttribute("OriginalSoundId", l_SoundId_0);
            l_v21_Attribute_0 = l_SoundId_0;
        end;
        local l_l_v21_Attribute_0_0 = l_v21_Attribute_0;
        if v22 == nil then
            v22 = l_l_v21_Attribute_0_0;
        end;
        v21.SoundId = v22;
        v22 = v19 and 1.9040000000000001 or nil;
        l_v21_Attribute_0 = v21:GetAttribute("OriginalPlaybackSpeed");
        if l_v21_Attribute_0 == nil then
            local l_PlaybackSpeed_0 = v21.PlaybackSpeed;
            v21:SetAttribute("OriginalPlaybackSpeed", l_PlaybackSpeed_0);
            l_v21_Attribute_0 = l_PlaybackSpeed_0;
        end;
        l_l_v21_Attribute_0_0 = l_v21_Attribute_0;
        if v22 == nil then
            v22 = l_l_v21_Attribute_0_0;
        end;
        v21.PlaybackSpeed = v22;
        v22 = v19 and 3 or nil;
        l_v21_Attribute_0 = v21:GetAttribute("OriginalVolume");
        if l_v21_Attribute_0 == nil then
            local l_Volume_0 = v21.Volume;
            v21:SetAttribute("OriginalVolume", l_Volume_0);
            l_v21_Attribute_0 = l_Volume_0;
        end;
        l_l_v21_Attribute_0_0 = l_v21_Attribute_0;
        if v22 == nil then
            v22 = l_l_v21_Attribute_0_0;
        end;
        v21.Volume = v22;
        return;
    end;
end;
local function v31(_, v30) --[[ Line: 56 ]] --[[ Name: WatchCharacter ]]
    -- upvalues: v28 (copy)
    v30:WaitForChild("HumanoidRootPart", 30);
    v30:GetAttributeChangedSignal("GiantSteps"):Connect(function() --[[ Line: 58 ]]
        -- upvalues: v28 (ref), v30 (copy)
        v28(v30, v30:GetAttribute("GiantSteps") == true);
    end);
    v28(v30, v30:GetAttribute("GiantSteps") == true);
end;
local function v35(v32) --[[ Line: 64 ]] --[[ Name: WatchPlayer ]]
    -- upvalues: v31 (copy)
    v32.CharacterAdded:Connect(function(v33) --[[ Line: 65 ]]
        -- upvalues: v31 (ref), v32 (copy)
        v31(v32, v33);
    end);
    local l_Character_0 = v32.Character;
    if l_Character_0 then
        task.spawn(v31, v32, l_Character_0);
    end;
end;
l_Players_0.PlayerAdded:Connect(function(v36) --[[ Line: 74 ]]
    -- upvalues: v31 (copy)
    v36.CharacterAdded:Connect(function(v37) --[[ Line: 65 ]]
        -- upvalues: v31 (ref), v36 (copy)
        v31(v36, v37);
    end);
    local l_Character_1 = v36.Character;
    if l_Character_1 then
        task.spawn(v31, v36, l_Character_1);
    end;
end);
for _, v40 in ipairs(l_Players_0:GetPlayers()) do
    task.spawn(v35, v40);
end;