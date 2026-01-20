local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net):RemoteEvent("UseItem");
local l_NightVision_0 = script.NightVision;
local l_Nickname_0 = script.Nickname;
local v8 = false;
local v9 = {};
local function v15() --[[ Line: 20 ]] --[[ Name: Disable ]]
    -- upvalues: v8 (ref), l_Players_0 (copy)
    v8 = false;
    for _, v11 in l_Players_0:GetPlayers() do
        task.spawn(function() --[[ Line: 23 ]]
            -- upvalues: v11 (copy)
            local v12 = v11.Character or v11.CharacterAdded:Wait();
            if v12 then
                for _, v14 in v12:GetDescendants() do
                    if v14.Name == "NightVisionGoogles" then
                        v14:Destroy();
                    end;
                end;
            end;
        end);
    end;
end;
local function v24(v16) --[[ Line: 36 ]] --[[ Name: CreateVisionPartsOnPlayer ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_NightVision_0 (copy), l_Nickname_0 (copy)
    local v17 = v16.Character or v16.CharacterAdded:Wait();
    local l_Head_0 = v17:WaitForChild("Head");
    if v16.Name ~= l_LocalPlayer_0.Name then
        for _, v20 in v17:GetChildren() do
            if v20:IsA("BasePart") and v20.Name ~= "__HITBOX" and v20:FindFirstChild("NightVisionGoogles") == nil then
                for v21 = 1, 6 do
                    local v22 = l_NightVision_0:Clone();
                    v22.Parent = v20;
                    v22.Face = v21 - 1;
                    v22.Name = "NightVisionGoogles";
                end;
            end;
        end;
        local v23 = l_Nickname_0:Clone();
        v23.TextLabel.Text = v16.Name;
        v23.Parent = l_Head_0;
        v23.Name = "NightVisionGoogles";
    end;
end;
local function v27() --[[ Line: 57 ]] --[[ Name: Enable ]]
    -- upvalues: v8 (ref), l_Players_0 (copy), v24 (copy)
    v8 = true;
    for _, v26 in l_Players_0:GetPlayers() do
        task.spawn(function() --[[ Line: 60 ]]
            -- upvalues: v24 (ref), v26 (copy)
            v24(v26);
        end);
    end;
end;
v5.OnClientEvent:Connect(function(v28, v29) --[[ Line: 66 ]]
    -- upvalues: v15 (copy), v27 (copy)
    if v28 ~= "EnableNightVisionCape" and v28 ~= "EnableNightVision" then
        return;
    elseif not v29 then
        v15();
        return;
    else
        v27();
        return;
    end;
end);
l_Players_0.PlayerAdded:Connect(function(v30) --[[ Line: 77 ]]
    -- upvalues: v8 (ref), v24 (copy)
    if v8 then
        v24(v30);
    end;
end);
v9.Enable = v27;
v9.Disable = v15;
task.spawn(function() --[[ Line: 86 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Players_0 (copy), v27 (copy), v15 (copy)
    local v31 = require(l_ReplicatedStorage_0.Packages.Observers);
    v31.observeCharacter(l_Players_0.LocalPlayer, function(_, v33) --[[ Line: 88 ]]
        -- upvalues: v31 (copy), v27 (ref), v15 (ref)
        return v31.observeChildren(v33, function(v34) --[[ Line: 89 ]]
            -- upvalues: v31 (ref), v27 (ref), v15 (ref)
            if not v34:IsA("Tool") or v34.Name ~= "Witch's Broom" then
                return nil;
            else
                return v31.observeAttribute(v34, "IsActive", function(v35) --[[ Line: 94 ]]
                    -- upvalues: v27 (ref), v15 (ref)
                    if not v35 then
                        return;
                    else
                        task.spawn(v27);
                        return v15;
                    end;
                end);
            end;
        end);
    end);
end);
return v9;